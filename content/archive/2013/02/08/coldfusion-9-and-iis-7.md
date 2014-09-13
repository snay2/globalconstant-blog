+++
title = "ColdFusion 9 and IIS 7"
slug = "coldfusion-9-and-iis-7"
url = "/2013/02/08/coldfusion-9-and-iis-7"
date = "2013-02-08T11:34:34.000Z"
+++

_I'm installing a ColdFusion application and ran into a few issues. Here, mostly for my future reference, is the process of solving those problems._

ColdFusion was installed before IIS 7. As such, IIS didn't have the correct handlers for ColdFusion files. Follow the [instructions on Codecurry](http://www.codecurry.com/2009/09/installing-coldfusion-on-iis-7.html) to get that resolved. The post is dated (the screenshots are on Vista), but the general process is still correct. Make sure these IIS features get installed: ASP.NET, .NET Extensibility, CGI, ISAPI Filters, and ISAPI Extensions. Then run the ColdFusion Web Server Configuration Tool to perform the necessary IIS configuration.

Once that was working, I started getting HTTP 500 errors. In my case, ColdFusion was only set up to run in 32-bit mode, even though IIS and Windows Server 2008 R2 is 64-bit. To fix this, go into IIS Manager and select the Application Pool your website is using. Choose Advanced Settings and change Enable 32-Bit Applications to True. (If you prefer the command line, see [these instructions](http://forums.iis.net/post/1912776.aspx) for this change.)
