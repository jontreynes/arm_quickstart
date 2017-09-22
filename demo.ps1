Import-module azurerm

Login-azurermaccount
$rgName = "machsresourcegroup"
New-AzureRmResourceGroup -Name $rgName -Location "South Central US"

[hashtable] $parameters = @{ 
                            "virtualMachineSize" = "Standard_DS1_v2";
                            "adminUsername" = "youradminname";
                            "adminPassword" = "yourpassword"
                            
                            }

New-AzureRmResourceGroupDeployment -ResourceGroupName $rgName `
                                   -TemplateFile "filepathtojsontemplate" `
                                   -TemplateParameterObject $parameters `
                                   -Force
