provider "aws" {
    region = "ap-south-1"
}

//s3

resource "aws_s3_bucket" "dsd" {
    bucket = "dsd"
    acl = "private"
    
    versioning {
        enabled = false
    }
 
    tags = {
        name = "ds"
    }

}
