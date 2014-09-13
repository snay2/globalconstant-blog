+++
title = "Using Magic Mouse on Windows 7 with Boot Camp"
slug = "using-magic-mouse-on-windows-7-with-boot-camp"
url = "/2012/05/01/using-magic-mouse-on-windows-7-with-boot-camp"
date = "2012-05-01T10:27:39.000Z"
+++

I'm running Windows 7 on some Mac hardware with Boot Camp. The Magic Mouse didn't work right out of the box, even though Windows seems to understand the Bluetooth device just fine. I used the following combination of processes to get the Magic Mouse to work:

<ol>
<li>First, install the mouse with the following steps: <a href="https://discussions.apple.com/thread/2221427?threadID=2221427&start=0&tstart=0">Magic Mouse Guide for Windows</a></li>
<li>Second, get two-finger scrolling to work, with the updated Apple Bluetooth driver. I had a hard time finding this, but <a href="http://forums.macrumors.com/showthread.php?t=911591">here's a link that's still active</a>.</li>
<li>Third, enable natural scrolling (because using Lion on a Mac for a year ruined me to normal old-school scrolling). I used an <a href="http://www.howtogeek.com/57542/how-to-get-the-worst-os-x-lion-feature-in-windows-reverse-scrolling/">AutoHotkey script</a>.</li>
</ol>

That's it. Took a lot more research than it should have. But hey, it works now.