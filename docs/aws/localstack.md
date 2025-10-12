# Localstack

## awscli-local

Once you have localstack up + running (eg. from docker image/docker-compose) - make sure to get CLI for local (`pip install awscli-local`)
Handy ones:
 - `awslocal sqs list-queues`
 - `awslocal s3 ls`

Debug of SQS queues
 - `queueUrl=$(awslocal sqs get-queue-url --queue-name twoapp-messages-eu-central-1 --output text)`
 - Sending: `awslocal sqs send-message --queue-url $queueUrl --message-body 'payload' --message-attributes '{ "TraceId": {"DataType":"String","StringValue":"abc-123"}, "Priority": {"DataType":"Number","StringValue":"5"}}'`
 - Receiving: `awslocal sqs receive-message --queue-url=$queueUrl --max-number-of-messages 10`

