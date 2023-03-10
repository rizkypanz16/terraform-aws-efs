## Provision AWS S3 Bucket using Terraform

### Steps to provision AWS S3 Bucket with terraform :

- Clone repository
```
git clone https://github.com/rizkypanz16/terraform-aws-efs.git
```
- Change the configuration below with the aws configuration you have made 
```
<access_key>
<secret_key>
<subnet-id>
<sg-id>
```
- Init - Initialized terraform provider
```
terraform init
```
- Plan - Preview changes before applying.
```
terraform plan
```
- Apply - Provision reproducible infrastructure.
```
terraform apply
```
