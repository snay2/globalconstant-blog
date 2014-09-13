+++
title = "Extending the Office Hours app using Twilio"
slug = "extending-the-office-hours-app-using-twilio"
url = "/2011/02/03/extending-the-office-hours-app-using-twilio"
date = "2011-02-03T12:32:17.000Z"
+++

<em>This is the second in a series of three posts about this app. The other pages are <a href="/2011/02/02/using-google-calendar-data-in-a-kynetx-app/">here</a> and <a href="/2011/02/03/office-hours-reporting-the-next-time-block/">here</a>.</em>

I extended my <a href="/2011/02/02/using-google-calendar-data-in-a-kynetx-app/">CS 462 office hours app</a> this morning to include some Twilio features. I used <a href="http://www.mostlybaked.com/how-i-created-an-instant-phone-auction-with-k">Sam's auction example</a> heavily, since the <a href="http://docs.kynetx.com/docs/Twilio">Kynetx docs</a> don't talk about SMS much.

Basically, this app lets you call or text a phone number and find out whether I'm in my office hours.

I started by registering a phone number with Twilio. The number for this app is <strong>801.855.6574</strong>. Once I had the number, I added two handlers, one for voice and one for SMS. They look like this:

http://webhooks.kynetxapps.net/t/a163x40.dev/onanswer

http://webhooks.kynetxapps.net/t/a163x40.dev/sms

I'm using the ".dev" extension since I was developing this actively. I might change that for the production app.

The KRL was pretty simple. I just needed two rules: one to handle the "twilio onanswer" event, one to handle the "twilio sms" event. That code looks like this:

<script src="https://gist.github.com/809919.js?file=a163x40.krl"></script>

I'd like to extend this in a few ways. One will tell you the next time I have office hours if I'm not there right now. Another might be allowing more options through SMS (asking whether I'm there, what the next time slot is, etc.). Other ideas you have?