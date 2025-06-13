#!/bin/bash

# Terraform Import Commands for Existing IAM Resources
# Run these commands from the terraform/prod/iam directory after running 'terraform init'

echo "Starting Terraform imports for existing IAM resources..."

# Function to convert username to terraform resource name
username_to_resource() {
    echo "$1" | sed 's/[^a-zA-Z0-9]/_/g' | sed 's/__*/_/g' | sed 's/^_//g' | sed 's/_$//g'
}

# Import all IAM Users and generate users.tf
echo "Fetching all IAM users from AWS..."
users=$(aws iam list-users --query 'Users[].UserName' --output text)

if [ -z "$users" ]; then
    echo "No IAM users found or AWS CLI not configured properly"
    exit 1
fi

echo "Found IAM users: $users"
echo "Generating users.tf file..."

# Generate users.tf header
cat > users.tf << 'EOF'
# IAM Users - Auto-generated from AWS

EOF

# Generate user resources and import commands
echo "Importing IAM Users..."
for user in $users; do
    resource_name=$(username_to_resource "$user")
    echo "Processing user: $user as aws_iam_user.${resource_name}"
    
    # Add user resource to users.tf
    cat >> users.tf << EOF
resource "aws_iam_user" "${resource_name}" {
  name = "${user}"
  path = "/"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

EOF
    
    # Import the user
    terraform import "aws_iam_user.${resource_name}" "$user" || echo "Warning: Failed to import user $user"
    
    # Get and import user policies
    echo "Fetching policies for user: $user"
    attached_policies=$(aws iam list-attached-user-policies --user-name "$user" --query 'AttachedPolicies[].PolicyArn' --output text 2>/dev/null)
    
    if [ -n "$attached_policies" ]; then
        for policy_arn in $attached_policies; do
            policy_name=$(echo "$policy_arn" | awk -F'/' '{print $NF}')
            attachment_resource="${resource_name}_$(echo "$policy_name" | sed 's/[^a-zA-Z0-9]/_/g' | tr '[:upper:]' '[:lower:]')"
            
            # Add policy attachment to users.tf
            if [[ "$policy_arn" == arn:aws:iam::aws:* ]]; then
                # AWS managed policy
                cat >> users.tf << EOF
resource "aws_iam_user_policy_attachment" "${attachment_resource}" {
  user       = aws_iam_user.${resource_name}.name
  policy_arn = "${policy_arn}"
}

EOF
            else
                # Custom policy - try to match with existing policy resources
                policy_resource_name=""
                case "$policy_name" in
                    "CustomCreateAndReadAllSecretsInThisAccount")
                        policy_resource_name="secrets_manager_policy"
                        ;;
                    "BitbucketEC2RouteTablePolicy")
                        policy_resource_name="ec2_route_table_policy"
                        ;;
                    "GenericReadOnlyPolicy")
                        policy_resource_name="generic_readonly_policy"
                        ;;
                    *)
                        policy_resource_name=$(username_to_resource "$policy_name")
                        ;;
                esac
                
                cat >> users.tf << EOF
resource "aws_iam_user_policy_attachment" "${attachment_resource}" {
  user       = aws_iam_user.${resource_name}.name
  policy_arn = aws_iam_policy.${policy_resource_name}.arn
}

EOF
            fi
            
            # Import the policy attachment
            echo "Importing policy attachment: ${user}/${policy_arn}"
            terraform import "aws_iam_user_policy_attachment.${attachment_resource}" "${user}/${policy_arn}" || echo "Warning: Failed to import policy attachment for $user"
        done
    fi
done

echo "users.tf file generated successfully!"

# Generate outputs.tf with all user ARNs
echo "Updating outputs.tf with user references..."
cat > outputs_users.txt << 'EOF'
output "user_arns" {
  description = "ARNs of all IAM users"
  value = {
EOF

# Add each user to the output
for user in $users; do
    resource_name=$(username_to_resource "$user")
    echo "    ${resource_name} = aws_iam_user.${resource_name}.arn" >> outputs_users.txt
done

cat >> outputs_users.txt << 'EOF'
  }
}

