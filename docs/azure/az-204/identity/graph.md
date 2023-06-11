- [Microsoft Graph](#microsoft-graph)
  - [Intro](#intro)
  - [Calling/Querying a REST API method:](#callingquerying-a-rest-api-method)
    - [Querying](#querying)
  - [Example on how to update user - Using Graph API.](#example-on-how-to-update-user---using-graph-api)
  - [Querying Microsoft Graph using SDKs from tutorial](#querying-microsoft-graph-using-sdks-from-tutorial)
  - [Best practices](#best-practices)


# Microsoft Graph

## Intro

- Microsoft Graph API (https://graph.microsoft.com)
- Microsoft Graph connectors - gets data from external services (connectors for Box, Google Drive, Jira and Salesforce)
- Microsoft Graph Data Connect - tools to streamline delivery of MS Graph data to popular Azure Data Store.

## Calling/Querying a REST API method:

TODO: Paste results

`{HTTP method} https://graph.microsoft.com/{version}/{resource}?{query-parameters}`

GET/POST/PATCH/PUT/DELETE
version: 1.0 or beta.

### Querying 

Query parameters can be **OData** system query options


`GET https://graph.microsoft.com/v1.0/me/messages?filter=emailAddress eq 'jon@contoso.com'`

See also:
 - https://developer.microsoft.com/graph/graph-explorer

## Example on how to update user - Using Graph API.

- [Update user](https://learn.microsoft.com/en-us/graph/api/user-update?view=graph-rest-1.0&tabs=http) - eg. update about me or simlar.
- 





## Querying Microsoft Graph using SDKs from [tutorial](https://learn.microsoft.com/en-ie/training/modules/microsoft-graph/4-microsoft-graph-sdk)


NuGet packages - which ones.

`var graphClient = new GraphServiceClient(deviceCodeCredential, scopes);`

Where:

```c#

// https://learn.microsoft.com/dotnet/api/azure.identity.devicecodecredential
var deviceCodeCredential = new DeviceCodeCredential(
    callback, tenantId, clientId, options);

```


Getting info about self (https://graph.microsoft.com/v1.0/me):

`var user = await graphClient.Me.Request().GetAsync();`

Retrieve a list of entities
Delete an entity

Create a new entity

```cs
var calendar = new Calendar
{
    Name = "Volunteer"
};

var newCalendar = await graphClient.Me.Calendars
    .Request()
    .AddAsync(calendar);
```

## Best practices

Access using either `bearer token` or graph client constgructor (for libs)

Practices:
 - use least privilage
 - correct permission type based on scenarios
 - 