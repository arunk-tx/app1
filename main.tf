provider "aws" {
    region = "ap-south-1"
}

//ec2

resource "aws_instance"  {
    ami = "ami-0a0ed52460857b894"
    instance_type = "t2.micro"
    count = 2
    security_groups = [resource.aws_security_group.TF_SG.name] 
    key_name = resource.aws_key_pair.Tf_Key.key_name

}

resource "aws_security_group" "TF_SG" {
    name        = "SG FROM TERRAFORM"
    description = "SG FROM TERRAFORM"
    vpc_id      =  "vpc-01c9230458ed92a45"

    ingress {
        description      = "HTTPS" 
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        description      = "HTTP"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        description      = "SSH"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "TF_SG"
    }
}

// creating key-pair in AWS and downloads pem file in your local system

resource "aws_key_pair" "Tf_Key" {
    key_name   = "Tf_key"
    public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

resource "local_file" "Tf_Key" {
    content  = tls_private_key.rsa.private_key_pem
    filename = "Tf_key.pem"
}
