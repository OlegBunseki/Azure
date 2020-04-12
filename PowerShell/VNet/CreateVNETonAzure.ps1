# Resource Group
$rg = "SL-Network"
$location = "westeurope"

# VNET Name and Address Space
$VNETName = "SL-70533-ps"
$VNETAddressSpace = "10.0.0.0/22"

# Subnet Name and Address Space
$subnetAName = "SL-web"
$subnetAAddressPrefix = "10.0.0.0/24"
$subnetBName = "SL-app"
$subnetBAddressPrefix = "10.0.1.0/24"
$subnetCName = "SL-data"
$subnetCAddressPrefix = "10.0.2.0/24"

# Create Subnet
$subnets = New-AzVirtualNetworkSubnetConfig -Name $subnetAName -AddressPrefix $subnetAAddressPrefix

# Create VNET and include subnet configuration
$vnet = New-AzVirtualNetwork -Name $VNETName -ResourceGroupName $rg -Location $location -AddressPrefix $VNETAddressSpace -Subnet $subnets

# Add Additional Subnets
Add-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name $subnetBName -AddressPrefix $subnetBAddressPrefix 
Add-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name $subnetCName -AddressPrefix $subnetCAddressPrefix

# Create VNET
Set-AzVirtualNetwork -VirtualNetwork $vnet

