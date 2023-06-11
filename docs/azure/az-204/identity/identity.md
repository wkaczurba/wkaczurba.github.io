- [Identity platform based on Explore the Microsoft Identity Platform](#identity-platform-based-on-explore-the-microsoft-identity-platform)
  - [Permissions + consent (based on Discover permissions and consent)](#permissions--consent-based-on-discover-permissions-and-consent)
  - [Service principals (based on Explore service principals )](#service-principals-based-on-explore-service-principals-)
  - [Conditional access based on Discover conditioanl access](#conditional-access-based-on-discover-conditioanl-access)
- [Authentication - implement user auth and authorization based on Microsoft tutorial](#authentication---implement-user-auth-and-authorization-based-on-microsoft-tutorial)
  - [Libraries](#libraries)
  - [Example - Microsoft tutorial: Implement interacitve authentication by using MSAL.NET](#example---microsoft-tutorial-implement-interacitve-authentication-by-using-msalnet)
- [SAS](#sas)
  - [Types - official tutorial](#types---official-tutorial)
  - [Choose when to use shared access signatures](#choose-when-to-use-shared-access-signatures)
  - [Stored access policies - TODO: paste here examples from obtaining SAS token (tutorial here)](#stored-access-policies---todo-paste-here-examples-from-obtaining-sas-token-tutorial-here)
- [Privileged Identity Management Documentation](#privileged-identity-management-documentation)


# Identity platform based on [Explore the Microsoft Identity Platform](https://learn.microsoft.com/en-ie/training/modules/explore-microsoft-identity-platform/?ns-enrollment-type=learningpath&ns-enrollment-id=learn.wwl.az-204-implement-authentication-authorization)

## Permissions + consent (based on [Discover permissions and consent](https://learn.microsoft.com/en-ie/training/modules/explore-microsoft-identity-platform/4-permission-consent))
  TODO: Describe this one: [Introduction to permissions and consent](https://learn.microsoft.com/en-us/azure/active-directory/develop/permissions-consent-overview#admin-restricted-permissions)

 - Microsoft Graph - TODO: Write more about it.
 - Microsoft 365 Mail API - http://
 - Azure Key Vault

What are scopes in OAuth.

Identity platofrm vs Microsoft Graph:
 - if resource is ommited in the request - then resource is asssummed to be Microsoft Graph, ie. scope=User.Read is equiv. to https://graph.microsoft.com/User.Read.


Permission Types:
 - delegated
 - app-only access permissions

Consent types
 + Static user consent: **TODO:** Write what are pros + cons.
 + Incremental + dynamic user consent: **TODO:** Write what are pros + cons; compare to static ones.
 + Admin consent

Requesting individual user consent.

## Service principals (based on [Explore service principals](https://learn.microsoft.com/en-ie/training/modules/explore-microsoft-identity-platform/3-app-service-principals) )

 Registering an app - one of opts:
  - Single tenant
  - Multi-tenant

Application object:
 - Three aspects:
   - how service can issue topkens in order to access the app
   - resources that the app might need access to
   - actions that the app can take
 - [Microsoft Graph Application Entity](https://learn.microsoft.com/en-us/graph/api/resources/application?view=graph-rest-1.0)


## Conditional access based on [Discover conditioanl access](https://learn.microsoft.com/en-ie/training/modules/explore-microsoft-identity-platform/5-conditional-access)

 - impact of conditional access on an app. Scenarios to consider:
   - app permforming on-behalf-of flow
   - apps accessing multiple services/resources
   - single page apps using MSAL.js
   - web apps calling a resource


# Authentication - implement user auth and authorization based on [Microsoft tutorial](https://learn.microsoft.com/en-ie/training/modules/implement-authentication-by-using-microsoft-authentication-library/?ns-enrollment-type=learningpath&ns-enrollment-id=learn.wwl.az-204-implement-authentication-authorization)

## [Libraries](https://learn.microsoft.com/en-ie/training/modules/implement-authentication-by-using-microsoft-authentication-library/2-microsoft-authentication-library-overview)

 - MSAL libs
   - (for android, angular, IOS+MacOS, Go, .js, .NET, NODE, Python, React)
     - good angular-js deepdive is in [here](https://www.youtube.com/watch?v=EJey9KP1dZA&ab_channel=Microsoft365%26PowerPlatformCommunity)
   - all working examples are in docs [here, eg. B2C example flow - something I will need](https://github.com/AzureAD/microsoft-authentication-library-for-js/tree/dev/lib/msal-react)

 - Authentication flows:
   - authorization code - native + webapps obtain tokens in name of the user
   - client credentials - service apps run w/o user interaction
   - on-behalf-of - the app calls a service/web API, which subsequently calls Microsoft Graph
   - implicit - for browser-based apps
   - device code - signig by device using another device that has web-browser
   - integrated windows - windows computer silently acquire an access token when they're domain joined
   - interactive - mobile+desktops apps call Microsoft Graphb in the name of user
   - username+password - app signs in using user's username+pass.


 - **Public client, and confidential client apps**
   - public client apps - `PublicClientApplicationBuilder` [link](https://learn.microsoft.com/en-ie/training/modules/implement-authentication-by-using-microsoft-authentication-library/3-initialize-client-applications)
   - confidential client apps `ConfidentialClientApplicationBuilder` [link](https://learn.microsoft.com/en-ie/training/modules/implement-authentication-by-using-microsoft-authentication-library/3-initialize-client-applications)


## Example - [Microsoft tutorial: Implement interacitve authentication by using MSAL.NET](https://learn.microsoft.com/en-ie/training/modules/implement-authentication-by-using-microsoft-authentication-library/4-interactive-authentication-msal)

 - [https://github.com/wkaczurba/azure_authconsoleapp](https://github.com/wkaczurba/azure_authconsoleapp)


# SAS

## Types - [official tutorial](https://learn.microsoft.com/en-ie/training/modules/implement-shared-access-signatures/2-shared-access-signatures-overview)

Types of SAS:
 - User delegation SAS - secured with **Azure AD creds + also permissions** specified for the SAS (for **Blob Storage Only**)
 - Service SAS - secured w/ **storage acc key** for: Blob storage, Queue storage, Table storage + Azure Files
 - Account SAS - secured w/ **storage acc key**, one or more storage services. Widest.

Prefered: **User delegation SAS.** whenever possible.
URL construction..

## Choose when to use shared access signatures

 - Bypassing the frontend service; frontend service only passes SAS and client's app uploads directly blobs using SAS. That way the heavy traffic does not cross the service itself.


## Stored access policies - TODO: paste here examples from obtaining SAS token ([tutorial here](https://learn.microsoft.com/en-ie/training/modules/implement-shared-access-signatures/4-stored-access-policies))

# Privileged Identity Management Documentation

The idea is of using elevated-like privilages to access important or critical resources you are less likely to deal with on a regular basis. Allows enforcing 2FA, alerts, and so on. Can be made time-bounded. PIM uses "just-in-time" and "just-enoguh-time" approaches to provide privileges.

[https://learn.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-configure](https://learn.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-configure)

