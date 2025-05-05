targetScope = 'subscription'

@description('Specifies the location for resources.')
param location string = 'westeurope'

@description('The Definition ID of the policy to assign.') 
param policyDefinitionID string = '/providers/Microsoft.Authorization/policySetDefinitions/5e4ff661-23bf-42fa-8e3a-309a55091cc7' // ISO 27001:2022

resource rgPolicyAuditDemo 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-policy-audit-demo'
  location: location
}

module policyAssignment 'policy-assignment.bicep' = {
  scope: subscription()
  name: 'policyAssignment-demo'
  params: {
    policyDefinitionID: policyDefinitionID
    policyAssignmentName: 'ISO27001-2022-Exercise1'
  }
}
