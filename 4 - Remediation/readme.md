
```bash
az deployment sub create --name deployifnotexists-demo-deployment-rem  --template-file main.bicep -l westeurope

az deployment group create --resource-group rg-deployIfNotExists-demo-rem --template-file keyvault.bicep

az deployment group create --resource-group rg-deployIfNotExists-demo-rem --template-file remediation.bicep

```