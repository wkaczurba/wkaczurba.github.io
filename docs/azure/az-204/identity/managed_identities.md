

# Implement managed entities ([tutorial](https://learn.microsoft.com/en-ie/training/modules/implement-managed-identities/2-managed-identities-overview))


Difference between (how are they different)
 - system-assigned managed identity
   - tied to lifecycle of a service like VM or Azure App Service
   - deletion of identity on deletion of resource
   - cannot be shared across resources - belongs only to the VM/ServiceApp or other)
 - user assigned identities (standalone resource in Azure AD Tenant);
   - independent lifecycle;
   - must be explicitly deleted;
   - can be shared across resources
 

What are characteristicvs of managed identities?
 - creation
 - lifecycle
 - sharing across azure resources

## Authentication flow ([resources](https://learn.microsoft.com/en-ie/training/modules/implement-managed-identities/3-managed-identities-auzre-virtual-machines))

 - On VMs - system assigned
   - Azure creates a service principal in Azure AD + updates instance's metadata.
   - it is there.
   - all that is required is `Virtual Machine Contributor` role assigned.
 - For user-aassigned - request needs to be created; metadata gets updated automatically as well -
  
 - Endpoint: `http://169.254.169.254/metadata/identity/oauth2/token`(only from the VM itself.)

https://learn.microsoft.com/en-ie/training/modules/implement-managed-identities/4-configure-managed-identities
 

### Sytem-assigned:

```bash
#!/bin/bash

RG_NAME=any_rg1 #resgroup-$RANDOM
LOCATION=westeurope
VM_NAME=MyVm
ADMIN_USERNAME=azureuser
ADMIN_PASSWORD=myPassword12

az vm create \
    --resource-group $RG_NAME \
    --name $VM_NAME \
    --image Win2022AzureEditionCore \
    --public-ip-sku Standard \
    --admin-username $ADMIN_USERNAME \
    --admin-password $ADMIN_PASSWORD

# # Then:
az vm identity assign -g myResourceGroup -n myVm
az vm delete -g $RG_NAME -n $VM_NAME --yes

# This one did not work as expected:
# SUBSCRIPTION="98612...29"
# IMAGE=win2016datacenter
# #az group create --name $RG_NAME --location $LOCATION
# az vm create --resource-group $RG_NAME \
#     --name $VM_NAME \
#     --image $IMAGE \
#     --location $LOCATION \
#     --generate-ssh-keys \
#     --assign-identity \
#     --scope $SUBSCRIPTION \
#     --role contributor \
#     --admin-username $ADMIN_USERNAME \
#     --admin-password $ADMIN_PASSWORD

#az group delete --resource-group-name $RG_NAME --nowait
```

### User-assigned:

```bash
 az vm create --resource-group any_rg1 \
    --name vm1 \
    --image UbuntuLTS \
    --admin-username adm123 \
    --admin-password 'ABCpass123GHZ^' \
    --assign-identity mngdidentito
 ```


```bash
curl --header 'Metadata: true' "http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://management.azure.com"
```
```json
{
    "access_token":"eyJ...",
    "client_id":"0d68...4a945d7ce22",
    "expires_in":"86400",
    "expires_on":"1685446126",
    "ext_expires_in":"86399",
    "not_before":"1685359426",
    "resource":"https://management.azure.com",
    "token_type":"Bearer"
}
```