+++
title = "The local HTTP proxy"
slug = "the-local-http-proxy"
url = "/2011/07/20/the-local-http-proxy"
date = "2011-07-20T12:32:01.000Z"
+++

<em>This is the third in a series about the home automation prototype system. <a href="/2011/07/20/building-a-home-automation-system-prototype/">The first post is here.</a></em>

If you remember from <a href="/2011/07/20/building-a-home-automation-system-prototype/">this post</a>, there is an HTTP proxy that sits between the local home devices and the Internet. It can talk the protocols the devices understand as well as HTTP that KNS understands. Here's the system diagram again:

<a href="https://s3.amazonaws.com/scnay-images/globalconstant/home-automation-prototype-diagram.png"><img alt="" src="https://s3.amazonaws.com/scnay-images/globalconstant/home-automation-prototype-diagram.png" title="Home automation prototype diagram" class="aligncenter" width="600" /></a>

Right now, we don't have any physical devices (this is still a prototype), so rather than communicating with the devices, the server simply prints out the effect that the directives would have on them.

If you remember the functions I described in the previous post, you'll get a feel for what the server protocol looks like. Here they are again:

<script src="https://gist.github.com/1095411.js?file=use_tunnel.js"></script>

Sinatra makes it very easy to write the server (although you could use <a href="/2011/07/14/simple-comparison-of-sinatra-and-bottle/">something like Bottle or Flask</a> if you prefer). We use global variables (in the <code>settings</code> object) to keep track of "device" state. The server looks like this:

<script src="http://gist-it.appspot.com/github/snay2/home-emulator/raw/master/server.rb"></script>

Once we get further in this project, we plan to get some real hardware and make it talk to the server. For now, though, we just have to read the output from Sinatra's logs to see how the directives are taking effect.

Here's an example interaction when the <code>phone:incoming_call</code> event was raised. The <code>media_state</code> and <code>light_level</code> are checked, and then they are both set. (See the rule that handles this event <a href="/2011/07/20/building-a-home-automation-system-prototype/#krl">here</a>.)

    eridanus:home-emulator snay2$ ruby -rubygems server.rb 
    ==Sinatra/1.2.6 has taken the stage on 4567 for development with backup from Mongrel
    127.0.0.1 - - [20/Jul/2011 12:24:15] "GET /media_state HTTP/1.0" 200 23 0.0003
    127.0.0.1 - - [20/Jul/2011 12:24:16] "GET /light_level HTTP/1.0" 200 19 0.0003
    Media state is now stop. Was stop.
    127.0.0.1 - - [20/Jul/2011 12:24:16] "GET /media_state/stop HTTP/1.0" 200 23 0.0004
    Light level now 10. Was 10.
    127.0.0.1 - - [20/Jul/2011 12:24:16] "GET /light_level/10 HTTP/1.0" 200 19 0.0005