EOF

# Update outputs.tf by replacing the commented section
sed -i.bak '/# Output for all user ARNs/,/# }/d' outputs.tf
cat outputs_users.txt >> outputs.tf
rm outputs_users.txt

echo "outputs.tf updated with user references!"

# Discover and add missing custom policies to policies.tf
echo "Checking for custom policies that need to be added to policies.tf..."
all_custom_policies=$(aws iam list-policies --scope Local --query 'Policies[].{PolicyName:PolicyName,Arn:Arn}' --output json)

if [ "$all_custom_policies" != "[]" ]; then
    echo "Found custom policies, checking if they exist in policies.tf..."
    
    # Read existing policies.tf to see what's already defined
    existing_policies=$(grep -o 'resource "aws_iam_policy" "[^"]*"' policies.tf 2>/dev/null | sed 's/resource "aws_iam_policy" "//g' | sed 's/"//g' || echo "")
    
    echo "$all_custom_policies" | jq -r '.[] | "\(.PolicyName)|\(.Arn)"' | while IFS='|' read -r policy_name policy_arn; do
        # Convert policy name to resource name
        policy_resource_name=""
        case "$policy_name" in
            "CustomCreateAndReadAllSecretsInThisAccount")
                policy_resource_name="secrets_manager_policy"
                ;;
            "BitbucketEC2RouteTablePolicy")
                policy_resource_name="ec2_route_table_policy"
                ;;
            "GenericReadOnlyPolicy")
                policy_resource_name="generic_readonly_policy"
                ;;
            *)
                policy_resource_name=$(username_to_resource "$policy_name")
                ;;
        esac
        
        # Check if policy resource already exists in policies.tf
        if ! echo "$existing_policies" | grep -q "^${policy_resource_name}$"; then
            echo "Adding missing policy to policies.tf: $policy_name"
            
            # Get policy document
            policy_document=$(aws iam get-policy --policy-arn "$policy_arn" --query 'Policy.{PolicyName:PolicyName,Description:Description}' --output json)
            policy_version=$(aws iam get-policy-version --policy-arn "$policy_arn" --version-id $(aws iam get-policy --policy-arn "$policy_arn" --query 'Policy.DefaultVersionId' --output text) --query 'PolicyVersion.Document' --output json)
            
            # Add policy resource to policies.tf
            cat >> policies.tf << EOF

# Auto-discovered custom policy: ${policy_name}
resource "aws_iam_policy" "${policy_resource_name}" {
  name = "${policy_name}"
  path = "/"
  
  policy = jsonencode(${policy_version})
}
EOF
        fi
    done
fi

# Import all Custom IAM Policies
echo "Importing all Custom IAM Policies..."
echo "$all_custom_policies" | jq -r '.[] | "\(.PolicyName)|\(.Arn)"' | while IFS='|' read -r policy_name policy_arn; do
    # Convert policy name to resource name
    policy_resource_name=""
    case "$policy_name" in
        "CustomCreateAndReadAllSecretsInThisAccount")
            policy_resource_name="secrets_manager_policy"
            ;;
        "BitbucketEC2RouteTablePolicy")
            policy_resource_name="ec2_route_table_policy"
            ;;
        "GenericReadOnlyPolicy")
            policy_resource_name="generic_readonly_policy"
            ;;
        *)
            policy_resource_name=$(username_to_resource "$policy_name")
            ;;
    esac
    
    echo "Importing custom policy: $policy_name as aws_iam_policy.${policy_resource_name}"
    terraform import "aws_iam_policy.${policy_resource_name}" "$policy_arn" || echo "Warning: Failed to import policy $policy_name"
done

echo "Import process completed. Run 'terraform plan' to verify the configuration matches the existing resources."