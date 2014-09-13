+++
title = "Quick start guide to mod_rewrite"
slug = "quick-start-guide-to-mod_rewrite"
url = "/2011/11/19/quick-start-guide-to-mod_rewrite"
date = "2011-11-19T14:21:54.000Z"
+++

The Apache mod_rewrite module turns out to be a very useful tool when you're building PHP applications. Here's a simple quick start guide:

First, make sure Apache has the mod_rewrite module installed. In Ubuntu, you can execute this command:

<pre>sudo a2enmod rewrite</pre>

Make sure that the AllowOverride directive is set to "All" for the folder containing your files. On Ubuntu, it's under /etc/apache2/sites-enabled/, called 000-default or default-ssl.

Now, create an .htaccess file in your site's root folder. Here's an example:

<pre>RewriteEngine On
RewriteBase /~snay2/
RewriteRule ^driver-esl/<strong>(.*)</strong>/<strong>(.*)</strong>/$ driver-esl-handler.php?driver=<strong>$1</strong>&flowershop=<strong>$2</strong> [QSA]</pre>

Some notes:

<ul><li>The bolded sections are the capturing portions of the regex and where I use them in the rewritten URL.</li>
<li>The [QSA] at the end of the line means "query string append": anything in the query string of the original request will get appended to the new query string Apache created on the fly.</li>
<li>Change the RewriteBase to whatever the root URL of your site is. This was the biggest thing that tripped me up.</li>
<li>For some reason, I had problems getting the rewriting to work on an EC2 Ubuntu instance when the URL and the PHP file had the same name. So I called the PHP file driver-esl-handler.php instead.</li>
</ul>

I've set up a simple PHP script at driver-esl-handler.php like this:

<pre>&lt;?php
  header('Content-Type: text/plain');
  print_r($_REQUEST);
?&gt;</pre>

Now if I go to a URL like this

<pre>http://students.cs.byu.edu/~snay2/driver-esl/driver1/fs2/?_domain=rfq&_name=delivery_ready</pre>

I get the following response:

<pre>Array
(
    [driver] => driver1
    [flowershop] => fs2
    [_domain] => rfq
    [_name] => delivery_ready
)</pre>

I found a great <a href="http://www.cheatography.com/davechild/cheat-sheets/mod-rewrite/">cheat sheet for mod_rewrite here</a>. It's worth perusing if you're doing anything other than elementary rewriting. You can also read the <a href="http://httpd.apache.org/docs/current/mod/mod_rewrite.html">official Apache docs</a>.