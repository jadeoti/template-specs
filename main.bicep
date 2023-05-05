/*
* main.bicep
*/

targetScope = 'subscription'

param env string = 'test'
param rgLocation string = 'westus3'
param purpose string = 'myservice'

module naming 'ts/infraSpecs:NameGen:v1.0' = {
name: 'name-gen-${env}-${rgLocation}'
params: {
    region: rgLocation
    service: purpose
    env: env
  }
}

// module naming 'br:djacr01.azurecr.io/bicep/modules/name-gen:v1.0' = {
//   name: 'name-gen-${env}-${rgLocation}'
//   params: {
//     region: rgLocation
//     service: purpose
//     env: env
//   }
// }

// module naming 'resource-naming.json' = {
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
