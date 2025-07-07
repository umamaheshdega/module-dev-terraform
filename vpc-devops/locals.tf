locals {
    az_names = slice(data.aws_availability_zones.available.names, 0 , 3)
    default_vpc_id = data.aws_vpc.default.id
    default_vpc_cidr = data.aws_vpc.default.cidr_block
}