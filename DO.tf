resource "digitalocean_droplet" "web" {
    image = "fedora-22-x64"
    name = "web-1"
    region = "sgp1"
    size = "512mb"
    ssh_keys = ["a4:b4:4f:4c:8d:81:a3:cc:41:94:b8:a0:f8:6f:8e:d1"]

  provisioner "local-exec" {
    command = "sleep 30 && echo -e \"[webserver]\n${digitalocean_droplet.web.ipv4_address} ansible_connection=ssh ansible_ssh_user=root\" > inventory &&  ansible-playbook -i inventory oc-playbook.yml"
  }
}
