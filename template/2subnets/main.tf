resource "azurerm_virtual_machine_extension" "res-0" {
  auto_upgrade_minor_version = true
  name                       = "MDE.Windows"
  publisher                  = "Microsoft.Azure.AzureDefenderForServers"
  settings                   = "{\"autoUpdate\":true,\"azureResourceId\":\"/subscriptions/b860b083-169c-4f62-8ba6-e2f75885d4fa/resourceGroups/MRA-TEST-AES-NET-RG/providers/Microsoft.Compute/virtualMachines/vm101a\",\"forceReOnboarding\":false,\"vNextEnabled\":false}"
  type                       = "MDE.Windows"
  type_handler_version       = "1.0"
  virtual_machine_id         = "/subscriptions/b860b083-169c-4f62-8ba6-e2f75885d4fa/resourceGroups/MRA-TEST-AES-NET-RG/providers/Microsoft.Compute/virtualMachines/vm101a"
  depends_on = [
    azurerm_windows_virtual_machine.res-5,
  ]
}
resource "azurerm_virtual_machine_extension" "res-1" {
  auto_upgrade_minor_version = true
  name                       = "MicrosoftMonitoringAgent"
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  settings                   = "{\"workspaceId\":\"69213211-d470-49eb-bbc8-ebd8bb5b60cc\"}"
  type                       = "MicrosoftMonitoringAgent"
  type_handler_version       = "1.0"
  virtual_machine_id         = "/subscriptions/b860b083-169c-4f62-8ba6-e2f75885d4fa/resourceGroups/MRA-TEST-AES-NET-RG/providers/Microsoft.Compute/virtualMachines/vm101a"
  depends_on = [
    azurerm_windows_virtual_machine.res-5,
  ]
}
resource "azurerm_virtual_machine_extension" "res-2" {
  auto_upgrade_minor_version = true
  name                       = "MDE.Windows"
  publisher                  = "Microsoft.Azure.AzureDefenderForServers"
  settings                   = "{\"autoUpdate\":true,\"azureResourceId\":\"/subscriptions/b860b083-169c-4f62-8ba6-e2f75885d4fa/resourceGroups/MRA-TEST-AES-NET-RG/providers/Microsoft.Compute/virtualMachines/vm172161a\",\"forceReOnboarding\":false,\"vNextEnabled\":false}"
  type                       = "MDE.Windows"
  type_handler_version       = "1.0"
  virtual_machine_id         = "/subscriptions/b860b083-169c-4f62-8ba6-e2f75885d4fa/resourceGroups/MRA-TEST-AES-NET-RG/providers/Microsoft.Compute/virtualMachines/vm172161a"
  depends_on = [
    azurerm_windows_virtual_machine.res-6,
  ]
}
resource "azurerm_virtual_machine_extension" "res-3" {
  auto_upgrade_minor_version = true
  name                       = "MicrosoftMonitoringAgent"
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  settings                   = "{\"workspaceId\":\"69213211-d470-49eb-bbc8-ebd8bb5b60cc\"}"
  type                       = "MicrosoftMonitoringAgent"
  type_handler_version       = "1.0"
  virtual_machine_id         = "/subscriptions/b860b083-169c-4f62-8ba6-e2f75885d4fa/resourceGroups/MRA-TEST-AES-NET-RG/providers/Microsoft.Compute/virtualMachines/vm172161a"
  depends_on = [
    azurerm_windows_virtual_machine.res-6,
  ]
}
resource "azurerm_resource_group" "res-4" {
  location = "australiaeast"
  name     = "mra-test-aes-net-rg"
  tags = {
    owner = "ryan"
    usage = "TerraformTesting"
  }
}
resource "azurerm_windows_virtual_machine" "res-5" {
  admin_password        = "ignored-as-imported"
  admin_username        = "ryan"
  location              = "australiaeast"
  name                  = "vm101a"
  network_interface_ids = ["/subscriptions/b860b083-169c-4f62-8ba6-e2f75885d4fa/resourceGroups/mra-test-aes-net-rg/providers/Microsoft.Network/networkInterfaces/vm101a956"]
  resource_group_name   = "mra-test-aes-net-rg"
  size                  = "Standard_B2s"
  tags = {
    usage = "TerraformTesting"
  }
  additional_capabilities {
  }
  boot_diagnostics {
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }
  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-datacenter-smalldisk-g2"
    version   = "latest"
  }
  depends_on = [
    azurerm_network_interface.res-7,
  ]
}
resource "azurerm_windows_virtual_machine" "res-6" {
  admin_password        = "ignored-as-imported"
  admin_username        = "ryan"
  location              = "australiaeast"
  name                  = "vm172161a"
  network_interface_ids = ["/subscriptions/b860b083-169c-4f62-8ba6-e2f75885d4fa/resourceGroups/mra-test-aes-net-rg/providers/Microsoft.Network/networkInterfaces/vm172161a839"]
  resource_group_name   = "mra-test-aes-net-rg"
  size                  = "Standard_B2s"
  tags = {
    usage = "TerraformTesting"
  }
  additional_capabilities {
  }
  boot_diagnostics {
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }
  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2022-datacenter-smalldisk-g2"
    version   = "latest"
  }
  depends_on = [
    azurerm_network_interface.res-9,
  ]
}
resource "azurerm_network_interface" "res-7" {
  location            = "australiaeast"
  name                = "vm101a956"
  resource_group_name = "mra-test-aes-net-rg"
  tags = {
    usage = "TerraformTesting"
  }
  ip_configuration {
    name                          = "ipconfig1"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "/subscriptions/b860b083-169c-4f62-8ba6-e2f75885d4fa/resourceGroups/mra-test-aes-net-rg/providers/Microsoft.Network/publicIPAddresses/vm101a-ip"
    subnet_id                     = "/subscriptions/b860b083-169c-4f62-8ba6-e2f75885d4fa/resourceGroups/mra-test-aes-net-rg/providers/Microsoft.Network/virtualNetworks/mra-test-aes-net-vnet10.x/subnets/subnet10.1.x"
  }
  depends_on = [
    azurerm_public_ip.res-16,
    azurerm_subnet.res-19,
  ]
}
resource "azurerm_network_interface_security_group_association" "res-8" {
  network_interface_id      = "/subscriptions/b860b083-169c-4f62-8ba6-e2f75885d4fa/resourceGroups/mra-test-aes-net-rg/providers/Microsoft.Network/networkInterfaces/vm101a956"
  network_security_group_id = "/subscriptions/b860b083-169c-4f62-8ba6-e2f75885d4fa/resourceGroups/mra-test-aes-net-rg/providers/Microsoft.Network/networkSecurityGroups/vm101a-nsg"
  depends_on = [
    azurerm_network_interface.res-7,
    azurerm_network_security_group.res-11,
  ]
}
resource "azurerm_network_interface" "res-9" {
  location            = "australiaeast"
  name                = "vm172161a839"
  resource_group_name = "mra-test-aes-net-rg"
  tags = {
    usage = "TerraformTesting"
  }
  ip_configuration {
    name                          = "ipconfig1"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "/subscriptions/b860b083-169c-4f62-8ba6-e2f75885d4fa/resourceGroups/mra-test-aes-net-rg/providers/Microsoft.Network/publicIPAddresses/vm172161a-ip"
    subnet_id                     = "/subscriptions/b860b083-169c-4f62-8ba6-e2f75885d4fa/resourceGroups/mra-test-aes-net-rg/providers/Microsoft.Network/virtualNetworks/mra-test-aes-net-vnet172.16.x/subnets/subnet172.16.1.x"
  }
  depends_on = [
    azurerm_public_ip.res-17,
    azurerm_subnet.res-24,
  ]
}
resource "azurerm_network_interface_security_group_association" "res-10" {
  network_interface_id      = "/subscriptions/b860b083-169c-4f62-8ba6-e2f75885d4fa/resourceGroups/mra-test-aes-net-rg/providers/Microsoft.Network/networkInterfaces/vm172161a839"
  network_security_group_id = "/subscriptions/b860b083-169c-4f62-8ba6-e2f75885d4fa/resourceGroups/mra-test-aes-net-rg/providers/Microsoft.Network/networkSecurityGroups/vm172161a-nsg"
  depends_on = [
    azurerm_network_interface.res-9,
    azurerm_network_security_group.res-13,
  ]
}
resource "azurerm_network_security_group" "res-11" {
  location            = "australiaeast"
  name                = "vm101a-nsg"
  resource_group_name = "mra-test-aes-net-rg"
  tags = {
    usage = "TerraformTesting"
  }
  depends_on = [
    azurerm_resource_group.res-4,
  ]
}
resource "azurerm_network_security_rule" "res-12" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "3389"
  direction                   = "Inbound"
  name                        = "RDP"
  network_security_group_name = "vm101a-nsg"
  priority                    = 300
  protocol                    = "Tcp"
  resource_group_name         = "mra-test-aes-net-rg"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.res-11,
  ]
}
resource "azurerm_network_security_group" "res-13" {
  location            = "australiaeast"
  name                = "vm172161a-nsg"
  resource_group_name = "mra-test-aes-net-rg"
  tags = {
    usage = "TerraformTesting"
  }
  depends_on = [
    azurerm_resource_group.res-4,
  ]
}
resource "azurerm_network_security_rule" "res-14" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "80"
  direction                   = "Inbound"
  name                        = "HTTP"
  network_security_group_name = "vm172161a-nsg"
  priority                    = 320
  protocol                    = "Tcp"
  resource_group_name         = "mra-test-aes-net-rg"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.res-13,
  ]
}
resource "azurerm_network_security_rule" "res-15" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "3389"
  direction                   = "Inbound"
  name                        = "RDP"
  network_security_group_name = "vm172161a-nsg"
  priority                    = 300
  protocol                    = "Tcp"
  resource_group_name         = "mra-test-aes-net-rg"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.res-13,
  ]
}
resource "azurerm_public_ip" "res-16" {
  allocation_method   = "Static"
  location            = "australiaeast"
  name                = "vm101a-ip"
  resource_group_name = "mra-test-aes-net-rg"
  sku                 = "Standard"
  tags = {
    usage = "TerraformTesting"
  }
  depends_on = [
    azurerm_resource_group.res-4,
  ]
}
resource "azurerm_public_ip" "res-17" {
  allocation_method   = "Static"
  location            = "australiaeast"
  name                = "vm172161a-ip"
  resource_group_name = "mra-test-aes-net-rg"
  sku                 = "Standard"
  tags = {
    usage = "TerraformTesting"
  }
  depends_on = [
    azurerm_resource_group.res-4,
  ]
}
resource "azurerm_virtual_network" "res-18" {
  address_space       = ["10.0.0.0/8"]
  location            = "australiaeast"
  name                = "mra-test-aes-net-vnet10.x"
  resource_group_name = "mra-test-aes-net-rg"
  tags = {
    owner = "ryan"
    usage = "TerraformTesting"
  }
  depends_on = [
    azurerm_resource_group.res-4,
  ]
}
resource "azurerm_subnet" "res-19" {
  address_prefixes     = ["10.1.0.0/16"]
  name                 = "subnet10.1.x"
  resource_group_name  = "mra-test-aes-net-rg"
  virtual_network_name = "mra-test-aes-net-vnet10.x"
  depends_on = [
    azurerm_virtual_network.res-18,
  ]
}
resource "azurerm_subnet" "res-20" {
  address_prefixes     = ["10.2.0.0/16"]
  name                 = "subnet10.2.x"
  resource_group_name  = "mra-test-aes-net-rg"
  virtual_network_name = "mra-test-aes-net-vnet10.x"
  depends_on = [
    azurerm_virtual_network.res-18,
  ]
}
resource "azurerm_virtual_network_peering" "res-21" {
  name                      = "from10_to_172"
  remote_virtual_network_id = "/subscriptions/b860b083-169c-4f62-8ba6-e2f75885d4fa/resourceGroups/mra-test-aes-net-rg/providers/Microsoft.Network/virtualNetworks/mra-test-aes-net-vnet172.16.x"
  resource_group_name       = "mra-test-aes-net-rg"
  virtual_network_name      = "mra-test-aes-net-vnet10.x"
  depends_on = [
    azurerm_virtual_network.res-18,
    azurerm_virtual_network.res-22,
  ]
}
resource "azurerm_virtual_network" "res-22" {
  address_space       = ["172.16.0.0/16"]
  location            = "australiaeast"
  name                = "mra-test-aes-net-vnet172.16.x"
  resource_group_name = "mra-test-aes-net-rg"
  tags = {
    owner = "ryan"
    usage = "TerraformTesting"
  }
  depends_on = [
    azurerm_resource_group.res-4,
  ]
}
resource "azurerm_subnet" "res-23" {
  address_prefixes     = ["172.16.2.0/24"]
  name                 = "subnet172.16..2.x"
  resource_group_name  = "mra-test-aes-net-rg"
  virtual_network_name = "mra-test-aes-net-vnet172.16.x"
  depends_on = [
    azurerm_virtual_network.res-22,
  ]
}
resource "azurerm_subnet" "res-24" {
  address_prefixes     = ["172.16.1.0/24"]
  name                 = "subnet172.16.1.x"
  resource_group_name  = "mra-test-aes-net-rg"
  virtual_network_name = "mra-test-aes-net-vnet172.16.x"
  depends_on = [
    azurerm_virtual_network.res-22,
  ]
}
resource "azurerm_virtual_network_peering" "res-25" {
  name                      = "from172_to_10"
  remote_virtual_network_id = "/subscriptions/b860b083-169c-4f62-8ba6-e2f75885d4fa/resourceGroups/mra-test-aes-net-rg/providers/Microsoft.Network/virtualNetworks/mra-test-aes-net-vnet10.x"
  resource_group_name       = "mra-test-aes-net-rg"
  virtual_network_name      = "mra-test-aes-net-vnet172.16.x"
  depends_on = [
    azurerm_virtual_network.res-18,
    azurerm_virtual_network.res-22,
  ]
}
