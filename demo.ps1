Import-module azurerm

Login-azurermaccount
$rgName = "machsresourcegroup"
New-AzureRmResourceGroup -Name $rgName -Location "South Central US"

[hashtable] $parameters = @{ 
                            "exactTemplateParameter1" = "localVariabletoPass1";
                            "exactTemplateParameter2" = "localVariabletoPass2";
                            }

New-AzureRmResourceGroupDeployment -ResourceGroupName $rgName `
                                   -TemplateFile "filepathtojsontemplate" `
                                   -TemplateParameterObject $parameters `
                                   -Force
