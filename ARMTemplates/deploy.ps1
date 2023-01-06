#Login-AzAccount -TenantId 459865f1-a8aa-450a-baec-8b47a9e5c904 -SubscriptionId 6e4924ab-b00c-468f-ae01-e5d33e8786f8

#New-AzResourceGroup -Name ARMTemplates -Location UKSouth

New-AzResourceGroupDeployment -ResourceGroupName ARMTemplates -TemplateFile .\Azuretemplate.json -TemplateParameterFile .\Azureparameters.json -Verbose