+++
title = "XHR AJAX doesn't work across subdomains"
slug = "jquery-ajax-doesnt-work-across-subdomains"
url = "/2010/06/05/jquery-ajax-doesnt-work-across-subdomains"
date = "2010-06-05T14:35:50.000Z"
+++

I've finally come to the bottom of <a href="http://stackoverflow.com/questions/2961051/cas-authentication-and-redirects-with-jquery-ajax">a vexing problem</a>: XMLHttpRequest AJAX calls only work on the same subdomain.

In addition, cookies are passed to their proper places as you would expect, and redirects are handled correctly by the browser. But the ultimate result that the webpage making the AJAX request and the web service returning the data must be on the same subdomain is a little disappointing.

It's possible to overcome this with JSONP or by having the web service wrap its return value in a callback function. But for security reasons, we decided that this was not the best model for our web services and are seeking other solutions.

---

If you're interested in the technical details of how I came to these conclusions, I'll describe them now.

## Protocols and subdomains

First of all, I set up my /etc/hosts file to have localhost.byu.edu and snay2.byu.edu point back to 127.0.0.1 for testing purposes. I also set up my local Tomcat 6 to take requests both on port 8080 (for normal HTTP) and on 8443 (for HTTPS) to test the different protocols. These are the results:

- When calling from a page on the HTTP side, access to services on HTTPS is disallowed. That is, the jQuery AJAX call returns an HTTP status code of 0. Firebug reveals that the request is actually made and that a response comes back, but the browser refuses to process it.
- The reverse is also true: When calling from a page on HTTPS, access to services on HTTP is disallowed.
- AJAX calls can't be made across subdomains. When I call from localhost.byu.edu to localhost.byu.edu the request succeeds (and returns data). But when I call from snay2.byu.edu to localhost.byu.edu (or the reverse), the HTTP status code is 0 and the browser won't let jQuery handle the data that comes back.

The odd thing about all of this is that Firebug is showing that the requests were indeed made and that they come back with data. jQuery simply won't invoke the callback function I gave it to use the data. If anyone knows why that is, please enlighten me.

## Redirects and cookies

The other two issues that seemed to be involved in the problem (albeit indirectly) were redirects and cookies. CAS (<a href="http://en.wikipedia.org/wiki/Central_Authentication_Service">Central Authentication Service</a>) makes extensive use of HTTP redirects (usually a 302) to handle authentication. When initially trying to debug these web service calls, it was unclear whether the redirects simply weren't being handled by jQuery or if there was something else going on. A few tests with PHP scripts allowed me to confirm that jQuery AJAX does indeed handle redirects properly.

The first PHP script makes an AJAX request (note that these scripts are all on the same subdomain):

**`test.php:`**

    <html>
    <head>
      <title>Test</title>
      <script src="jquery.tools.customized.min.js" type="text/javascript"></script>
      <script type="text/javascript">
        var callService = function() {
          var request = 'http://www.scnay.com/coe/services/landing.php';
          $.get(request, gotResponse);
        };

        var gotResponse = function(data) {
          alert("Got the results!! " + data);
        };
     
       </script>

    </head>
    <body>
      <input type="button" onclick="callService();" value="Call service" />
    </body>
    </html>

The second one sends a redirect to the browser:

**`landing.php:`**

    <?php
    header('Location: http://www.scnay.com/coe/services/real.php');
    ?>

The third script returns some data:

**`real.php:`**

    <?php
    echo 'Success!';
    ?>

Clicking the button from test.php sends a request to landing.php. The redirect is properly handled and the string "Success!" is returned from real.php. Redirects work!

The other issue in question was cookies. CAS stores a TGT cookie on the cas.byu.edu domain so that the user doesn't have to re-login every time a CAS-secured request is made. The question was whether that TGT cookie was getting passed to cas.byu.edu when the request was made there, either explicitly or through a redirect.

To test this, I first modified test.php to set a cookie. Then I modified real.php to return "Success!" only if the cookie was found and otherwise to return an error message.

This simple test showed that the cookies are indeed passed along as would be expected.

---

## Conclusion

While the answer is not wholly satisfying (XMLHttpRequest AJAX calls can't be made across subdomains without using JSONP, callbacks, or proxies), at least we now know what's going on. Now to search for a reasonable solution...

Do you have experience with this? Any suggestions I might try?
