+++
title = "Dialoguing module"
slug = "dialoguing-module"
url = "/2011/07/01/dialoguing-module"
date = "2011-07-01T11:58:04.000Z"
+++

You may remember my previous two posts about dialoguing. I illustrated two methods for doing it: <a href="/2011/06/17/combining-client-side-processing-with-server-side-in-krl/">form submission with <code>watch()</code></a> and <a href="/2011/06/21/using-web-events-to-do-dialoguing/">web events</a>. I've been using the second of those methods so much that I wanted to abstract it out to a module. <a href="http://apps.kynetx.com/modules/a163x121">a163x121 is the result.</a>

<strong>Documentation</strong>

Here's how it works. First, there are two configuration options that you need to specify when you import the module:

<ul>
<li><em>app_id</em> - the ruleset ID that will respond to the web events that will be raised. Usually this will be the same as the ruleset in which you are using the module.</li>
<li><em>app_version</em> - either "dev" or "". If you specify "dev", the module will raise web events to the dev version of the ruleset. If you leave it blank, it will raise web events to the production version of the ruleset.
</ul>

There is one method that does it all, called <code>get_data()</code>. Here are the parameters:

<ul>
<li><em>selectors</em> - an array of the jQuery selectors that identify the DOM element whose data you want to extract</li>
<li><em>method</em> - usually "val" or "html". The jQuery method to get the data out of the DOM element.</li>
<li><em>param_names</em> - an array parallel to <em>selectors</em> that describes the names that should be given to the data once they are extracted. These will be accessible in the handling rule via <code>event:param("...")</code>.</li>
<li><em>event_name</em> - the name of the web event that will be raised once the data is retrieved. You will be writing a rule to respond to this event.</li>
<li><em>callback</em> - the name of the JavaScript function that should wrap this code. This is useful if you want to extract the data when the user clicks a button (e.g., on a search form). If you do not wish to use a callback (i.e., you want the extraction code to run right away), pass an empty string.</li>
</ul>

<strong>Example</strong>

I retrofitted the example from this post to use the new module, so the code may look familiar to you. First, I added one line to the <code>meta</code> block:

<blockquote>use module a163x121 alias dialogue with app_id="a163x104" and app_version="dev"</blockquote>

Then I rewrote the rule a bit:

<script src="https://gist.github.com/1059053.js?file=draw.js"></script>

The <a href="https://gist.github.com/1038785#file_draw.js">original <code>byufb_dir_search()</code> function</a> contained two things: First there were some lines to unhides the search results box and show a progress bar; second there was the dialoguing code. Since the module only handles the dialoguing code, I broke out those first two lines into a new function called <code>byufb_dir_search_prep()</code>, which in turn calls <code>byufb_dir_search()</code>. The "Search" button calls the prep function. I passed the name "byufb_dir_search" to the dialoguing module's <code>get_data()</code> action so it knows what to name the JavaScript function.

The rule that handles the web event is <a href="https://gist.github.com/1038785#file_handle.js">exactly the same as before</a>; no changes were necessary.

<strong>Conclusion</strong>

This simplifies the code by abstracting out the mundane JavaScript to get data from the page and raise a web event containing that data.

What do you think?