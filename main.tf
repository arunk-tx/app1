provider "aws" {
    region = "ap-south-1"
}

//s3

resource "aws_s3_bucket" "dss" {
    bucket = "dss"
    acl = "private"
    
    versioning {
        enabled = false
    }
 
    tags = {
        name = "fd"
    }

}
