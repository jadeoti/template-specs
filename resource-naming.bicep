/*
* resource-naming.bicep
*/

targetScope = 'subscription'

param service string = 'myservice'
param env string = 'test'
param region string = 'westus3'

output rgName string = 'rg-myorg-${service}-${env}-${region}'


// To publish: 
// az group create --name rg-myorg-templatespec-wu3 --location westus3  
// bicep build .\resource-naming.bicep     
// az ts create --name NameGen --location westus3 --display-name "Resource Name Generator" --version 'v1' --template-file "resource-naming.json"
// az bicep publish --file  ./resource-naming.bicep --target br:jadeoti07.azurecr.io/bicep/modules/storage:v1.0
// publishing the bicep didnt work till I converted to json
