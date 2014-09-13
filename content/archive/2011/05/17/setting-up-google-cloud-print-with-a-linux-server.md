+++
title = "Setting up Google Cloud Print with a Linux server"
slug = "setting-up-google-cloud-print-with-a-linux-server"
url = "/2011/05/17/setting-up-google-cloud-print-with-a-linux-server"
date = "2011-05-17T17:21:00.000Z"
+++

<a href="http://code.google.com/apis/cloudprint/docs/overview.html"><img alt="" src="https://s3.amazonaws.com/scnay-images/globalconstant/google-cloud-print.png" title="Google Cloud Print" class="alignright" width="149" height="106" /></a><a href="http://code.google.com/apis/cloudprint/docs/overview.html">Google Cloud Print</a> has interested me for a while, but I finally got around to trying it out this week. In a word: Very cool.

At my work, we have an HP laser printer from a few years ago. It's a networked printer, so we can use it from within the LAN (or actually anywhere on the CS network given the IP address). But using it outside that network is impossible.

Chrome for Windows an OS X has a feature in which you can share your printers with your Google account (or anyone else with a Google account) and use Cloud Print to print from anywhere. This requires a computer sitting on the same LAN as the printer that will handle print jobs. Right now, Cloud Print (technically) only works on the mobile versions of Gmail and Google Docs (and I'm told it works on Chrome OS as well). So I can print emails or docs from my iPod Touch to Cloud Print and have them come out on the lab printer, all wirelessly.

<strong>Setting it up</strong>
I brought in an old laptop that has Linux on it to use as the "print server," as it were. I thought it would be simple enough--install Chrome, set up the networked printer, link it to my Google account, and start printing. The trouble is that the <a href="http://www.google.com/landing/cloudprint/win-enable.html">Cloud Print Connector doesn't work on Linux</a> (yet).

An <a href="https://github.com/armooo">enterprising hacker</a> has created a <a href="https://github.com/armooo/cloudprint">Python daemon</a> that will perform the same function as the <a href="http://www.chromium.org/developers/design-documents/google-cloud-print-proxy-design">print proxy (which is simply a protocol bridge)</a>. Installing this is dead simple:

<blockquote>sudo pip install cloudprint</blockquote>

This assumes that you have <code>python-pip</code> installed. Once that's finished, you run this command (or add it to <code>/etc/init.d</code>:

<blockquote>sudo cloudprint -d</blockquote>

The first time you run this, it asks for your Google username and password (requires an application-specific password if you're using <a href="http://www.google.com/support/accounts/bin/static.py?page=guide.cs&guide=1056283&topic=1056284">2-step verification</a>). Once that's configured, it automatically adds all the printers configured on your computer and then daemonizes itself.

(I found the <a href="http://blog.nguyenvq.com/2011/05/12/google-cloudprint-on-linux/">instructions for this process here</a>. They're more detailed than what I provide.)

That old laptop is now our dedicated print server. I shared the printer with my coworker's Gmail address so we can both send jobs to our printer no matter where we are.

<strong>Printing (almost) anything</strong>
The major drawback right now is that you can only officially use Google Cloud Print from Gmail or Google Docs on a mobile device. Luckily, I found <a href="https://chrome.google.com/webstore/detail/ffaifmgpcdjedlffbhenaloimajbdkfg#">Chrome extension that lets you print a variety of file types</a>. It's a limited selection at present, but it works well all the same.

<strong>Conclusion</strong>
I'm excited for the possibilities of Google Cloud Print. And I'm excited to see more vendors and developers integrate it into their hardware and software. I believe this is the way of the future for printing. There are still a few kinks to work out, but Google is on the right track.