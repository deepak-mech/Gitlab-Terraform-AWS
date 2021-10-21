resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  filename          = "${var.namespace}-key.pem"
  content = tls_private_key.ssh.private_key_pem
  file_permission   = "755"
}

resource "aws_key_pair" "key_pair" {
  key_name   = "${var.namespace}-key"
  public_key = tls_private_key.ssh.public_key_openssh
}

variable "namespace" {
  type = string
  default = "developer"
}

resource "aws_s3_bucket_object" "object" {
  bucket = "my-tf-secret123"
  key    = "dev/${var.namespace}-key.pem"
  source = "${var.namespace}-key.pem"
}


