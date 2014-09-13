+++
title = "Rethinking the Office Hours app"
slug = "rethinking-the-office-hours-app"
url = "/2012/01/13/rethinking-the-office-hours-app"
date = "2012-01-13T10:09:30.000Z"
+++

It's Winter Semester at BYU, and I'm again the TA for Phil Windley's Distributed System Design class (CS 462). This time, we roped <a href="https://twitter.com/#!/reedallred">Reed</a> into being a TA as well. We really liked the idea of the <a href="/2011/02/03/office-hours-reporting-the-next-time-block/">Office Hours app</a> from last year, but we have a few different requirements this year:

<ul>
<li>There are two of us now, instead of just one, so the Google Calendar holding the hours got more complicated.</li>
<li>Since Reed and I both work in a research lab, we want to be available to the students without having to sit down in the TA cubicles all day. We created "on-call" office hours, during which we are available to help students but we won't be physically present until someone actually shows up.</li>
</ul>

Those two things increased the complexity of the problem fourfold. We used the same basic model as before (texting via Twilio) but chose a more distributed design:

<a href="https://s3.amazonaws.com/scnay-images/globalconstant/OfficeHoursApp.png"><img alt="" src="https://s3.amazonaws.com/scnay-images/globalconstant/OfficeHoursApp.png" title="Office Hours app flowchart" class="aligncenter" width="1100" height="1220" /></a>

Here is how this works in terms of events:

<ol>
<li>The SMS is received by Twilio, raising a <strong>twilio:sms</strong> event to the dispatch ruleset.</li>
<li>The dispatch ruleset checks the Google Calendar to see if anyone is on the schedule. If so, it raises a <strong>schedule_inquiry</strong> event to the rulesets handling hours for each TA. If not, it raises an <strong>absent</strong> event.</li>
<li>The dispatch ruleset responds to the <strong>absent</strong> event by sending a text to the student that no TAs are on the schedule now. It also includes the date and time of the next office hours.</li>
<li>The individual TA rulesets respond to the <strong>schedule_inquiry</strong> event by checking the calendar to see whether that TA is on the schedule right now. There are two possibilities: in office and on call. The former raises a <strong>present</strong> event; the latter raises an <strong>on_call_request</strong> event. The default behavior is to respond this way:
<ul><li><strong>present</strong>: Text the student that {Steve|Reed} should be in the cubicle already.</li>
<li><strong>on_call_request</strong>: Text {Steve|Reed} to get downstairs and reply to the student that he's on his way.</li></ul></li>
</ol>

Separating the TA rulesets allows me and Reed to have the application behave differently for each of us. I prefer texting (or <a href="https://twitter.com/#!/snay2/status/156432650746339329">XMPP</a> if I ever figure out a <a href="https://twitter.com/#!/snay2/status/156448534013554689">good way</a> to do it), but Reed would prefer email, since his AT&T iPhone gets bad reception in our lab. All I have to do is add another rule to respond to the <strong>on_call_request</strong> event and make it do whatever I want.

Here is what my version of the TA ruleset looks like:

<script src="https://gist.github.com/1607554.js?file=a163x149.js"></script>