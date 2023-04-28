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
// az ts create --name ResourceNameGenerator --location $location --display-name "Resource Name Generator" --version 'v1' --template-file "resource-naming.json"
// publishing the bicep didnt work till I converted to json
