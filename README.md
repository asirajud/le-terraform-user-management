# IAM Management with Terraform

This directory contains Terraform configuration for managing IAM users and policies in the production environment.

## Structure

- `main.tf` - Provider configuration and Terraform settings
- `users.tf` - IAM user definitions and policy attachments
- `policies.tf` - Custom IAM policy definitions
- `outputs.tf` - Output values for user and policy ARNs
- `import.sh` - Script to import existing AWS resources into Terraform state

## Getting Started

### 1. Initialize Terraform

```bash
cd prod/iam
terraform init
```

### 2. Import Existing Resources

Before making any changes, import existing AWS resources into Terraform state:

```bash
./import.sh
```

### 3. Verify Configuration

After importing, verify that the configuration matches existing resources:

```bash
terraform plan
```

The plan should show no changes if the configuration matches the existing AWS resources.

### 4. Apply Changes

Once verified, you can make changes to the configuration and apply them:

```bash
terraform apply
```

## Notes

- All resources are tagged with `ManagedBy = "terraform"` for identification
- Resources are tagged with appropriate `Environment` and `Purpose` tags
- The configuration is designed to be imported from existing AWS resources
