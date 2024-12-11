# Generate a key pair locally
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create an AWS Key Pair from the generated private key
resource "aws_key_pair" "devops-dojo-keypair" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.example.public_key_openssh
}

# Save the private key to a file
resource "local_file" "private_key" {
  content         = tls_private_key.example.private_key_pem
  filename        = "${path.module}/${var.key_pair_name}"
  file_permission = "0600"
}
