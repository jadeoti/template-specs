Repro
1. update init.ps1 with subscriptionId
1. run `.\init.ps1` to create the base resources.
1. update bicepconfig.json with subscriptionId
1. publish to template spec and registry

    ```powershell
        bicep build .\resource-naming.bicep     
        az ts create --name NameGen --location westus3 --display-name "Resource Name Generator" --version 'v1.0' --template-file "resource-naming.json"
        az bicep publish --file  ./resource-naming.bicep --target br:djacr01.azurecr.io/bicep/modules/name-gen:v1.0
    ```
    
1. test template spec

    ```powershell
        az deployment  sub what-if --name dj202305050832  --location  westus3 --template-file main.bicep --parameters ppe.parameters.json --verbose --debug
    ```
    
1. test the naming modules by commenting out the other on and run az deployment again.