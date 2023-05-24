# Webapps - various notes from deployments

- [Webapps - various notes from deployments](#webapps---various-notes-from-deployments)
  - [Deployment of .NET](#deployment-of-net)
  - [Deployments with Java:](#deployments-with-java)
  - [Deployments with Java - testing of crashing app](#deployments-with-java---testing-of-crashing-app)
  - [Application manifest:](#application-manifest)
  - [Authentication:](#authentication)
- [VMs - not webapps below.](#vms---not-webapps-below)
  - [Publishing ASP.NET core to Windows VM IIS (based on Udemy lab)](#publishing-aspnet-core-to-windows-vm-iis-based-on-udemy-lab)
  - [**TODO: Can record a video on this one!**](#todo-can-record-a-video-on-this-one)
  - [Publishing ASP.NET core application to Linux VM.](#publishing-aspnet-core-application-to-linux-vm)


## Deployment of .NET

Based on Azure guide: https://www.youtube.com/watch?v=0QO2jdinCoQ&ab_channel=MicrosoftAzure


```Powershell
mkdir git
cd git
git config --global user.email "<EMAIL-HERE>"
git config --global user.name "User-name"
git clone https://github.com/fouldsy/azure-mol-samples-2nd-ed.git
cd ./azure-mol-samples-2nd-ed/03/prod/
ls -la
cat index.html
git init
git add .
git commit -m "Whatever"

# The one below will give us app-based creds for deployments.
# Unlike user-based creds - only the one app can be deployed
az webapp deployment source config-local-git --name pizza-lunches3 --resource-group WebApp204

# With credentials - we add remote:
git remote add azure 'https://$pizza-lunches3:uY5RZwoccJTtDYu0bDkEMf0iqsroFmf0RGM6BaSG183m6RK3kRbElehfWji5@pizza-lunches3.scm.azurewebsites.net'

# And push...
git push azure master
```

Alternative way: (quicker, but creates all resources etc.):
`az webapp up --name pizza-lunches4 --html`

```powershell
az webapp up --name pizza-lunches4 --html
# The webapp 'pizza-lunches4' doesn't exist
# Creating Resource group 'witold.kaczurba.tv_rg_1205' ...
# Resource group creation complete
# Creating AppServicePlan 'witold.kaczurba.tv_asp_9220' ...
# Creating webapp 'pizza-lunches4' ...
# Configuring default logging for the app, if not already enabled
# Creating zip with contents of dir /home/witold ...
# Getting scm site credentials for zip deployment
# Starting zip deployment. This operation can take a while to complete ...
# Deployment endpoint responded with status code 202
#You can launch the app at http://pizza-lunches4.azurewebsites.net
#Setting 'az webapp up' default arguments for current directory. #Manage defaults with 'az configure --scope local'
#--resource-group/-g default: witold.kaczurba.tv_rg_1205
#--sku default: F1
#--plan/-p default: witold.kaczurba.tv_asp_9220
#--location/-l default: eastus
#--name/-n default: pizza-lunches4
##{
#  "URL": "http://pizza-lunches4.azurewebsites.net",
#  "appserviceplan": "witold.kaczurba.tv_asp_9220",
#  "location": "eastus",
#  "name": "pizza-lunches4",
#  "os": "Windows",
#  "resourcegroup": "witold.kaczurba.tv_rg_1205",
#  "runtime_version": "-",
#  "runtime_version_detected": "-",
#  "sku": "FREE",
#  "src_path": "//home//witold"
#}
#
```

Note that the above creates plan etc.

Now: how to run stuff from local?



## Deployments with Java:

Based on [Microsofts quickstart](https://learn.microsoft.com/en-us/azure/app-service/quickstart-java?tabs=javase&pivots=platform-linux-development-environment-maven#3---configure-the-maven-plugin)


To any Spring/or other app - add pom.xml content using plugin:

 - `mvn com.microsoft.azure:azure-webapp-maven-plugin:2.9.0:config` will add config into pom.xml:


![pom_xml_addition.png](pom_xml_addition.png)

- THen deploy using the following:
  - `mvn package azure-webapp:deploy`
  


- **NOTE 1**: That you need to be OAuth-authenticated.
- **NOTE 2: Webapp needs to be confiugred with health-check!, by default there was no health-check checks and website reported error when accessing via URL.**

## Deployments with Java - testing of crashing app

- To any Spring/or other app - add pom.xml content 

Application that crashes after 5 minutes:
 - https://github.com/wkaczurba/az-webapp/blob/master/README.md
  
 - **NOTE 1**: It was hard to spot the failuire in the health-check chart.
 - NOTE 2: By default logs are not configured.


## Application manifest:

 **- [TODO] - try different options in the app manifest ** 
 - https://learn.microsoft.com/en-us/azure/active-directory/develop/reference-app-manifest


## Authentication:

 - https://learn.microsoft.com/en-us/azure/active-directory/hybrid/connect/how-to-connect-fed-group-claims#configure-the-azure-ad-application-registration-for-group-attributes


# VMs - not webapps below.

## Publishing ASP.NET core to Windows VM IIS (based on [Udemy lab](https://www.udemy.com/course/azure-certification-1/learn/lecture/31939428#overview))
 - Create VM with 80, RDP (3389) and IIS deployment (8172) ports open, eg. Windows - see template [ExportedTemplate-mon22may-webapp.zip](ExportedTemplate-mon22may-webapp.zip)
 - VM needs to be setup with IIS
 - additionally "IIS Management Service" (role) + start it / check.
 - install the .NET Hosting Bundle:
    - if app uses .NET Core 6.0 -> it needs to be installed on the VM itself as well. https://dotnet.microsoft.com/en-us/download/dotnet/6.0 -> [Windows	Hosting Bundle](https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-aspnetcore-6.0.16-windows-hosting-bundle-installer)
 - install [web deploy v.3.6 tool](https://www.microsoft.com/pl-pl/download/details.aspx?id=43717)

   **TODO: Can record a video on this one!**
 - 

  8172 -  (IIS inbound port - probably for publishing)


## Publishing ASP.NET core application to Linux VM.

It is possible to run .NET on ubuntu server.
 - need to publish .NET Core app to local folder (dev box)
 - copy the local folder to VM's
 - install DOTNET runtime engine on Ubuntu - see: https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu-2004 
 - run on the VM `dotnet name-of-DLL-in-publish-foder`. It willi serve on 5000
 - install nginx, change configs of ngingx to act as a reverse proxy serving from :5000. (see https://learn.microsoft.com/en-us/aspnet/core/host-and-deploy/linux-nginx?view=aspnetcore-7.0&tabs=linux-ubuntu )
 - Udemy video is here: https://www.udemy.com/course/azure-certification-1/learn/lecture/31939340#overview but could not get it to work - NGINX redirected to .NET redirecting further to 5001 port.

https://learn.microsoft.com/en-us/aspnet/core/host-and-deploy/linux-nginx?view=aspnetcore-7.0&tabs=linux-ubuntu




  