@description('NSG for outbound rules')
param location string
param nsgName string = 'actions_NSG'

resource actions_NSG 'Microsoft.Network/networkSecurityGroups@2017-06-01' = {
  name: nsgName
  location: location
  properties: {
    securityRules: [
      {
        name: 'DenyInternetOutBoundOverwrite'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: 'Internet'
          access: 'Deny'
          priority: 400
          direction: 'Outbound'
        }
      }
      {
        name: 'AllowVnetOutBoundOverwrite'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: 'VirtualNetwork'
          access: 'Allow'
          priority: 200
          direction: 'Outbound'
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'AllowAzureCloudOutBound'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: 'AzureCloud'
          access: 'Allow'
          priority: 210
          direction: 'Outbound'
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'AllowInternetOutBoundGitHub'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: '*'
          access: 'Allow'
          priority: 220
          direction: 'Outbound'
          destinationAddressPrefixes: [
            '140.82.112.0/20'
            '142.250.0.0/15'
            '143.55.64.0/20'
            '192.30.252.0/22'
            '185.199.108.0/22'
          ]
        }
      }
      {
        name: 'AllowInternetOutBoundMicrosoft'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: '*'
          access: 'Allow'
          priority: 230
          direction: 'Outbound'
          destinationAddressPrefixes: [
            '13.64.0.0/11'
            '13.96.0.0/13'
            '13.104.0.0/14'
            '20.33.0.0/16'
            '20.34.0.0/15'
            '20.36.0.0/14'
            '20.40.0.0/13'
            '20.48.0.0/12'
            '20.64.0.0/10'
            '20.128.0.0/16'
            '52.224.0.0/11'
            '204.79.197.200'
          ]
        }
      }
    {
        name: 'AllowInternetOutBoundCannonical'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '185.125.188.0/22'
          access: 'Allow'
          priority: 240
          direction: 'Outbound'
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}
