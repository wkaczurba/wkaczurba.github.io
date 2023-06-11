#!/bin/bash

LOCATION=westeurope
MY_NAMESPACE_NAME=servicebus-demo-123abc0
RESOURCE_GROUP=servicebus-demo-rg
SERVICE_BUS_NAME=service-queue

az group create --name $RESOURCE_GROUP --location $LOCATION

# Create service bus:
az servicebus namespace create \
    --resource-group $RESOURCE_GROUP \
    --name $MY_NAMESPACE_NAME \
    --location $LOCATION

# Create service bus queue:
az servicebus queue create --resource-group $RESOURCE_GROUP \
    --namespace-name $MY_NAMESPACE_NAME \
    --name $SERVICE_BUS_NAME

# Retrieve tghe connection setring - from portal.

# Use / adopt C# code 