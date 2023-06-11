#!/bin/bash

# Login if not created:
#az login

RANDOM_SUFFIX="4def88"

RESOURCE_GROUP=eventgrid-demo-${RANDOM_SUFFIX}-rg
MY_LOCATION=westeurope
MY_TOPIC_NAME=eg-topic-${RANDOM_SUFFIX}
MY_SITE_NAME=eg-site-${RANDOM_SUFFIX}
MY_SITE_URL="https://${MY_SITE_NAME}.azurewebsites.net"

if [ $(az group exists --name $RESOURCE_GROUP) = false ]; then
    echo Creating resource group $RESOURCE_GROUP:
    az group create --resource-group $RESOURCE_GROUP --location $MY_LOCATION
else
    echo Resource group $RESOURCE_GROUP exists. Not creating.
fi

# Enabling eventgrid resource provider
# NOTE: Needed only on subscription w/o Microosft.EventGrid enabled - go in portal: subscription -> resource-providers

az provider register --namespace Microsoft.EventGrid

# Creating a custom topic.

az eventgrid topic create --name $MY_TOPIC_NAME --location $MY_LOCATION --resource-group $RESOURCE_GROUP

# Creating a webapp - endpoint (using Azure's samples)

az deployment group create --resource-group $RESOURCE_GROUP \
    --template-uri "https://raw.githubusercontent.com/Azure-Samples/azure-event-grid-viewer/main/azuredeploy.json" \
    --parameters siteName=$MY_SITE_NAME hostingPlanName=viewerhost

echo "The web app URL: ${MY_SITE_URL}"

# Subscribe to a custom topic:

ENDPOINT="${MY_SITE_URL}/api/updates"
SUB_ID=$(az account show --subscription "" | jq -r '.id')

az eventgrid event-subscription create \
    --source-resource-id "/subscriptions/$SUB_ID/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.EventGrid/topics/$MY_TOPIC_NAME" \
    --name az2204viewerSub \
    --endpoint $ENDPOINT

# Send an event:

# Retrieving URL+key for custom topic:
TOPIC_ENDPOINT=$(az eventgrid topic show --name $MY_TOPIC_NAME -g $RESOURCE_GROUP --query "endpoint" --output tsv)
KEY=$(az eventgrid topic key list --name $MY_TOPIC_NAME -g $RESOURCE_GROUP --query "key1" --output tsv)

EVENT='[ {"id": "'"$RANDOM"'", "eventType": "recordInserted", "subject": "myapp/vehicles/motorcycles", "eventTime": "'`date +%Y-%m-%dT%H:%M:%S%z`'", "data":{ "make": "Contoso", "model": "Monster"},"dataVersion": "1.0"} ]'

curl -X POST -H "aeg-sas-key: $KEY" -d "$EVENT" $TOPIC_ENDPOINT


