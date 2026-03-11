#!/bin/bash

RESOURCE_GROUP="static-site-rg"
STORAGE_ACCOUNT="mikastaticweb412"
LOCATION="eastus"

az group create --name $RESOOURCE_GROUP --location $LOCATION

az storage account create \
--name $STORAGE_ACCOUNT \
--resource-group $RESOOURCE_GROUP \
--location $LOCATION \
--sku Standard_LRS

az storage blob service-properties update 
--account-name $STORAGE_ACCOUNT \
--static-website \
--index-doocument index.html \
--auth-mode login

az storage blob upload-batch \
--account-name $STORAGE_ACCOUNT \
--destination '$web' \
--source ./website \
--auth-mode login


