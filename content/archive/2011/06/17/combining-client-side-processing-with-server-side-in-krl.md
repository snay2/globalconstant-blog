+++
title = "Combining client-side processing with server-side in KRL"
slug = "combining-client-side-processing-with-server-side-in-krl"
url = "/2011/06/17/combining-client-side-processing-with-server-side-in-krl"
date = "2011-06-17T16:12:50.000Z"
+++

<em><a href="/2011/06/21/using-web-events-to-do-dialoguing/">My next post</a> describes another way to do dialoguing. If this method doesn't work for you, try that one.</em>

Sometimes you need a Kynetx app to have access to the data on a page in the user's browser, but you can't do all the processing you need on the client side. Here's an example:

I wrote an app a while ago that took the BYU Bookstore's "MyBooklist" web app and let the user look up those books on Amazon to compare prices. (The Bookstore has since added this functionality to its own website, so I've discontinued my app.) I needed the ISBN numbers from the page (client-side), but then I needed to look them up in the Amazon product API (server-side, with KRL). I wrote some JavaScript and a special rule to allow me to extract that data from the page and send it back to the Kynetx servers so I could process it.

The process is pretty simple. It goes like this:
<ol>
  <li>The first rule emits some JavaScript that will use jQuery to get the appropriate pieces of information from the page.</li>
  <li>The rule also puts a hidden form on the page. The script adds the extracted data into fields on that form.</li>
  <li>When the script finishes collecting the data, it triggers the submit action on the form.</li>
  <li>All the while, this first rule has been <code>watch()</code>ing for that form to be submitted.</li>
  <li>The second rule handles the event that gets raised (through <code>watch()</code>) when the form is submitted.</li>
  <li>That rule extracts the data from the form and does any necessary operations with it (API lookups, storage, etc.) and takes appropriate actions.</li>
</ol>

Here's a simplified version of the first rule from the BookComparison app:

<script src="https://gist.github.com/1032455.js?file=first-rule.js"></script>

You'll notice we're creating a series of input elements all with the name <code>isbnList[]</code> and some subscript. This will come in useful in the next rule, where we can <code>foreach</code> over those inputs. Here's the second rule:

<script src="https://gist.github.com/1032455.js?file=second-rule.js"></script>

This second rule handles a <code>web submit</code> event with the ID of the form given in quotes. Thereafter, it iterates over each of the ISBN numbers returned from the form. In the original app, this involved looking up the ISBN number in the Amazon API and then returning the price data back to the page (via an action like <code>replace</code> or <code>append</code>.)