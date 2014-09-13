+++
title = "Do-it-yourself mobile optimization: A proposition"
slug = "do-it-yourself-mobile-optimization-a-proposition"
url = "/2010/06/24/do-it-yourself-mobile-optimization-a-proposition"
date = "2010-06-24T16:53:08.000Z"
+++

There are a lot of websites I visit on my phone that haven't been optimized for smartphones.

<a href="https://scnay-images.s3.amazonaws.com/globalconstant/byu_palm_pre.png"><img alt="" src="https://scnay-images.s3.amazonaws.com/globalconstant/byu_palm_pre.png" title="BYU.edu (unoptimized) on a Palm Pre at 320x480" width="150" /></a>

First of all, those websites bug me. Pinching and zooming and panning around just to find the tiny link I'm searching for gets old really fast.

So I have a proposition. I want a mobile app that will let me apply my own stylesheets to those websites. That way even though those webmasters refuse to optimize their site for me, I can still get an acceptable (read: usable) experience on their website from my phone.

Take <a href="http://www.byu.edu/webapp/home/index.jsp">BYU's website</a> for example. It was designed for a screen at least 985 pixels wide. That's great on a computer, but it's awful on a mobile screen that's only 320 pixels wide.

Luckily, BYU's web designers were smart enough to do almost all of the layout using CSS. This means that I can create a stylesheet of my own that will display only the stuff I want to see. For example, it could only show the Students and Route Y menus and hide the news feed and all the other links that I don't care about.

The <a href="https://addons.mozilla.org/en-US/firefox/addon/60/">Web Developer add-on</a> in Firefox will let me apply my own stylesheets to any website so I can make it look just how I want. Indeed, this sort of user modification of website styling was <a href="http://en.wikipedia.org/wiki/Cascading_Style_Sheets#Sources">one of the core intentions of CSS</a> in the first place. Users need not be at the mercy of webpage authors as far as presentation of content is concerned.

<a href="https://scnay-images.s3.amazonaws.com/globalconstant/byu_user_stylesheet.png"><img alt="" src="https://scnay-images.s3.amazonaws.com/globalconstant/byu_user_stylesheet.png" title="BYU.edu with custom user stylesheet (320x480)" width="150" /></a>

Here you can see the results when I disabled all linked stylesheets and instead used <a href="https://snay2-posts.s3.amazonaws.com/byu.css">my own user stylesheet</a>. At 320 pixels, you still can't see everything, but it's a start.

It would be cool if this app were a <a href="http://www.kynetx.com/">Kynetx</a> endpoint. That would allow me to write rule-based modifications of websites in the cloud, without having to store anything locally on my phone. It would be even cooler if that app would just modify content right my default browser.

But even if that doesn't work out, it would be possible to create a mobile app that displays the web pages in an embedded browser and then applies my favorite stylesheets to them as they're being loaded.

It would be <em>really</em> cool if all browsers (including mobile browsers) would just support this natively. <a href="http://www.opera.com/docs/usercss/">Opera does</a>. Why does no one else?

Maybe I'll just go write this mobile app myself.
