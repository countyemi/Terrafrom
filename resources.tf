#create KMS key
resource "aws_kms_key" "state-key" {
    description = "KMS key for state bucket"
  
}

#generate a random integer 
resource "random_integer" "random-number" {
  min = 1
  max = 5000
}

# create s3 bucket with name "bootcamp30-11-countyemi"
resource "aws_s3_bucket" "state-bucket" {

    bucket = "${var.bucket-name-prefix}-${random_integer.random-number.result}-${var.bucket-name-suffix}"

    acl = "private"
    

    server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "aws:kms"
            kms_master_key_id = aws_kms_key.state-key.id
        
      }

      }
    }
}

