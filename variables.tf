variable "subnets_ids" {
  description = "Subnet ids"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
}

variable "httpd_port" {
  description = "httpd port"
  type        = number
  default     = 31555
}

variable "client_ip_cidr" {
  description = "Client public IPv4"
  type        = string

}

variable "vpc_cidr" {
  description = "VPC cidr"
  type        = string

}

variable "aws_access_key" {
  description = "provide AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "provide AWS secret key"
  type        = string

}