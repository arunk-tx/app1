provider "aws" {
    region = "ap-south-1"
}

//s3

resource "aws_s3_bucket" "fd" {
    bucket = "fd"
    acl = "private"
    
    versioning {
        enabled = false
    }
 
    tags = {
        name = "dsds"
    }

}
