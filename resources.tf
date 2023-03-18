# create s3 bucket with name "bootcamp30-11-countyemi"
resource "aws_s3_bucket" "state-bucket" {

    bucket = "bootcamp30-11-countyemi"
    acl = "private"
    # versioning enaled
    verioning {
        enabled = true
    }
}