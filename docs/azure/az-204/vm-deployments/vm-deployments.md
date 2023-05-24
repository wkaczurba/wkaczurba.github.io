
# VMs depoloyments.

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
