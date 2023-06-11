# Azure Caching - Redis + CDN

[Tutorial](https://learn.microsoft.com/en-ie/training/paths/az-204-integrate-caching-content-delivery-within-solutions/)

...

Exercise - REDIS.

```bash

MY_LOCATION=westeurope
RESOURCE_GROUP=redis-demo-rg
REDIS_NAME=redis-demo-123cb
REDIS_SKU=Basic

az group create --name $RESOURCE_GROUP --location $MY_LOCATION


az redis create --location $MY_LOCATION \
    --resource-group $RESOURCE_GROUP \
    --name $REDIS_NAME --sku $REDIS_SKU \
    --vm-size c0
```

Then - as on GITHUB: [https://github.com/wkaczurba/AzureRedisCacheDemo](https://github.com/wkaczurba/AzureRedisCacheDemo)

Other:
- **Console (preview)** allows nice access to redis through the portal itself.

# CDN

Azure Frontdoor:
 - allows for brottli and gzip formats - compression formats.
 - https://learn.microsoft.com/en-us/answers/questions/36124/using-brotli-on-azure-cdn
 - https://learn.microsoft.com/en-us/azure/cdn/cdn-improve-performance#compression-rules

