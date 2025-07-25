targetScope = 'subscription'

@description('Specifies the location for resources.')
param location string = 'westeurope'

resource rgPolicyAuditDemo 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-policy-audit-demo'
  location: location
}

module storageAccountWestEurope './storageaccount.bicep' = {
  scope: rgPolicyAuditDemo
  name: 'storage-west-europe'
  params: {
    name: 'stgweelnl25'
    location: 'westeurope'
  }

  dependsOn: [
    policyAssignment
  ]
}

module storagenortheurope './storageaccount.bicep' = {
  scope: rgPolicyAuditDemo
  name: 'storage-north-europe'
  params: {
    name: 'stgneelnl25'
    location: 'northeurope'
  }

  dependsOn: [
    policyAssignment
  ]
}

module policy 'allowed-locations-policy.bicep' = {
  scope: subscription()
  name: 'policy-demo'
}

module policyAssignment 'policy-assignment.bicep' = {
  scope: subscription()
  name: 'policyAssignment-demo'
  params: {
    policyDefinitionID: policy.outputs.id
    policyAssignmentName: policy.outputs.name
  }
}
