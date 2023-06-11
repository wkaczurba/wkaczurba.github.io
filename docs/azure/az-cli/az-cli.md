# AZ CLI setup

Start: [Getting started with CLI](https://learn.microsoft.com/en-ie/cli/azure/get-started-with-azure-cli)

## Interactive

`az interactive` seems to be interesting one

## Autocompletion

(I struggled to find autocompletion for bash, did not spend much time on it).

# AZ CLI commands

Refer also to: [lab1-7-azure_cli.md](../az-104/lab1-7-azure_cli.md) 


```bash
az login
```

## Basics ##

`az account show`

```json
[
  {
    "cloudName": "AzureCloud",
    "homeTenantId": "a8....d64",
    "id": "98612...329",
    "isDefault": true,
    "managedByTenants": [],
    "name": "Free Subscription",
    "state": "Enabled",
    "tenantId": "a8e...d64",
    "user": {
      "name": "myemail@gmail.com",
      "type": "user"
    }
  }
]
```


`az group list --query "[?location=='westus']"`
```json
[
  {
    "id": "/subscriptions/9861...29/resourceGroups/may26th",
    "location": "westus",
    "managedBy": null,
    "name": "may26th",
    "properties": {
      "provisioningState": "Succeeded"
    },
    "tags": null,
    "type": "Microsoft.Resources/resourceGroups"
  }
]
```

### CosmosDB CLI


`az cosmosdb account list`

List of cosmosdb accounts:

`ACCOUNTS=$(az cosmosdb list | jq .[].name -r)`

If only one account - this will work; otherwise for-loop the query...

Lists database:

`az cosmosdb database list --resource-group may26th --name ACCOUNTS`

**Getting keys: **

az cosmosdb keys list --name thecosmos --resource-group may26th

```json
{
  "primaryMasterKey": "VpK...KQ==",
  "primaryReadonlyMasterKey": "eP3jx...MtEA==",
  "secondaryMasterKey": "NqM31...uODg==",
  "secondaryReadonlyMasterKey": "J1RdS...OemYg=="
}
```






