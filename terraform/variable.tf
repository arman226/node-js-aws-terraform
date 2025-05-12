variable "aws_access_key" {
  description = "AWS Access Key for API connection"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Key for API connection"
  type        = string
  sensitive   = true
}


variable "key_name" {
  description = "Name of the key pair to use for SSH access"
  type        = string
  default     = "sample-key-pair"
}
