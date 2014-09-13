+++
title = "OpenSolaris on a Pavilion dv6"
slug = "opensolaris-on-a-pavilion-dv6"
url = "/2009/09/19/opensolaris-on-a-pavilion-dv6"
date = "2009-09-19T22:27:55.000Z"
+++

I decided to get adventurous and try out <a href="http://opensolaris.org/os/">OpenSolaris</a> on my HP Pavilion dv6 laptop. My goal: to find a solid OS that works out of the box or with little configuration on this fairly new laptop. In particular, sound and wireless are important criteria. My findings?

First of all, when I booted into the live CD, I got a horrible static noise from the speakers. It only took me a minute to think of plugging in my headphones to divert the racket. It turns out that the headphones don't get any static. In fact, sound works perfectly on them (something Ubuntu can't boast on my machine, try as I may to work through <a href="http://ubuntuforums.org/showthread.php?t=1192274">possible solutions</a>). Lack of sound under Ubuntu was one of my main motivations to try another OS. But constant static is obviously worse than no sound at all, and I don't always have my headphones plugged in.

Next, wireless support is practically nonexistent out of the box. The OpenSolaris community touts the availability of <a href="http://opensolaris.org/os/community/laptop/wireless/">several wireless tools</a>, but these don't come installed and ready to go, which is one of my criteria. (I'm <a href="http://mmartinsoftware.blogspot.com/2009/02/opensolaris-wireless-disappoints.html">not the only one</a> who has had this setback.) But wired ethernet works just fine. (In fact, I'm writing this post while still on the live CD on my laptop.)

Screen resolution is another disappointment. It thinks my widescreen is 1024x768 (which it's not), and that this is the only supported resolution on my screen (which it's not).

<a href="https://scnay-images.s3.amazonaws.com/globalconstant/opensolaris-nimbus1.png"><img class="size-thumbnail wp-image-97" title="opensolaris-nimbus1" src="https://scnay-images.s3.amazonaws.com/globalconstant/opensolaris-nimbus1-small.png" alt="Nimbus" width="150" height="104" /></a>

On the bright side, OpenSolaris has a nice GNOME theme: Nimbus. And the applications that come preinstalled are pretty standard: Firefox, Thunderbird, the usual GNOME tools. But if you want OpenOffice.org (or any office suite, for that matter), you'll have to get it yourself from the package manager.

If you're looking for a ready-to-go, easy to use desktop operating system that will support your hardware right from the start, OpenSolaris is not the choice for you. However, if you want some of the <a href="http://www.opensolaris.com/learn/features/server/">cool features</a> it offers for server installations or robust workstations without these hardware issues, it may well be a good choice.
