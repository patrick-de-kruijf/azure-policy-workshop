targetScope = 'subscription'

@description('The ID of the policy assignment to exempt from.')
param policyAssignmentId string = ''

resource policyExemption 'Microsoft.Authorization/policyExemptions@2024-12-01-preview' = {
  scope: subscription()
  name: 'string'
  properties: {
    assignmentScopeValidation: 'Default'
    description: 'Description of the exemption'
    displayName: 'Name of the exemption'
    exemptionCategory: 'Waiver'
    expiresOn: '2025-05-06T00:00:00Z' // (in UTC ISO 8601 format yyyy-MM-ddTHH:mm:ssZ)
    policyAssignmentId: policyAssignmentId
    policyDefinitionReferenceIds: [] // Only needed when the exemption is for a policy definition reference
    resourceSelectors: [] // Can be used to limit the exemption to specific resources or properties
  }
}
