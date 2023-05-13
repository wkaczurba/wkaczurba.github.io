https://learn.microsoft.com/en-us/training/modules/configure-azure-resources-tools/7-simulation-command-line

```
az group create --location westeurope --name "rg1"

LOCATION=$(az group show --name 'rg1' --output tsv --query location)

# saves westuerope
# IT IS ABOUT DISK and not STORAGE CONTAINER!:
az disk create --resource-group rg1 --name $DISKNAME --sku 'Standard_LRS' --size-gb 32

az disk show --resource-group rg1 --name az104-disk1 --output table

az disk update --resource-group rg1 --name az104-disk1 --size 64

# The one below will return "64"
az disk show --resource-group rg1 --name az104-disk1 --query diskSizeGb

# Change the SKU...
az disk update --resource-group rg1 --name az104-disk1 --sku Premium_LRS

# Check the change:
az disk show --resource-group rg1 --name az104-disk1 --query sku

az disk delete --resource-group rg1 --name az104-disk1

az group delete --name rg1
```