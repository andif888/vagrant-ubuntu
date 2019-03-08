locals {
  computer_name_ubnt = "ubnt"
  
}

resource "azurerm_virtual_machine" "vm_ubnt" {
  count                 = "${var.instance_count}"
  name                  = "${var.prefix}_vm_ubnt"
  location              = "${element(azurerm_resource_group.main.*.location, count.index)}"
  resource_group_name   = "${element(azurerm_resource_group.main.*.name, count.index)}"
  network_interface_ids = ["${element(azurerm_network_interface.vm_ubnt.*.id, count.index)}"]
  vm_size               = "Standard_B1ms"

  # This means the OS Disk will be deleted when Terraform destroys the Virtual Machine
  # NOTE: This may not be optimal in all cases.
  delete_os_disk_on_termination = true

  # This means the Data Disk Disk will be deleted when Terraform destroys the Virtual Machine
  # NOTE: This may not be optimal in all cases.
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.prefix}_vm_ubnt_osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${local.computer_name_ubnt}"
    admin_username = "${var.vm_username}"
    admin_password = "${var.vm_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false

    # ssh_keys {
    #   path     = "/home/${var.vm_username}/.ssh/authorized_keys"
    #   key_data = "${file("~/.ssh/id_rsa.pub")}"
    # }
  }

  connection {
      type = "ssh"
      user = "${var.vm_username}"
      password = "${var.vm_password}"
  }

  provisioner "file" {
    source = "../scripts"
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod -R +x /tmp/scripts",
      "/tmp/scripts/prepare.sh",
    ]
  }

  provisioner "file" {
    source = "../ansible"
    destination = "/tmp"
  }

  provisioner "file" {
    source = "../wordpress"
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = [
      "cd /tmp/ansible",
      "ansible-playbook -i inventory -b playbook.yml",
    ]
  }

  
  tags = "${var.tags}"
}