resource "aws_internet_gateway" "igw" {
    # create association to the VPC (main)
    vpc_id = aws_vpc.main.id
    
    tags = {
        "Name" = "${local.env}-igw"
    }
  
}