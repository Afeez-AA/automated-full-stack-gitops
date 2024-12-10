# Create Ansible inventory file with dynamic host configuration
resource "local_file" "ansible_inventory" {
  filename = "../ansible/inventory.ini"
  content = templatefile("${path.module}/templates/inventory.tpl", {
    server_ip        = aws_instance.ec2.public_ip
    ansible_user     = "ubuntu"
    private_key_path = var.private_key_path
  })
}

# Improved null_resource for Ansible playbook execution with more robust error handling
resource "null_resource" "run_ansible" {
  depends_on = [
    aws_route53_record.main_domain_record,
    aws_route53_record.wildcard_domain_record,
    local_file.ansible_inventory
  ]

  triggers = {
    always_run = "${timestamp()}" # Ensures the provisioner runs on every apply
  }

  provisioner "local-exec" {
    command = <<-EOT
      set -e
      export ANSIBLE_HOST_KEY_CHECKING=False
      ansible-playbook \
        -i ../ansible/inventory.ini \
        ../ansible/playbook.yml \
        --extra-vars '${jsonencode({
    frontend_domain = var.frontend_domain,
    db_domain       = var.db_domain,
    traefik_domain  = var.traefik_domain,
    cert_email      = var.cert_email,
    repo            = var.repo,
    app_dir         = var.app_dir,
    domain_name     = var.domain_name

})}'
    EOT
interpreter = ["/bin/bash", "-c"]
}
}