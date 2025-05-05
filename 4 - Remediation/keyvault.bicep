
resource keyvault 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: 'myKeyVault-policy-rem'
  location: 'westeurope'
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    accessPolicies: [
      
    ]
  }
}
