[web_servers]
${server_ip} ansible_user=${ansible_user} ansible_ssh_private_key_file=${private_key_path}

[all:vars]
ansible_python_interpreter=/usr/bin/python3