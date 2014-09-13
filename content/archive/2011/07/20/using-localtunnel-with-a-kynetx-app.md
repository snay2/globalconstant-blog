+++
title = "Using localtunnel with a Kynetx app"
slug = "using-localtunnel-with-a-kynetx-app"
url = "/2011/07/20/using-localtunnel-with-a-kynetx-app"
date = "2011-07-20T11:31:14.000Z"
+++

<em>This is the second in a series about the home automation prototype system. <a href="/2011/07/20/building-a-home-automation-system-prototype/">The first post is here.</a></em>

The home automation prototype we're building in my research lab has an HTTP proxy that translates communication between the in-home devices (DVD player and light dimmer in our example) and KNS. This proxy is running on the local home network and may not have a public IP address or domain name. That causes problems when we want a KRL ruleset to be able to talk directly to the proxy.

I first heard about <a href="https://github.com/progrium/localtunnel"><code>localtunnel</code></a> over a month ago <a href="http://www.twilio.com/engineering/2011/06/06/making-a-local-web-server-public-with-localtunnel/">when Twilio announced it</a>. It's a service that lets you tunnel any port on your local machine to a publicly accessible domain name. The domain name is randomly generated, providing some security by obscurity. This is the perfect solution for letting KNS talk to the local proxy in our system.

There's still one problem, though. Every time the localtunnel is reestablished, the domain name changes. I could go manually edit the KRL each time that occurs so that it always points to the right place, but that is unreasonable in a production environment.

<strong>The KRL</strong>
The solution is to have the proxy server ping a webhook on the same KRL ruleset every time the server gets a new localtunnel address. Then the ruleset simply keeps that address around in an app variable. Here's what the KRL looks like for that:

<script src="https://gist.github.com/1095411.js?file=set_tunnel.js"></script>

<a id="functions"></a>To use it, we simply reference the app variable. These are the functions I <a href="/2011/07/20/building-a-home-automation-system-prototype/#krl">mentioned in the last post</a> that handle communication with the proxy server:

<script src="https://gist.github.com/1095411.js?file=use_tunnel.js"></script>

<strong>The proxy server</strong>
The HTTP proxy itself is running Sinatra, so it listens on port 4567 by default. To use <code>localtunnel</code>, I'd normally just write this:

<code>$ localtunnel 4567</code>

Which spits out something like this:

<code>   This localtunnel service is brought to you by Twilio.
   Port 4567 is now publicly accessible from http://3pjg.localtunnel.com ...</code>

To automate it, however, I need to get that URL programmatically. Parsing the output wouldn't work, because the <code>localtunnel</code> instance stays running as long as the tunnel is open. I ultimately decided to fork the repo on Github and add the feature myself. Here's the <a href="https://github.com/progrium/localtunnel">original repo</a>, and here's <a href="https://github.com/snay2/localtunnel">my fork</a>.

What I added was a function that pings a webhook once the URL has been obtained from the <code>localtunnel</code> web service. <a href="https://github.com/snay2/localtunnel/commit/e014884b3286e962edb61d7bbdca5c83a5b24826#lib/localtunnel/tunnel.rb">Take a look at the diff.</a>

Now all I have to do is call <code>LocalTunnel::Tunnel.new()</code> and pass the webhook URL as well. Like this:

<script src="https://gist.github.com/1095411.js?file=open_tunnel.rb"></script>

Every time I start the Sinatra server, I also run this script to open the <code>localtunnel</code> and notify the KRL ruleset of the change. No manual updating, and everything works great.

In a production system, we'd want to authenticate everything so that a rogue server can't come in and redirect our traffic to a different place. But for the prototype, this is sufficient.

<strong>Note:</strong> If you want to follow the whole project, you can <a href="https://github.com/snay2/home-emulator">find it on Github</a>.
