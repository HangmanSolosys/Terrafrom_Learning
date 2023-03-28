variable "aws_access_key" {
    type        = string
    description = "AWS Access Key"
    default     = "3*******???IG4HGHO"
    sensitive   = true 
}

variable "aws_secret_key" {
    type        = string
    description = "AWS Secret Key"
    default     = "@*********???TEfA"
    sensitive   = true 
}

variable "aws_region" {
    type = string
    description = "AWS default region" 
    default = "us-west-2"
}
