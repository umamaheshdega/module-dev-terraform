variable "vpc_cidr"{
    
}

variable "enable_dns_hostnames" {
    default = true
}

variable "project_name" {

}

variable "environment" {

}


variable "common_tags" {
    type = map

}
variable "vpc_tags" {
    default = {}
    
}

variable "public_subnet_cidrs" {
    type = list
    validation {
        condition     = length(var.public_subnet_cidrs) == 2
        error_message = "Please provide 2 valid public subnet CIDR"
    }

}

variable "igw_tags" {
    default = {}

}

variable "public_subnet_tags" {
    default = {}

}

variable "private_subnet_cidrs" {
    type = list
    validation {
        condition     = length(var.private_subnet_cidrs) == 2
        error_message = "Please provide 2 valid public subnet CIDR"
    }
}

variable "private_subnet_tags" {
    default = {}

}


variable "database_subnet_cidrs" {
    type = list
    validation {
        condition     = length(var.database_subnet_cidrs) == 2
        error_message = "Please provide 2 valid public subnet CIDR"
    }
}

variable "database_subnet_tags" {
    default = {}

}

resource "aws_eip" "nat" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = merge (
    var.common_tags,
    var.nat_gateway_tags,
    {
        name = "${var.project_name}-${var.environment}-NAT"
    }
  )
   

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

variable "nat_gateway_tags" {
    default = {}

}

variable "public_route_table_tags"{
    default = {}
}

variable "private_route_table_tags" {
    default = {}

}

variable "database_route_table_tags" {
    default = {}
}

variable "is_peering_required" {
    default = {}

}

variable "vpc_peering_tags" {
    default = {}

}


