+++
title = "Office Hours app: Reporting the next time block"
slug = "office-hours-reporting-the-next-time-block"
url = "/2011/02/03/office-hours-reporting-the-next-time-block"
date = "2011-02-03T16:10:11.000Z"
+++

<em>This is the third in a series of three posts about this app. The other pages are <a href="/2011/02/02/using-google-calendar-data-in-a-kynetx-app/">here</a> and <a href="/2011/02/03/extending-the-office-hours-app-using-twilio/">here</a>.</em>

If you text the CS 462 Office Hours app and get back a response that I'm not currently holding hours, it'd be nice to know when the next time is that I'll be in. I modified the app using the <a href="http://www.mostlybaked.com/kyntwilgoocal-tell-me-when">next() function in Sam's module</a> to do just that.

<a href="http://scnay-images.s3.amazonaws.com/globalconstant/ta-office-hours-text.png"><img alt="" src="http://scnay-images.s3.amazonaws.com/globalconstant/ta-office-hours-text.png" title="Next office hours text" class="aligncenter" width="550" /></a>

This was fairly simple. Here are the important pieces of code. First, the modified SMS rules (rules for voice calls are similar):

<script src="https://gist.github.com/810317.js?file=a163x40.krl"></script>

This is supported by a function in the global block, similar to Sam's "verbaldate" function:

<script src="https://gist.github.com/810320.js?file=a163x40.krl"></script>

What's next? Perhaps durations: I'm currently holding office hours, but how long will that last (i.e., when does this shift end)? I'd also like to modify the messages to say "today at 3 PM" instead of "Thursday (Feburary 3) at 3 PM". Lots of good ideas. What do you think?

EDIT: I added durations to the SMS and voice calls, as well as to the class wiki annotation. In addition, we planted site tags there, so everyone sees the schedule now. :)
