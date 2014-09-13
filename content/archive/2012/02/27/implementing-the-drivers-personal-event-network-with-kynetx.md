+++
title = "Implementing the driver's personal event network with Kynetx"
slug = "implementing-the-drivers-personal-event-network-with-kynetx"
url = "/2012/02/27/implementing-the-drivers-personal-event-network-with-kynetx"
date = "2012-02-27T12:04:07.000Z"
+++

<a href="https://github.com/windley/CS462-Event-Edition/blob/master/project/Lab3.md">Lab 3 in CS 462</a> involves creating a personal event network for drivers in the <a href="http://www.ep-ts.com/content/view/80/109/">classic flower delivery system</a>. I have recommended that KRL is a good language to use to implement this personal event network, rather than writing everything in a traditional language. However, there are some pieces of the system that don't quite make sense since KRL doesn't exactly have a front-end.

Here's a diagram of the driver registration process:

<a href="https://s3.amazonaws.com/scnay-images/globalconstant/driver_registration.png"><img alt="" src="https://s3.amazonaws.com/scnay-images/globalconstant/driver_registration.png" title="Driver registration process" class="aligncenter" width="1168" height="820" /></a>

The orange arrows indicate that some important data is being exchanged; the data itself is shown in bold type.

In short, the driver's personal event network needs at least the following information in it's data store from this interaction:

<ul>
<li>Driver's name</li>
<li>Driver's phone number</li>
<li>Information about each flower shop:<ul>
<li>Flower shop ESL</li>
<li>Flower shop latitude and longitude</li>
</ul></li>
</ul>

If you write this all as a traditional website, the UI for this is obvious. But KRL doesn't provide as obvious a way to create front-ends. Here's how I would do it.

We first presume that the driver has created his personal event network with Kynetx and has installed the driver app. It's then a simple matter to create another KRL app that the driver can install to interact with the data store. This app will have display its UI when the user has installed the app and navigates to <a href="http://exampley.com/">exampley.com</a>. Here are the various pieces of that app:

<strong>Driver registration</strong>

We implement an interface that lets the driver submit his name and phone number. It could look like this:

<img alt="" src="http://s3.amazonaws.com/appresource/apiappimages/images/286/large.png" title="Driver registration" class="aligncenter" width="262" height="163" />

When the driver clicks Submit, the data is sent back to the Kynetx servers and stored in entity variables. (The code for this and all other examples will be given later.)

<strong>Flower shop information</strong>

The driver needs to maintain information about the flower shops for whom he delivers. We provide an interface like this for submitting that information:

<img alt="" src="http://s3.amazonaws.com/appresource/apiappimages/images/287/large.png" title="Flower shop information" class="aligncenter" width="263" height="195" />

Again, when the driver clicks Submit, the information is sent back to the Kynetx servers, where it can be stored in an array of flower shops. We'll use entity variables and JSON-encode the information.

The driver may also want to list all the flower shops. To do that, we simply loop over the array containing the flower shops and display the details:

<img alt="" src="http://s3.amazonaws.com/appresource/apiappimages/images/288/large.png" title="Listing the flower shops" class="aligncenter" width="263" height="181" />

<strong>The code</strong>

The code for this is relatively straightforward. I display a series of <code>notify()</code> boxes and use <code>watch</code> actions to raise events when the user clicks buttons. Here's what it looks like:

<script src="https://gist.github.com/1926175.js?file=a163x154.js"></script>

<strong>Installing the app</strong>

The "driver" can install the app into his personal event network at this link: <a href="http://apps.kynetx.com/installable_apps/5399-Driver_registration_helper">Driver Registration Helper</a>. To use the app, go to <a href="http://exampley.com/">exampley.com</a> once the app is installed.

<strong>Using the data from this app</strong>
You will need to import my ruleset <a href="http://apps.kynetx.com/modules/a163x154">as a module</a> in order to get the data out. Put this line in your meta block:

<pre>use module a163x154 alias driver_data</pre>

You may choose the alias, but make sure you prefix all function calls with that alias.

The modules provides a few functions to give you access to the data collected from the driver:

<pre>get_driver_name();
get_driver_phone();
get_flower_shops();</pre>

The first two of those functions return strings. The second returns an array of string-encoded JSON objects (called "hashes" in KRL parlance) that look like this:

<pre>{
  "name": "The Flower Shoppe",
  "esl": "http://consumer.eventedapi.org/receive/fizzbuzz",
  "lat": "-41.1",
  "lng": "111.1"
}</pre>

Use <a href="https://kynetxdoc.atlassian.net/wiki/display/docs/String+Operators#StringOperators-decode">decode()</a> and <a href="https://kynetxdoc.atlassian.net/wiki/pages/viewpage.action?pageId=589887">pick()</a> to get the information out of those hashes.

A function call could look like this:

<pre>pre {
  driver_name = driver_data:get_driver_name();
}</pre>