#!/bin/bash

# Login if not created:
#az login

echo "Specify your email:"
read MY_EMAIL

RESOURCE_GROUP=apim-demo1-rg
MY_APIM_NAME=apim-$RANDOM
MY_LOCATION=westeurope
PUBLISHER_NAME="APIDemo_Publisher"

echo MY_EMAIL=$MY_EMAIL
echo RESOURCE_GROUP=$RESOURCE_GROUP
echo MY_APIM_NAME=$MY_APIM_NAME
echo MY_LOCATION=$MY_LOCATION
echo PUBLISHER_NAME=$PUBLISHER_NAME

if [ $(az group exists --name $RESOURCE_GROUP) = false ]; then
    echo Creating resource group $rg:
    az group create --resource-group $RESOURCE_GROUP --location westeurope
else
    echo Resource group $RESOURCE_GROUP exists. Not creating.
fi

echo Creating APIM...
az apim create -n $MY_APIM_NAME \
    --location $MY_LOCATION \
    --publisher-email $MY_EMAIL  \
    --resource-group $RESOURCE_GROUP \
    --publisher-name $PUBLISHER_NAME \
    --sku-name Consumption
