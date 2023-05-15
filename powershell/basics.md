Powershell vs bash:

Setting variables from output:

`$variable = az webapp deployment list-publishing-credentials --name pizza-lunches3  --resource-group WebApp204 | jq .scmUri -r`

Bash:

bash
`variable=$(az webapp deployment list-publishing-credentials --name pizza-lunches3  --resource-group WebApp204 | jq .scmUri -r)``


