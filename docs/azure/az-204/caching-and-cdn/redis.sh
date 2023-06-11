
MY_LOCATION=westeurope
RESOURCE_GROUP=redis-demo-rg
REDIS_NAME=redis-demo-123cb
REDIS_SKU=Basic

az group create --name $RESOURCE_GROUP --location $MY_LOCATION


az redis create --location $MY_LOCATION \
    --resource-group $RESOURCE_GROUP \
    --name $REDIS_NAME --sku $REDIS_SKU \
    --vm-size c0