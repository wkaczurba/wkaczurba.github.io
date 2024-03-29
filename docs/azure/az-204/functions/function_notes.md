# Function App 

## General notes

### App hosting options:
 - Consumption (serverless)
 - Functions Premium (event based scaling isolation - for workloads running continuously; **mitigates cold start**)
 - App service plan (fully isolated + dedicated for workloads that need large SKUs or need to co-locate WebApps and Functions)

### Cold start

- [Microsoft Blog](https://azure.microsoft.com/en-us/blog/understanding-serverless-cold-start/)
  - Stages:
    - azure allocates unspecializesd server
    - worker becomes specialized (files mounted, app settings applied)
    - function runtime resets (function read, extensions loaded)
    - function lodaded into memory
    - **FINALLY: Code runs**
- To avoid cold start: 
  - consider using Premium tier (prefered option)
  - consider dedicated (App Service Plan) - if really needed
- To mitgate issues:
  - Write in C#, F#, Javascript
  - Write shorter code
  - Use less dependencies


**Additionally** - if used as part of AppScope - may need to set "Always On" [
How do I decrease the response time for the first request after idle time?
](https://learn.microsoft.com/en-us/troubleshoot/azure/app-service/web-apps-performance-faqs#how-do-i-decrease-the-response-time-for-the-first-request-after-idle-time)


## Installation

As per: https://learn.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=v4%2Clinux%2Ccsharp%2Cportal%2Cbash#v2

You need this package for Azure Function for Java...

```bash
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list' && \
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
    sudo apt-get update && \
    sudo apt-get install azure-functions-core-tools-4
```

Check all stuff:

```bash
func --version
az --version
```

Login:
```
az login
```


## Serverless architecture.

[https://azure.microsoft.com/en-us/solutions/serverless]([azure.microsoft.com/en-us/solutions/serverless](https://azure.microsoft.com/en-us/solutions/serverless))

[](https://learn.microsoft.com/en-us/azure/architecture/serverless-quest/reference-architectures)


## Creating a function

In .NET functions:

Thje `#r "Newtonsoft.json` is an external file/dependency:

```cs
#r "Newtonsoft.Json"  

using System.Net;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Primitives;
using Newtonsoft.Json;

public static async Task<IActionResult> Run(HttpRequest req, ILogger log) {


    log.LogInformation("C# HTTP Tritgger function processed a request");
    // ...

    // req.Query["name"] -> query valuye
    // req.Body -> body

    string responseMessage = string.IsNullOrEmpty(name) ? "
    Something" : "Something  else";
    return new OkObjectResult(rewsponseMessage);
}

```

## Publishing C# from VisualStudio:


"Your app is currently in  read only mode because you are running from a package file. To make any changes update the content in 
your zip file and WEBSITE_RUN_FROM_PACKAGE app setting"

 - simply: https://stackoverflow.com/questions/70046081/azure-function-app-showing-message-your-app-is-currently-in-read-only-mode-becau change setting in description or publish again.




