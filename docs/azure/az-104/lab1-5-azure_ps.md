https://learn.microsoft.com/en-us/training/modules/configure-azure-resources-tools/5-simulation-powershell

```powershell
PS /home/witold> New-AzResourceGroup -location 'West Europe' -Name 'rg-2'

# ResourceGroupName : rg-2
# Location          : westeurope
# ProvisioningState : Succeeded
# Tags              : 
# ResourceId        : /subscriptions/98612492-ec5d-4efc-9b5c-3a8f01bdf329/resourceGroups/rg-2


# Az-Resource-Group:

PS /home/witold> $location=(Get-AzResourceGroup -Name rg-2).Location 
PS /home/witold> echo $location                                                                                 
westeurope


# Disk Config
$diskConfig=(New-AzDiskConfig -Location $location -CreateOption empty -DiskSizeGb 64 -Sku Standard_LRS)

# Creating disk:
New-AzDisk -ResourceGRoupName rg-2 -DiskName 'Disk01' -Disk $diskConfig

# Get configs:
Get-AzDisk -ResourceGroupName rg-2 -Name Disk01 | Format-Table

# Trying to size-down the disk wont work.
PS /home/witold> New-AzDiskUpdateConfig -DiskSizeGb 32 | Update-AzDisk -ResourceGroupName rg-2 -DiskName Disk01                
# Update-AzDisk: The disk/snapshot resource with id /subscriptions/98612492-ec5d-4efc-9b5c-3a8f01bdf329/resourceGroups/rg-2/providers/Microsoft.Compute/disks/Disk01 cannot be resized down. Reducing disk/snapshot size is not supported in Azure to prevent data loss. If you do need to reduce the size of the disk, please create new snapshot/disks with the appropriate size. More information is available at https://aka.ms/AzureDisksFAQ.

# This works ok:
New-AzDiskUpdateConfig -DiskSizeGb 65 | Update-AzDisk -ResourceGroupName rg-2 -DiskName Disk01

New-AzDiskUpdateConfig -Sku Premium_ZRS | Update-AzDisk -ResourceGroupName rg-2 -DiskName Disk01

 (Get-AzDisk -ResourceGRoupName rg-2 -Name Disk01).sku                                           

#     Name        Tier
#     ----        ----
#     Premium_ZRS Premium


# Removing
Remove-AzDisk -ResourceGroupName rg-2 -DiskName Disk01

    # Remove-AzDisk operation
    # This cmdlet will remove the specified resource.  Do you want to continue?
    # [Y] Yes  [N] No  [S] Suspend  [?] Help (default is "Y"): Y

    # Name      : d0ba3342-73db-435b-a901-602a35396e06
    # StartTime : 3/15/2023 10:38:42 AM
    # EndTime   : 3/15/2023 10:39:18 AM
    # Status    : Succeeded
    # Error     : 
```