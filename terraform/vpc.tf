#VPC
resource "aws_vpc" "myvpc"{
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "MyVPC"
    }
}

#public subnet
resource "aws_subnet" "PublicSubnet-ecs"{
    vpc_id = aws_vpc.myvpc.id
    availability_zone = "us-west-1a"
    cidr_block = "10.0.1.0/24"
}

#private subnet
resource "aws_subnet" "PrivSubnet-ecs"{
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = true

}

#IGW
resource "aws_internet_gateway" "myIgw"{
    vpc_id = aws_vpc.myvpc.id
}

#Route Tables for public subnet
resource "aws_route_table" "PublicRT"{
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.myIgw.id
    }
}
 
route table association public subnet 
resource "aws_route_table_association" "PublicRTAssociation"{
    subnet_id = aws_subnet.PublicSubnet-ecs.id
    route_table_id = aws_route_table.PublicRT.id
}
