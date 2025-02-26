variable "vpc_id" {
  
  type        = string
}

variable "subnet_id" {
  
  type        = list(string)
}

variable "ec2_sg" {
  
  type        = string
}

variable "ec2" {
  
  type        = list(string)
}
