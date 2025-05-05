
```bash
az deployment sub create --name deployifnotexists-demo-deployment-exempt --template-file main.bicep -l westeurope

az deployment group create --resource-group rg-deployIfNotExists-demo-exempt --template-file keyvault.bicep

az deployment group create --resource-group rg-deployIfNotExists-demo-exempt --template-file exemption.bicep

```