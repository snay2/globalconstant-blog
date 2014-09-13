+++
title = "Getting Gabble to \"Yam!\""
slug = "getting-gabble-to-yam"
url = "/2010/06/17/getting-gabble-to-yam"
date = "2010-06-17T12:35:54.000Z"
+++

I discovered Gabble this morning, a native Mac OS X client for Yammer. The interface is great, and it integrates seamlessly with Mac OS X. It offers threaded messaging, something the Adobe AIR client doesn't do (even though it's not quite as slick as the web application). It doesn't artificially truncate URLs, meaning you can copy and paste URLs directly to/from the messages themselves without having to do any hoop-jumping or black magic.

It also uses Growl for its notifications.

The only catch is that you can't use the default Yammer notification sounds. One of my friends particularly likes the one that says "Yam!" when a new message arrives.

I figured out a way to satisfy his "Yam!" fix.

Growl lets you customize notifications from individual applications, including specifying a sound that should play when a notification pops up. However, by default, only the typical Mac sounds are listed as options. But you can <a href="http://arstechnica.com/apple/news/2008/11/growl-tip-make-marsedit-any-app-play-custom-sound-alarms.ars">add a custom sound</a> to that list if you put the sound file in ~/Library/Sounds.

Remember the Mac OS X program "say"? You can <a href="http://superuser.com/questions/135771/execute-a-shell-script-when-growl-notification-is-shown">use it to create sound files</a> as well. And if you use the voice "Cellos", it sounds almost like the original "Yam!" sound from the AIR client. Run this command:

<blockquote>say -o ~/Library/Sounds/Yam.aiff -v Cellos yam</blockquote>

Now go to System Preferences and open up the Growl section. Click on Applications and then choose Gabble from the list. Click the Configure... button. You should now see an entry at the bottom of that list labeled "Yam." Select that one and close Preferences.

There you go! Now you can have the goodness of a native Mac OS X Yammer client, message threading, and no annoyingly truncated URLs, all without sacrificing that beloved "Yam!" sound.

Enjoy!
