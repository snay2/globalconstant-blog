+++
title = "Using Google Calendar data in a Kynetx app"
slug = "using-google-calendar-data-in-a-kynetx-app"
url = "/2011/02/02/using-google-calendar-data-in-a-kynetx-app"
date = "2011-02-02T19:34:37.000Z"
+++

<em>This is the first in a series of three posts about this app. The other pages are <a href="/2011/02/03/extending-the-office-hours-app-using-twilio/">here</a> and <a href="/2011/02/03/office-hours-reporting-the-next-time-block/">here</a>.</em>

Sam Curren wrote today about a Google Calendar module he has created for KRL. It's pretty awesome; <a href="http://www.mostlybaked.com/customize-your-ivr-menu-with-google-calendar">go check it out</a>.

The only thing it does right now is check whether we are currently in a block of time on the calendar with a given name. Sam used that to modify the Kynetx phone system whenever office hours are running. I publish my CS 462 TA office hours to a Google Calendar and wanted to do something with that data as well.

The first round of this app does some simple web augmentation on the CS 462 wiki. Whenever I'm in for my office hours, it add this line to the top of the wiki:

<a href="http://scnay-images.s3.amazonaws.com/globalconstant/ta-office-hours-banner.png"><img alt="" src="http://scnay-images.s3.amazonaws.com/globalconstant/ta-office-hours-banner.png" title="TA office hours banner" class="aligncenter" width="518" height="198" /></a>

All the app does is use Sam's module with my own Google Calendar and then run a prepend() on the wiki when an "Office hours" event is currently happening. Here's the code:

<script src="https://gist.github.com/808876.js?file=a163x40.krl"></script>

I'd like to make some improvements in the future to use Twilio (something I need to learn for later in the course). Perhaps other things, too. Leave suggestions in the comments!


EDIT: I used site tags to place this on the class wiki. If you go there right now, you'll see my office hours status!