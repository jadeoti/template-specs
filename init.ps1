# This script initializes the environment to host the template spec

# Log in to Azure account
az login

# Set default subscription 
az account set --subscription "SET-ME"

# Create resource group
az group create --name "rg-myorg-templatespec-wu3" --location "westus3"

# Create container registry
az acr create --name "djacr01" --resource-group "rg-myorg-templatespec-wu3" --sku Standard

# Get acr url
az acr show --resource-group rg-myorg-templatespec-wu3 --name djacr01 --query loginServer

# Set default resource group
az configure --defaults group=rg-myorg-templatespec-wu3
