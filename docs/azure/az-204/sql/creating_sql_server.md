# SQL server

Setup -> TODO: record + provide a link

Connecting -> TODO: paste code

## Connection strings:

### Generating a connection string

Getting a connection string:

How to get connection string?
using C#: 

```csharp
var _builder = new SqlConnectionStringBuilder();
_builder.DataSource = db_source;
_builder.UserID = db_user;
_builder.Password = db_password;
_builder.InitialCatalog = db_database;

return new SqlConnection(_builder.ConnectionString);
```

**Or simply:**

Or:
`"Data Source="+db_source+";Initial Catalog="+db_database+";User ID="+db_user+";Password=" + db_password;`

**Or:** `Data Source` may be `Server`?: 

`"Server=tcp:"+db_source+"," + db_port + ";Initial Catalog="+db_database+";User ID="+db_user+";Password=" + db_password;`

### Setting connection string in WebApp:

https://www.udemy.com/course/azure-certification-1/learn/lecture/31939988#overview

 - Go into Application / Web App itself
 - Settings/Configuration blade

![Setting connection string](Screenshot%20from%202023-05-23%2016-20-14.png)

Gotcha:
Make sure you click this `save` button!
![](Screenshot%20from%202023-05-23%2016-39-36.png)


In the application itself:
 - Inject `IConfiguration` from `Microsoft.Extensions.Configuration.Abstarct...` and execute `.getConnectionString(name-of-key)`