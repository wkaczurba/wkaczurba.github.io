#!/bin/bash
set -e

# Execute az login first.

# Replace these ones with correct ones:
SERVICE_BUS_NAME_SPACE=sapps-eventdriven-servicebus # Name of service bus name space (not the queue)
RESOURCE_GROUP=sapps-eventdriven
QUEUE_NAME="upper-case"

# Maybe not a good practice but should work without creating local ones... (RootManageSharedAccessKey)
SHARED_ACCESS_KEY=$(az servicebus namespace authorization-rule keys list \
        --resource-group ${RESOURCE_GROUP} \
        --namespace-name ${SERVICE_BUS_NAME_SPACE} \
        --name RootManageSharedAccessKey \
        --query primaryKey \
        --output tsv)

SERVICE_BUS_QUEUE_URL=https://sapps-eventdriven-servicebus.servicebus.windows.net/upper-case
SHARED_ACCESS_KEY_NAME=RootManageSharedAccessKey
SHARED_ACCESS_KEY=$PRIMARY_KEY

# Generate SAS key - based on https://learn.microsoft.com/en-us/rest/api/eventhub/generate-sas-token 
EXPIRY=${EXPIRY:=$((60 * 60 * 24))} # Default token expiry is 1 day
ENCODED_URI=$(echo -n $SERVICE_BUS_QUEUE_URL | jq -s -R -r @uri)
TTL=$(($(date +%s) + $EXPIRY))
UTF8_SIGNATURE=$(printf "%s\n%s" $ENCODED_URI $TTL | iconv -t utf8)
HASH=$(echo -n "$UTF8_SIGNATURE" | openssl sha256 -hmac $SHARED_ACCESS_KEY -binary | base64)
ENCODED_HASH=$(echo -n $HASH | jq -s -R -r @uri)
SAS_TOKEN=$(echo -n "SharedAccessSignature sr=$ENCODED_URI&sig=$ENCODED_HASH&se=$TTL&skn=$SHARED_ACCESS_KEY_NAME")

# Execute CALL to REST-API
curl --location --request POST 'https://sapps-eventdriven-servicebus.servicebus.windows.net/upper-case/messages/head' \
    --header "Authorization: $SAS_TOKEN" \
    --header 'Content-Type: application/json' \
    -d ''
