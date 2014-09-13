+++
title = "Linux notifications for the Kynetx KRL command-line tool"
slug = "linux-notifications-for-kynetx-krl-command-line-tool"
url = "/2010/06/15/linux-notifications-for-kynetx-krl-command-line-tool"
date = "2010-06-15T22:30:03.000Z"
+++

<em>This is a response to Mike Grace's excellent post, <a href="http://geek.michaelgrace.org/2010/06/growl-notifications-for-kynetx-krl-command-line-tool/">Growl Notifications for Kynetx KRL Command Line Tool</a>. The idea is entirely his; I've just implemented a solution for Linux. I recommend you go read his post so you know what this is all about.</em>

<img alt="" src="https://scnay-images.s3.amazonaws.com/globalconstant/krl_notify.png" title="KRL commit notification" class="aligncenter" />

Since Linux uses libnotify instead of Growl, it's fairly simple to implement as similar solution to Mike's on a Linux system.

You'll need the libnotify-bin package installed. You can do that in the normal manner.

First, add the following to your ~/.bashrc file:

<blockquote>
krl() { 
&nbsp;&nbsp;if [[ $1 == "commit" ]]; then 
&nbsp;&nbsp;&nbsp;&nbsp;command krl $@ | tee status.txt 
&nbsp;&nbsp;&nbsp;&nbsp;notify-send -i ~/.kynetx-x.png "KRL" "`cat status.txt`" 
&nbsp;&nbsp;&nbsp;&nbsp;rm status.txt 
&nbsp;&nbsp;else
&nbsp;&nbsp;&nbsp;&nbsp;command krl $@ 
&nbsp;&nbsp;fi;
}</blockquote>

This is basically creating a function that will run whenever you issue the "krl commit" command. It pipes the output of the <a href="http://github.com/kynetx/krl">KRL gem</a> to a file and then uses the text of that file in the notification.

You can download the Kynetx "X" image to your home directory if you like with the following command:

<blockquote>
curl https://kynetx-apps.s3.amazonaws.com/krl-commit-growl-notify/kynetx-x.png > ~/.kynetx-x.png</blockquote>

That's it! Have fun!