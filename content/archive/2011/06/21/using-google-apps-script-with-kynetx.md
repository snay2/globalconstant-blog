+++
title = "Using Google Apps Script with Kynetx"
slug = "using-google-apps-script-with-kynetx"
url = "/2011/06/21/using-google-apps-script-with-kynetx"
date = "2011-06-21T17:25:46.000Z"
+++

I posted a few weeks ago about <a href="/2011/06/02/simple-stats-for-kynetx-apps/">aggregating stats for TomatoFlix</a> or any other Kynetx app. I set up an <a href="http://ktest.heroku.com/a163x53">endpoint</a> on ktest.heroku.com to let me see those stats.

But that only gives me aggregate data. What if I want to observe trends over time? For example, is the popularity of the Redbox website changing? What is the most frequently used movie website during the weekend? On week nights?

In order to get that kind of information, I need a way to retrieve and store my stats regularly. It turns out that Google Apps Script can do just that. In this post, I'll show you how to combine a time-based trigger that runs an Apps Script function. Then I'll show you how to make a RESTful endpoint to expose the stats from your app. Finally, I'll mention how to combine the two to get the data we want.

<strong>Starting with Apps Script</strong>
First, go create a new spreadsheet in <a href="http://docs.google.com/">Google Docs</a>. Then, create a new script (click on Tools -> Script Editor -> Create a new script). That takes you to the Script Editor. Name the function whatever you want and have it do something simple. Here's an example that increments cell A1's value every time is is called:

<script src="https://gist.github.com/1039165.js?file=incrementA1.js"></script>

Now set up a trigger to run that function every minute. From within the Script Editor, go to Triggers -> Current Script's Triggers. Then click on "Click here to add one now." That will give you a screen like this:

<a href="https://s3.amazonaws.com/scnay-images/globalconstant/setting-up-a-trigger.png"><img alt="" src="https://s3.amazonaws.com/scnay-images/globalconstant/setting-up-a-trigger.png" title="Setting up the trigger" class="aligncenter" width="600" /></a>

Have it run your function every minute. Now leave the spreadsheet and come back in a few minutes to see that it worked.

<strong>Setting up a RESTful endpoint to expose data</strong>
I wrote about <a href="/2011/04/09/creating-a-restful-web-service-with-krl/">using Kynetx to create RESTful web services</a> a couple months ago. We're going to use the same principles here, so go read that post if you haven't already.

In the case of TomatoFlix, all the stats are tracked using app variables. Implementing this web service endpoint is then a simple matter of writing a rule that responds to a webhook event, creating a JSON object with the data, and returning it. For this example, I'm using Sam Curren's webhook module to make things easier. That means I need to add one line to the meta block:

<code>use module a8x157 alias webhook</code>

Here's the rule that does all the hard work:

<script src="https://gist.github.com/1039193.js?file=webhook-rule.js"></script>

That produces a JSON document that lives at this URL: <a href="http://webhooks.kynetxapps.net/h/a163x53.dev/stats">http://webhooks.kynetxapps.net/h/a163x53.dev/stats</a>.

<strong>Tying it all together</strong>
Now we've got the pieces we need. Go back to the Google Docs spreadsheet you created. Add another sheet. Set up a header row that has one column for the date/time and one column for each of your data points. For TomatoFlix, it looks like this:

<a href="https://s3.amazonaws.com/scnay-images/globalconstant/stats-header.png"><img alt="" src="https://s3.amazonaws.com/scnay-images/globalconstant/stats-header.png" title="Spreadsheet header row" class="aligncenter" width="600" /></a>

Now create a new script (or a new function in your existing script). This one is going to be more complicated than the previous one, but not by too much. Basically we're going to be appending rows instead of changing the same cell every time. Additionally, the data we put into those cells will come from a <code>UrlFetchApp.fetch()</code> call to the webhook URL of the rule we just wrote. Here's what it looks like for TomatoFlix:

<script src="https://gist.github.com/1039193.js?file=get-stats.js"></script>

The last piece is to set up a trigger to call that function. I'm having mine run every day at 3 AM.

That's it! Now your stats will be nicely aggregated into a spreadsheet, and you can crunch numbers to your heart's content.

<strong>Conclusion</strong>
I've never used Google Apps Script before today, but I'm very impressed with the power it gives you. I'm glad to see that they have <a href="http://code.google.com/googleapps/appsscript/guide_events.html">native event handlers and triggers</a>, which is what made this all possible.

Triggers also make it easy to raise KNS events on a schedule, something that <a href="https://convore.com/kynetx/hourly-events-or-scheduled-events/">has been on the developer wish list</a> for a little while now.

What cool ideas do you have for using Google Apps Script with Kynetx?