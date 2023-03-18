terraform {
    backend "s3" {
    bucket = "bootcamp30-11-countyemi"
    key = "statefile/boot-30projs.tf"
    encrypt = true
    region = "us-east-1"
    dynamodb_table = "state-bucket-locks"
   
}
} 