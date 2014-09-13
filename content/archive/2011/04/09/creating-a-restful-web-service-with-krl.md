+++
title = "Creating a RESTful web service with KRL"
slug = "creating-a-restful-web-service-with-krl"
url = "/2011/04/09/creating-a-restful-web-service-with-krl"
date = "2011-04-09T12:08:35.000Z"
+++

Phil Windley's example of <a href="http://www.windley.com/archives/2011/04/tweeting_from_kblog_thoughts_about_loose_coupling.shtml">creating a blog using KRL</a> got me thinking about what other (somewhat unconventional) things could be done with KRL. The first that came to my mind is building a RESTful web service.

The advantages of setting up a web service this way include zero configuration (just write a ruleset and deploy it), awesome integration with data sources all over the web, an extensible rule-based language, and drop-dead simple persistent data storage.

I put together a simple example. It has four methods:
<ul>
	<li><strong>echo</strong> Simply echoes back the "body" parameter</li>
	<li><strong>sum</strong> Takes two parameters ("first" and "second") and returns their sum</li>
	<li><strong>counter</strong> Maintains a global (application-wide) counter, incrementing it each time and returning the value</li>
	<li><strong>ent_counter</strong> Same as the normal counter, except it is maintained on a entity basis (requires cookies, so it only really works in a web browser)</li>
</ul>

I'm using <a href="http://docs.kynetx.com/docs/Webhook_Endpoint">webhooks</a> to implement this. The URLs aren't super pretty, and they probably wouldn't be desirable as endpoints for a production system. But it's easy enough to build a proxy in front of them.

You can try out this web service with the following URLS:
<ul>
	<li><a href="http://webhooks.kynetxapps.net/h/a163x85/echo?body=hi%20there">http://webhooks.kynetxapps.net/h/a163x85/echo?body=hi%20there</a></li>
	<li><a href="http://webhooks.kynetxapps.net/h/a163x85/sum?first=1&second=2">http://webhooks.kynetxapps.net/h/a163x85/sum?first=1&second=2</a></li>
	<li><a href="http://webhooks.kynetxapps.net/h/a163x85/counter">http://webhooks.kynetxapps.net/h/a163x85/counter</a></li>
	<li><a href="http://webhooks.kynetxapps.net/h/a163x85/ent_counter">http://webhooks.kynetxapps.net/h/a163x85/ent_counter</a></li>
</ul>

Here's the source code:

<script src="https://gist.github.com/911599.js?file=a163x85.krl.js"></script>

Many thanks to Sam for <a href="http://stackoverflow.com/questions/5600025/responding-to-a-webhook-event-with-raw-data/5602954#5602954">his answer</a> yesterday on StackOverflow.