variable "aws_access_key" {
    type = string
    description = "AWS Access Key"
    sensitive = true 
}

variable "aws_secret_key" {
    type = string
    description = "AWS Secret Key"
    sensitive = true 
}

variable "aws_region" {
    type = string
    description = "AWS default region" 
    default = "us-west-2"
}
