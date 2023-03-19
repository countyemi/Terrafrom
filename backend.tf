terraform {
    backend "s3" {
    bucket = "bootcamp30-2207-countyemi"
    key = "statefile/boot-30projs.tf"
    encrypt = true
    region = "us-east-1"
  
   
}
} 
