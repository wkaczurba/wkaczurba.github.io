# Creating Azure AD Service Principal for application:

Based on `https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build`:

```bash
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"
```

eg.:

```
{
  "appId": "d2551a53-....-....-....-XXXXXXXXXXXXXf7",
  "displayName": "azure-cli-2023-09-07-10-39-30",
  "password": "MNxxxxxxxxX.....................XXXXXXXXX",
  "tenant": "a8XXXXXX-XXXX-....-XXXX-XXXXXXXXXXXX"
}
```
