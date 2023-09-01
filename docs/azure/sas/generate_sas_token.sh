#!/bin/bash
#
# Snippet from here: `https://learn.microsoft.com/en-us/rest/api/eventhub/generate-sas-token`
#

get_sas_token() {
    local EVENTHUB_URI=$1
    local SHARED_ACCESS_KEY_NAME=$2
    local SHARED_ACCESS_KEY=$3
    local EXPIRY=${EXPIRY:=$((60 * 60 * 24))} # Default token expiry is 1 day

    local ENCODED_URI=$(echo -n $EVENTHUB_URI | jq -s -R -r @uri)
    local TTL=$(($(date +%s) + $EXPIRY))
    local UTF8_SIGNATURE=$(printf "%s\n%s" $ENCODED_URI $TTL | iconv -t utf8)

    local HASH=$(echo -n "$UTF8_SIGNATURE" | openssl sha256 -hmac $SHARED_ACCESS_KEY -binary | base64)
    local ENCODED_HASH=$(echo -n $HASH | jq -s -R -r @uri)

    echo -n "SharedAccessSignature sr=$ENCODED_URI&sig=$ENCODED_HASH&se=$TTL&skn=$SHARED_ACCESS_KEY_NAME"
}

get_sas_token $SERVICEBUS_URI \
    justkey \
    wRkQBxJ6eUqRgWdWJVuN4YVuatO0KB7ed+ASbMGrBzc= \
    2


NAMESPACE_NAME=sapps-eventdriven
QUEUE_NAME=upper-case
SERVICEBUS_URI=${NAMESPACE_NAME}.servicebus.windows.net/$QUEUE_NAME
SHARED_ACCESS_KEY_NAME=justkey
SHARED_ACCESS_KEY="eYfbNa7T5tN6dDMzbzBHit528T9XvfDtt+ASbBiegso="

EXPIRY=${EXPIRY:=$((60 * 60 * 24))}
ENCODED_URI=$(echo -n $SERVICEBUS_URI | jq -s -R -r @uri)
TTL=$(($(date +%s) + $EXPIRY))
UTF8_SIGNATURE=$(printf "%s\n%s" $ENCODED_URI $TTL | iconv -t utf8)

HASH=$(echo -n "$UTF8_SIGNATURE" | openssl sha256 -hmac $shared_access_key -binary | base64)

ENCODED_HASH=$(echo -n $HASH | jq -s -R -r @uri)

SAS=$(echo -n "SharedAccessSignature sr=$ENCODED_URI&sig=$ENCODED_HASH&se=$TTL&skn=$SHARED_ACCESS_KEY_NAME")
echo --- SAS: ----
echo $SAS
echo ------------

# http{s}://{serviceNamespace}.servicebus.windows.net/{queuePath}/messages/head

# # endpoint from: https://learn.microsoft.com/en-us/rest/api/servicebus/peek-lock-message-non-destructive-read

# sapps-eventdriven-servicebus.servicebus.windows.net/;SharedAccessKeyName=justkey;SharedAccessKey=eYfbNa7T5tN6dDMzbzBHit528T9XvfDtt+ASbBiegso=

curl --location --request POST 'https://sapps-eventdriven-servicebus.servicebus.windows.net/upper-case/messages/head' \
    --header "Authorization: $SAS" \
    --header 'Content-Type: application/json'


# curl -d '' -H "Content-Type: application/json" \
#     -H "Authorization: SharedAccessSignature SharedAccessSignature sr=&sig=U0hBMjU2KHN0ZGluKT0gMDFlNGJiMTIwYjMzZDc0MTcxZjFmY2NmYTZkMDFjZmM4NWE0MzQyYWYy%20Nzc0YmU5NTAzYTNkNTRlYjU4MWIyOAo%3D&se=1693143446&skn=wkaczurba@wkacz" \
#     -X POST https://sapps-eventdriven-servicebus.servicebus.windows.net/upper-case/messages/head

#     SharedAccessKeyName=justkey;SharedAccessKey=eYfbNa7T5tN6dDMzbzBHit528T9XvfDtt+ASbBiegso=







rgname=sapps-eventdriven
servicebus_uri=sapps-eventdriven-servicebus.servicebus.windows.net/upper-case
shared_access_key_name=ZlgMkVC4TmEMpS8QFPth1TrdHC98mb1YL+ASbJuUQeU=
shared_access_key=listener

EXPIRY=${EXPIRY:=$((60 * 60 * 24))}
ENCODED_URI=$(echo -n $servicebus_uri | jq -s -R -r @uri)
TTL=$(($(date +%s) + $EXPIRY))
UTF8_SIGNATURE=$(printf "%s\n%s" $ENCODED_URI $TTL | iconv -t utf8)

HASH=$(echo -n "$UTF8_SIGNATURE" | openssl sha256 -hmac $shared_access_key -binary | base64)

ENCODED_HASH=$(echo -n $HASH | jq -s -R -r @uri)

echo -n "SharedAccessSignature sr=$ENCODED_URI&sig=$ENCODED_HASH&se=$TTL&skn=$shared_access_key_name"
echo $SAS

curl --location --request POST 'https://sapps-eventdriven-servicebus.servicebus.windows.net/upper-case/messages/head' \
--header 'Authorization: SharedAccessSignature sr=sapps-eventdriven-servicebus.servicebus.windows.net%2Fupper-case&sig=Pl%2FvU60AhgR7pXvtRivXpCjhsXfpAvBqPBYKYHBGVos%3D&se=1693145596&skn=ZlgMkVC4TmEMpS8QFPth1TrdHC98mb1YL+ASbJuUQeU' \
--header 'Content-Type: application/json'
--d ""

