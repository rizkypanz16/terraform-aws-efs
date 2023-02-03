terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "4.49.0"
        }
    }
}

# mendefinisikan provider setting
provider "aws" {
    access_key = "<secret_key>"						# rubah <access_key> dengan aws api access_key milik anda
    secret_key = "<secret_key>"						# rubah <secret_key> dengan aws api secret_key milik anda
    region     = "us-east-1"
}

## General
resource "aws_efs_file_system" "my-efs" {
  creation_token            = "my-efs"
  availability_zone_name    = "us-east-1a"			
  throughput_mode           = "bursting"
  encrypted                 = true

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }

  tags = {
    Name = "my-efs"
  }
}

## Automatic Backups
resource "aws_efs_backup_policy" "backup" {
  file_system_id = aws_efs_file_system.my-efs.id

  backup_policy {
    status = "DISABLED"
  }
}

## Network 
resource "aws_efs_mount_target" "example" {
  file_system_id = aws_efs_file_system.my-efs.id
  subnet_id       = "<subnet_id>"						# rubah subnet_id menjadi subnet_id pada subnet vpc network anda
  security_groups = ["<sg-id>"]							# rubah <sg-id> dengan security_groups_id anda
}



