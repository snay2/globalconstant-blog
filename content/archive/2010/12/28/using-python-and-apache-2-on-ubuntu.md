+++
title = "Using Python and Apache 2 on Ubuntu"
slug = "using-python-and-apache-2-on-ubuntu"
url = "/2010/12/28/using-python-and-apache-2-on-ubuntu"
date = "2010-12-28T15:13:16.000Z"
+++

<em>This is the first in a series of posts detailing my experiences and discoveries as a TA for Phil Windley's <a href="http://classes.windley.com/462/">CS 462</a> class, "Large-scale Distributed System Design." Most of the posts will be how-tos, with perhaps the occasional architectural discussion or piece of insight. Enjoy the ride!</em>

We're using <a href="http://aws.amazon.com/ec2/">Amazon EC2</a> in this class. The first thing I managed to do was get an Ubuntu server up and running (using <a href="http://aws.amazon.com/amis/4347">10.04 LTS</a>). This wasn't too hard. The next part was getting Apache 2 and Python installed so I can get a basic web server going. This required the following packages:

<ul>
<li>apache2 (and all it's dependencies)</li>
<li>libapache2-mod-python</li>
<li>... and a few other python-* libraries that I won't detail here.</li>
</ul>

All fine and dandy. It amazed me how fast apt-get install was able to run, since there appears to be an Ubuntu repository hosted on S3 in the same region.

But Apache won't actually run Python files until you configure it to do so. I did this by <a href="http://ubuntuforums.org/showpost.php?p=792999&postcount=3">editing</a> /etc/apache2/sites-available/default and adding three lines to right section. I put them in the &lt;Directory /var/www/&gt; section, since that's where my code is going to go.

<pre>
    &lt;Directory /var/www/&gt;
        Options Indexes FollowSymLinks MultiViews
        AllowOverride None
        Order allow,deny
        allow from all

        DirectoryIndex index.html index.py

        AddHandler mod_python .py
        PythonHandler mod_python.publisher
        PythonDebug On
    &lt;/Directory&gt;
</pre>

And it works! Awesome.