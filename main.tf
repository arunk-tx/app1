provider "aws" {
    region = "ap-south-1"
}

//s3

resource "aws_s3_bucket" "singhshubham" {
    bucket = "singhshubham"
    acl = "public"
    
    versioning {
        enabled = false
    }
 
    tags = {
        name = "a"
    }

}
