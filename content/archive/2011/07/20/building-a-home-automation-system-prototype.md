+++
title = "Building a home automation system prototype"
slug = "building-a-home-automation-system-prototype"
url = "/2011/07/20/building-a-home-automation-system-prototype"
date = "2011-07-20T10:39:26.000Z"
+++

_This is the first in a series about the home automation prototype system._

In my research lab, we're developing a prototype of a home automation system that uses Kynetx to glue all the pieces together. The two main components of that system are things (devices) that raise events and things that respond to directives. Let's take <a href="http://www.windley.com/archives/2011/01/contextually_correlating_events_the_power_of_emergent_behavior_in_loosely_coupled_systems.shtml">this example from Phil Windley</a>:

<blockquote>One of the significant benefits of evented systems is that they exhibit extreme loose coupling. To understand this consider the situation where you want your DVD player to pause when you get a phone call. Assuming each has an API, programming your phone to send a "pause" command to the DVD is easy enough to do. Now suppose you decide you want to also raise the room lights when the phone call comes in; you have to program the phone to also send a "raise lights" command to the room lights. Each new interaction requires an explicit command from one system to another. Such point-to-point connections make changes difficult. Change out the DVD player and every device sending it commands has to be reprogrammed.

Now, imagine instead that the phone merely raises a <code>phone:inbound_call</code> event. The DVD and lights can both listen for such events and do the right thing. Add something else to the mix and it can easily listen for the <code>phone:inbound_call</code> event and do whatever is right for it. Nothing else needs to be reprogrammed or even told its there as long as it can listen for events of interest. Each actor in the event-driven system interprets the event according to its own context and purpose. Loose coupling leads to better resilience in the face of errors and configuration mistakes.</blockquote>

(Phil also discusses this example <a href="http://www.windley.com/archives/2011/02/eventbased_systems_and_selfdetermination.shtml">here</a> and <a href="http://www.windley.com/archives/2011/02/a_completely_connected_world_depends_on_loosely_coupled_architectures.shtml">here</a>.)

To get that loose coupling, the devices raising the events must be thought of separately from those responding to events. The phone receives a call; it might raise that event over the home Wi-Fi connection, or it might do it over its 3G connection. The DVD player and lights that are listening for that event are sitting behind a proxy that can speak several protocols: it knows how to communicate with the dimmer and the DVD player (perhaps through a proprietary API, as Phil suggests), and it knows how to speak HTTP so it can raise events and receive directives from KNS. This is what it looks like:

<a href="https://s3.amazonaws.com/scnay-images/globalconstant/home-automation-prototype-diagram.png"><img alt="" src="https://s3.amazonaws.com/scnay-images/globalconstant/home-automation-prototype-diagram.png" title="Home automation prototype diagram" class="aligncenter" width="600" /></a>

A sample interaction:
<ol>
<li>Cell phone receives an incoming call, raises the <code>phone:incoming_call</code> event to the home automation ruleset in KNS</li>
<li>Ruleset has two rules that respond to <code>phone:incoming_call</code> event, which do the following things:
<ul><li>Send a <code>set_media_state("pause")</code> directive to the DVD player</li>
<li>Send a <code>set_light_level(8)</code> directive to the dimmer</li></ul></li>
<li>Those directives are routed over the Internet to the HTTP proxy for the home</li>
<li>The proxy sends commands to the light dimmer and DVD player in their native protocols</li>
<li>Dimmer and DVD player respond</li>
</ol>

The phone could also raise a <code>phone:hung_up</code> event to signal that the call had finished. When that happens, we restore the state of the DVD player and lights to what they were before, using the same process.

<a id="krl"></a>Here's an example implementation in KRL for the ruleset responding to the events. I use <a href="/2011/07/20/using-localtunnel-with-a-kynetx-app/#functions">several functions</a> that communicate with the HTTP proxy; their details are not given here, but the behavior is self-explanatory. Also, the rules are using app variables to store the previous state of the DVD player and dimmer so they can be restored later.

<script src="https://gist.github.com/1095293.js?file=rules.rb"></script>

Future posts will explain in more detail the <a href="/2011/07/20/using-localtunnel-with-a-kynetx-app/">connection between KRL and the HTTP proxy</a> and <a href="/2011/07/20/the-local-http-proxy/">how the HTTP proxy is implemented</a>.
