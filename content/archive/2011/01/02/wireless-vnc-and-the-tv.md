+++
title = "Wireless, VNC, and the TV"
slug = "wireless-vnc-and-the-tv"
url = "/2011/01/02/wireless-vnc-and-the-tv"
date = "2011-01-02T23:45:47.000Z"
+++

So my roommate has a big screen TV. I have a laptop and a netbook. I was sitting on the couch tonight with a friend and we were looking up stuff online with my netbook. The small screen of the netbook makes it hard to share with two (or more) people. I've hooked up one of my computers to the TV before when I had a few people over for a study session. That was fine at the time, because I was sitting next to the TV (the HDMI cable is quite short). But tonight we both wanted to stay on the couch and control the TV from my netbook. The solution? VNC!

Both of my computers are running Ubuntu, so I set up a server on my laptop (with the x11vnc package) and the viewer on my netbook (with the xvnc4viewer package). From the netbook I ran this command:

<pre>vncviewer -listen</pre>

Then from the laptop I ran this command (with the IP address of the netbook):

<pre>x11vnc -connect 192.168.2.6</pre>

Voilà! The netbook's display (being a VNC viewer) is really laggy, but that's okay. Also, watching YouTube on the screen doesn't work very well because it has to stream the video AND send the screen image over the wireless to the netbook. But on the whole, a very interesting solution.

Now I can leisurely control the TV from the couch. Wirelessly. I'm such a nerd.