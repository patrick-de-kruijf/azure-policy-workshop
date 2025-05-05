targetScope = 'subscription'

@description('The ID of the policy assignment to exempt from.')
param policyAssignmentId string = '/subscriptions/b6f086cc-b0ba-45a3-add1-1bf53e292be1/resourcegroups/rg-deployifnotexists-demo-rem/providers/microsoft.authorization/policyassignments/keyvault-central-diag-rem'

resource policyRemediation 'Microsoft.PolicyInsights/remediations@2024-10-01' = {
  scope: subscription()
  name: 'PolicyRemediation'
  properties: {
    failureThreshold: {
      percentage: 1 // Percentage of resources that can fail remediation before the entire remediation fails, number between 0.0 and 1.0 (1.0 being 100%)
    }
    filters: {} // Can be used to limit the remediation to specific resources or properties
    parallelDeployments: 5
    policyAssignmentId: policyAssignmentId
    policyDefinitionReferenceId: '' // Only needed when the remediation is for a policy definition reference
    resourceCount: 500
  }
}
