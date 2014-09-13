+++
title = "Coding in the cloud: SourceKit"
slug = "coding-in-the-cloud-sourcekit"
url = "/2011/02/10/coding-in-the-cloud-sourcekit"
date = "2011-02-10T11:31:28.000Z"
+++

There is a project called <a href="https://github.com/kenotron/sourcekit">SourceKit</a> that intrigues me. It's a Bespin editor inside a <a href="https://chrome.google.com/webstore/detail/iieeldjdihkpoapgipfkeoddjckopgjg">Chrome extension</a> that integrates with your Dropbox account.

What's so cool about this is that it opens a lot of doors for programmers to use web-only devices (<a href="http://twitter.com/tiegz/status/35741421247922176">like those running Chrome OS</a>) to do programming that would normally have to be done on a full-fledged machine. There are already similar things like <a href="http://ares.palm.com/Ares/about.html">Palm Ares</a> (used for writing webOS apps) and of course <a href="http://appbuilder.kynetx.com/">Kynetx AppBuilder</a> (but there your code runs in the cloud anyway).

Imagine this:

<strong>The client.</strong> You're working on a website that runs your scripting language of choice (not a compiled language). Let's say PHP for sake of argument. You put all those PHP files into a folder on your Dropbox. With the SourceKit extension, you can edit them with just a browser, no command line or IDE necessary.

<strong>The server.</strong> Your server is set up to sync to Dropbox (perhaps with its own account on a shared folder). It downloads the changes you make immediately when you save the file. You can then go to your website (also from the browser) and test the new code immediately. This might be a better setup for a dev server than a production server, of course, but you could figure out a way to push code to the production server once it is ready.

You could imagine ways of doing this for code that needs to be compiled (e.g., compile on a server and use a browser-based terminal emulator to SSH in). I'd think you could also build a Git client to commit/push code to a Git repo rather than Dropbox. The possibilities are endless.

I'm excited to see where this goes.

Just a note: <a href="http://bespin.mozillalabs.com/">Bespin</a> was <a href="http://mozillalabs.com/skywriter/2010/09/02/bespin-is-now-mozilla-skywriter-moves-to-github/">renamed Skywriter</a> and later <a href="http://mozillalabs.com/skywriter/2011/01/18/mozilla-skywriter-has-been-merged-into-ace/">merged with Ace</a>. But <a href="http://twitter.com/kirbysayshi">@kirbysayshi</a> on Twitter <a href="http://twitter.com/kirbysayshi/status/35750413584048128">pointed out</a> to me that <a href="https://github.com/kenotron">kenotron</a> is <a href="https://github.com/kenotron/sourcekit/commit/760645d8f56896460069036e76723cddabb5f9d8">already working on using Ace</a>. Cool!