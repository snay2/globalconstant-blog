+++
title = "Convenient security flaw in BYU network authentication"
slug = "convenient-security-flaw-in-byu-network-authentication"
url = "/2010/02/17/convenient-security-flaw-in-byu-network-authentication"
date = "2010-02-17T13:01:09.000Z"
+++

<a href="https://scnay-images.s3.amazonaws.com/globalconstant/netgear-router.jpg"><img src="https://scnay-images.s3.amazonaws.com/globalconstant/netgear-router_150.jpg" alt="" title="NetGear router" width="150" height="131" class="alignright"></a>

A few months ago I purchased a Netgear wireless router for my dorm room at Brigham Young University. It's just a simple, low-end router, but it does the job. And I recently discovered an interesting way of using this to get around BYU network authentication procedures.

In the past, any user connecting to the residential network was required to authenticate about once a week with their NetID (a personally identifiable username on the BYU network) and password. This had to be done through a web browser (a process with which I disagree, but that's a topic for another post). The system would record the MAC address or something and use that to link all network activity originating from that address with that NetID. In this way, BYU network security analysts have a way to pin down any suspicious activity to a responsible person.

That is still in force, but starting this month a <a href="http://technews.byu.edu/2009/08/byu-wireless-network-access-has-been_14.html">new layer of security</a> is being added. All Windows computers connecting to the BYU network are required to have (a) the most recent operating system patches from Windows Update and (b) an <a href="https://it.byu.edu/byu/BYU+Help+Center+Article.do?&amp;sysparm_document_key=kb_knowledge,2b67486b0a0a3c0e7c8a216e81619bda">approved</a>, up-to-date virus protection program. Note that this only applies to Windows computers. Macs and Linux boxes can get onto the network with just a NetID and password.

BYU has had these security measures on their campus-wide wired and wireless networks since last fall, but this is the first time these measures are being implemented in the residential wired network.

This is where it gets interesting. Enter NetGear router.

My router manages the laptops that my roommate and I use (which are connected to it via Ethernet), as well as my iPod, <a href="/2010/02/13/palm-pre-plus-vs-iphone-os/">my Palm Pre</a>, and any of my other roommates' computers (via the router's wireless). The two laptops on the Ethernet have Linux or Windows (or both), my iPod is recognized as a Mac, and the login page doesn't know what to call my Palm Pre. Of all of those, the Windows side of my laptop is the <em>only </em>one the network authentication will quarantine for virus checking.

Because the router assigns private IP addresses (192.168.1.x) to all the devices connected behind it, the only thing the BYU network ever sees is the IP address it gave my router through the DHCP. As far as the network can tell, I have only one device connected.

Because of that, <strong>I can run through the network authentication using my Linux box, or my iPod, or even my Palm Pre.</strong> None of those are required to have anti-virus or the latest Windows updates. That clears the way for me to connect any virus-infected, out-of-date PC to that router, and the network will never know the difference.

Brilliant. Network security circumvented.

Of course, everything that goes onto the network through my router will be linked to whatever NetID I used to authenticate it. So that still leaves me in charge of making sure nobody does anything stupid through my router.

I don't know if there's any way for our beloved network administrators to fix this (rather large) hole in the system. But until they do, my router will carry on connecting anyone and everyone I authorize, regardless of whether BYU thinks them fit for the network.
