# Private Subnet one
resource "aws_subnet" "private_zone1" {

    # vpc association
    vpc_id            = aws_vpc.main.id
    # cidr ip range alocation -  enable ipv4
    cidr_block = "10.0.0.0/19"
    # availability zone
    availability_zone = local.zone1

    
    tags = {
        # Name of the subnet
        "Name" = "${local.env}-private-${local.zone1}" 
        # must be tagged - to exposing services internally within the VPC
        "kubernetes.io/role/internal-elb" = "1" 
        # this is recomanded and value can be owned either shared
        "kbernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"

    }
}

# Private Subnet two
resource "aws_subnet" "private_zone2" {

    # vpc association
    vpc_id            = aws_vpc.main.id
    # cidr ip range alocation -  enable ipv4
    cidr_block = "10.0.32.0/19"
    # availability zone
    availability_zone = local.zone2

    
    tags = {
        # Name of the subnet
        "Name" = "${local.env}-private-${local.zone2}" 
        # must be tagged - to exposing services internally within the VPC
        "kubernetes.io/role/internal-elb" = "1" 
        # this is recomanded and value can be owned either shared
        "kbernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"

    } 

}

# Public Subnet for zone1
resource "aws_subnet" "public_zone1" {
    # vpc association
    vpc_id            = aws_vpc.main.id
    # cidr ip range alocation -  enable ipv4
    cidr_block = "10.0.64.0/19"
    # availability zone
    availability_zone = local.zone1
    map_public_ip_on_launch = true

    tags = {
        # Name of the subnet
        "Name" = "${local.env}-public-${local.zone1}" 
        # must be tagged - eks will use to discover subnet to create public load balancer
        "kubernetes.io/role/elb" = "1" 
        # this is recomanded and value can be owned either shared
        "kbernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"

    }

}

# Public Subnet for zone2
resource "aws_subnet" "public_zone2" {
    # vpc association
    vpc_id            = aws_vpc.main.id
    # cidr ip range alocation -  enable ipv4
    cidr_block = "10.0.96.0/19"
    # availability zone
    availability_zone = local.zone2
    map_public_ip_on_launch = true

    tags = {
        # Name of the subnet
        "Name" = "${local.env}-public-${local.zone2}" 
        # must be tagged - eks will use to discover subnet to create public load balancer
        "kubernetes.io/role/elb" = "1" 
        # this is recomanded and value can be owned either shared
        "kbernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"

    }

}