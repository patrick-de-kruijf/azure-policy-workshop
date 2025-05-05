targetScope = 'subscription'

resource deployIfNotExistsDemo 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-deployIfNotExists-demo-exempt'
  location: 'westeurope'
}

module law 'law.bicep' = {
  name: 'law-exempt'
  scope: deployIfNotExistsDemo
}

module policy 'policy.bicep' = {
  scope: subscription()
  name: 'policy-demo-exempt'
  params: {
    workspaceId: law.outputs.workspaceId
  }
}

module policyAssignment 'policy-assignment.bicep' = {
  scope: deployIfNotExistsDemo
  name: 'policyAssignment-demo-exempt'
  params: {
    policyDefinitionID: policy.outputs.id
    policyAssignmentName: policy.outputs.name
  }
}

resource roleassignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(policyAssignment.name, 'b24988ac-6180-42a0-ab88-20f7382dd24c')
  properties: {
    principalId: policyAssignment.outputs.identityPrincipalId
    principalType: 'ServicePrincipal'
    roleDefinitionId: '/providers/microsoft.authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c' // contributor role for deployIfNotExists/modify effects NOTE: this may be different depending on the policy
  }
}
