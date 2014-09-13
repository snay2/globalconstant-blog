+++
title = "Kynetx module for Postmark"
slug = "kynetx-module-for-postmark"
url = "/2011/04/04/kynetx-module-for-postmark"
date = "2011-04-04T12:51:31.000Z"
+++

<strong>UPDATE</strong>: This module is now listed in the Kynetx module directory. <a href="http://apps.kynetx.com/modules/a163x74">Check it out here</a>.

There was a <a href="http://stackoverflow.com/questions/5524217/krl-can-i-send-an-email-with-emailforward">question on Stack Overflow</a> over the weekend about sending email through KRL. Sam's answer was that it's currently not possible in the runtime, but that you could create a module to work with a service like Postmark or SendGrid. I decided to take on the challenge.

The first draft of this module only lets you send with from, to, subject, and HTML body, but I'll extend it to support everything in the <a href="http://developer.postmarkapp.com/developer-build.html">Postmark API</a>.

Here's how to use it from your own app:

<script src="https://gist.github.com/902158.js?file=a163x75.krl"></script>

A few things to note:
<ul>
	<li>You need to provide keys to the module which contain your Postmark API key and the sender address. The sender is set globally here because that is more in line with the way the Postmark API works.</li>
	<li>The <code>send_email()</code> action will automatically raise and HTTP post event called "postmark_send". You can listen for this event and use the responses, as illustrated by the second rule in the ruleset.</li>
	<li>You need your own account with Postmark to use this. The free portion of the API is limited in how much you can send. You're also not allowed to send bulk emails or anything of that sort. Using Postmark responsibly rests on your shoulders.</li>
</ul>

Let me know what you think of it!
