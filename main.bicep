/*
* main.bicep
*/

targetScope = 'subscription'

param env string = 'test'
param rgLocation string = 'westus3'
param purpose string = 'myservice'
param subscriptionId string = ''
param resourceGroup string = ''

// module naming 'ts/MeshSpecs:NameGen:v1' = {
// name: 'name-gen-${env}-${rgLocation}'
// params: {
//     region: rgLocation
//     service: purpose
//     env: env
//   }
// }

module naming 'ts:{subscription}/rg-myorg-templatespec-wu3/NameGen:v1' = {
  name: 'name-gen-${env}-${rgLocation}'
  params: {
    region: rgLocation
    service: purpose
    env: env
  }
}

// module naming 'resource-naming.bicep' = {
//   name: 'name-gen-${env}-${rgLocation}'
//   params: {
//     region: rgLocation
//     service: purpose
//     env: env
//   }
// }

module rgModule 'rg.bicep' = {
  name:  'infra-${env}-${rgLocation}'
  params: {
    rgLocation: rgLocation
    rgName: naming.outputs.rgName
  }
}
