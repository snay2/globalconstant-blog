+++
title = "Using web events to do dialoguing"
slug = "using-web-events-to-do-dialoguing"
url = "/2011/06/21/using-web-events-to-do-dialoguing"
date = "2011-06-21T14:25:04.000Z"
+++

My <a href="/2011/06/17/combining-client-side-processing-with-server-side-in-krl/">last post</a> was about using an HTML form with KRL to get data from a page and submit it back to the server. This post describes another method for doing the same thing, but this method is less vulnerable to interference from other code on the site.

I'm writing an application that runs on Facebook. Unfortunately, Facebook munges HTML forms somehow, making it impossible to do dialoguing the way I explained last week. This new method does not depend on the behavior of HTML forms, so it works great even on a JavaScript-heavy site like Facebook.

Here's the process:

<ol>
<li>Like before, we use jQuery to get the information we want. This could be data extracted from the page, or it could be input provided by the user.</li>
<li>Using JavaScript and the KOBJ object, we get a reference to the ruleset that we want to handle the data.</li>
<li>With that reference, we raise a web event in the ruleset and pass along the data we collected from the page.</li>
<li>The ruleset then handles the event and returns any appropriate directives.</li>
</ol>

In my application, I'm asking the user for a first and last name to search the BYU directory. I put an HTML form on the page to collect that information. Then there is a JavaScript function that runs when the user clicks the "Search" button. That function pulls the data out of the form and raises an event with that data to my ruleset. Here's how that part looks:

<script src="https://gist.github.com/1038785.js?file=draw.js"></script>

(You'll also notice that I'm setting the <code>page_params.kynetx_app_version</code> to be <code>"dev"</code>. This is due to the way I structured my application; I need that so that I don't have to deploy the ruleset every time. You probably won't need to do this, but <a href="https://convore.com/kynetx/raising-events-in-called-rulesets/">read more here</a> if you're interested anyway.)

The rule that handles the event is very straightforward. Here's what it looks like:

<script src="https://gist.github.com/1038785.js?file=handle.js"></script>

The function <code>listnames()</code> is defined in the global block, but it's not really relevant to this discussion.