resource "aws_instance" "my_instance" {
    
    ami           = "ami-0453ec754f44f9a4a"
    instance_type = "t2.micro"
                            #<PROVIDER_TYPE.NAME.ATTRIBUTE>
    vpc_security_group_ids = [aws_security_group.instance.id]

    key_name = "demoRSA"

    user_data = filebase64("ec2-user-data.sh")     


    tags = {
        Name = "JumpHost" # instance name
    }

}

resource "aws_security_group" "instance" {
    name = "jump_host_sg"

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}