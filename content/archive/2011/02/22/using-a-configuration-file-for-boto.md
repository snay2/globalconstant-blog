+++
title = "Using a configuration file for Boto"
slug = "using-a-configuration-file-for-boto"
url = "/2011/02/22/using-a-configuration-file-for-boto"
date = "2011-02-22T13:25:04.000Z"
+++

In Lab 3, we're doing a lot more with Boto. It's useful to have a configuration file and put everything there so that AWS keys, SimpleDB domains, and SQS queue names don't have to be embedded in the source code. In this post, I'll talk about using a system-wide config file for Boto.

<strong>The config file</strong>
The config file itself is very simple. It has several sections, each with a heading. Under the headings are key=value pairs. Here is a simple example:

<pre>
[Credentials]
aws_access_key_id={redacted}
aws_secret_access_key={redacted}

[simpledb]
imagedomain=picture
commentdomain=comment
</pre>

You could make other sections for S3 and SQS if desired (those will be used more in Lab 4). Finally, put that file in somewhere it can be accessed by the whole system. Mine will go in /etc/boto.cfg.

<strong>Using the config file in Python</strong>
You can use the ConfigParser module to get the key/value pairs out of the config file and use them. That code might look something like this:

<pre>
import ConfigParser
config = ConfigParser.ConfigParser()
config.read(["/etc/boto.cfg"])
</pre>

Now, whenever you need to get a value from the config file, simply call get() on the ConfigParser object, passing it the section and key you want. For example, if I want to get the imagedomain key out of the simpledb section from the example config file above, I would write this:

<pre>
imagedomain = config.get('simpledb', 'imagedomain')
</pre>

<strong>Conclusion</strong>
The advantage of doing it this way is that all your Boto configuration is stored in one location out of the web root where all your scripts can access it. You don't have to hard-code all that information into the website code itself, making maintenance easier.