# Create Ansible inventory file with dynamic host configuration
resource "local_file" "ansible_inventory" {
  filename = "../ansible/inventory.ini"
  content = templatefile("${path.module}/templates/inventory.tpl", {
    server_ip        = aws_instance.ec2.public_ip
    ansible_user     = "ubuntu"
    private_key_path = var.private_key_path
  })
}