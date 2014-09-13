+++
title = "A KRL module for StringBin"
slug = "a-krl-module-for-stringbin"
url = "/2011/03/28/a-krl-module-for-stringbin"
date = "2011-03-28T11:37:36.000Z"
+++

<strong>UPDATE</strong>: This module is now listed in the Kynetx module directory. <a href="http://apps.kynetx.com/modules/a163x63">Check it out here.</a>

This morning I wrote my first KRL module. If you <a href="/2011/02/02/using-google-calendar-data-in-a-kynetx-app/">remember from February</a>, Sam Curren wrote a Google Calendar module that I used in my own Kynetx app for CS 462. Sam has since written the entire Kynetx <a href="https://gist.github.com/883521">Twilio functionality</a> as a module. I've had some ideas brewing for modules I'd like to write. So I started today with a really simple one: StringBin.

<a href="http://stringbin.com/">StringBin</a> is a service that Mike Grace wrote a while ago. It basically lets you store key-values pairs. That's it. There are two endpoints in <a href="http://stringbin.com/documentation">the API</a>: read and write. Both are accessed via GET.

Writing a module for this is really simple. I just needed to provide two functions (read and write) that take the correct arguments. Here's what the module code looks like, including the tests that are embedded in the ruleset:

<script src="https://gist.github.com/890894.js?file=a163x63.krl"></script>

Importing the module into another ruleset is as simple as entering your StringBin PIN in a key block and then including this in the meta block:

<code>use module a163x63 alias stringbin with stringbinkeys = keys:stringbin()</code>

Here's what it looks like in a full ruleset:

<script src="https://gist.github.com/890894.js?file=a163x64.krl"></script>

Feel free to use this module and let me know what you think of it!
