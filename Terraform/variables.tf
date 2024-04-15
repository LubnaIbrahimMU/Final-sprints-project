# variable "public_subnet_id" {
#   description = "Available cidr blocks for public subnets."
#   type = string
# }

# variable "vpc_id" {
#   type = string
# }

# variable "subnet_ids" {
#   type = list(string)

# }

# variable "script" {

# }

# variable "worker" {

# }


variable "subnet_ids" {
  type = list(string)

}

variable "public1_subnet_id" {
  type = string
}

variable "vpc_id" {
  type = string
}