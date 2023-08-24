# Key vault

https://learn.microsoft.com/en-ie/training/modules/implement-azure-key-vault/2-key-vault-overview

Secure storing of secrets + keys: 
 - Access:
   - **Azure RBAC** (mngmt)
   - **Key Vault Access policy** (retrieval)
 - Protection: software or HSM (Azure Key Vault Premium Tier)
Monitoring access + use:

Monitor access and use
 - where logs can be send to? / what logs.

Simplified administration of apps secret
 - lifecycle\
 - repl/failover/quick scaling up
 - access vua Cli/PS



https://learn.microsoft.com/en-ie/training/modules/implement-azure-key-vault/3-key-vault-concepts

Authentication:
 - how it can be done?. What are the differences.
   - Managed Identities for Azure resources
   - Service prinicapl + cert (not recommended - as app owner must rotate the cert)
   - Serice prtinicapl + secret (not recommended)

Encryption of data in transit (TLS/)
  - PFS - what is?


Azure Key Vault best practices: what are those? why ?
 - **Use separate key vaults**
 - Control access
 - backup - does it need to be done? within vault itself?
 - logging
 - recovery options (eg. soft-delete + purge protect)

https://learn.microsoft.com/en-ie/training/modules/implement-azure-key-vault/4-key-vault-authentication

 - Authentication of apps:
   - what is retrieval of service principal? **how to get it in the app?**
     - **enable system-assigned mngd identity [prefered]**
     - w/o mngd identity: register the app with Azure AD tenant; it will also create a second application object that identitfies the app across all tenants.

 - Authentication to Key Vauilt in app code:
   - PUT + bearer tokjen and api version=1.
   - 

From [gist](https://gist.github.com/wkaczurba/0bb1ed96e0ad36c13b1e7fe2642b2964):

```bash
#!/bin/bash

set -e

KEYVAULT_NAME=keyvault-$RANDOM
LOCATION=westeurope
RG_NAME=keyvault-example-$RANDOM-rg

SECRET_NAME="ExamplePassword"

function create_keyvault {
    echo "Creating resource group:"
    az group create --name $RG_NAME --location $LOCATION

    echo "Creating keyvault; name=$KEYVAULT_NAME, resource-group: $RG_NAME, location: $LOCATION"
    az keyvault create --name $KEYVAULT_NAME --resource-group $RG_NAME --location $LOCATION
}

function create_secret {
    echo "Creating a secret"
    az keyvault secret set --vault-name $KEYVAULT_NAME --name "${SECRET_NAME}" --value 'Pa$$word123R'
}

function retrieve_password {
    echo "Retrieving a secret"
    az keyvault secret show --vault-name $KEYVAULT_NAME --name "${SECRET_NAME}"
}

function delete_all {
    echo "Deleting group"
    az group delete --name $RG_NAME --no-wait
}

create_keyvault
create_secret
retrieve_password
delete_all
```

<script src="https://gist.github.com/wkaczurba/0bb1ed96e0ad36c13b1e7fe2642b2964.js"></script>

More resources:
 - https://learn.microsoft.com/en-us/azure/key-vault/general/developers-guide


