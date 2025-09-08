variable "vpc-cidr" {
  description = "The CIDR block for the VPC"
  type        = string  
}
variable "private-subnet-cidr" {
  description = "The CIDR block for the private subnet"
  type        = string  
}

variable "public-subnet-cidr" {
  description = "The CIDR block for the public subnet"
  type        = string  
  
}

variable "Bastion-subnet-cidr" {
  description = "The CIDR block for the Bastion subnet"
  type        = string  
}
variable "env_name"     { type = string }
variable "location"    { type = string }
variable "tags"        { type = map(string) }