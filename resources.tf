#create KMS key
resource "aws_kms_key" "state-key" {
    description = "KMS key for state bucket"
  
}

# create s3 bucket with name "bootcamp30-11-countyemi"
resource "aws_s3_bucket" "state-bucket" {

    bucket = "bootcamp30-11-countyemi"
    acl = "private"
    # versioning enaled
    versioning {
        enabled = true
    }
    #enable server side encryption with "state-key"

    server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "aws:kms"
            kms_master_key_id = aws_kms_key.state-key.id
        
      }

      }
    }
}

#create the dynamo table lock to be used by state-bucket
resource "aws_dynamodb_table" "terraform_locks" {
name         = "state-bucket-locks"
hash_key     = "LockID"
read_capacity = 3
write_capacity = 3

attribute {
name = "LockID"
type = "S"
      }
}
