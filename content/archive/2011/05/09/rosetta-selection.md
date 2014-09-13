+++
title = "Rosetta Selection"
slug = "rosetta-selection"
url = "/2011/05/09/rosetta-selection"
date = "2011-05-09T17:39:59.000Z"
+++

<a href="http://en.wikipedia.org/wiki/Rosetta_Stone"><img alt="" src="http://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Rosetta_Stone.jpg/82px-Rosetta_Stone.jpg" title="The Rosetta Stone" class="alignright" width="82" /></a>

I wrote a Kynetx app this weekend that lets you translate any text you select on a web page into English: <strong><a href="http://apps.kynetx.com/installable_apps/4123-Rosetta_Selection">Rosetta Selection</a></strong>.

Sometimes I'm reading a page that is mostly in English but has a French phrase or a Spanish quote. Since I only know a few words of those languages, I have wanted to translate that text into English. Going to <a href="http://translate.google.com/">translate.google.com</a> isn't hard, but it's inconvenient. I lose some of the context of what I was reading.

Google has an API for Translate. A few weeks ago, I wrote a <a href="http://apps.kynetx.com/modules/a163x92">KRL module for that API</a>. Rosetta Selection is the first app I've written that makes use of that module.

Rosetta Selection lets you select any text on a web page and press Ctrl+Alt+R. It sends that text through the Google Translate API and shows you the translation in a popup in the upper right corner of the page. Easy as that!

<a href="https://s3.amazonaws.com/scnay-images/globalconstant/rosetta-selection-screenshot.png"><img alt="" src="https://s3.amazonaws.com/scnay-images/globalconstant/rosetta-selection-screenshot.png" title="Rosetta Selection in action" class="aligncenter" width="600" /></a>

<a href="http://apps.kynetx.com/installable_apps/4123-Rosetta_Selection">Go install it in the KBX now!</a>

This is still the first iteration. I'd like to make some UI improvements and add some configuration options. What improvements or options would <strong>you</strong> like to see?