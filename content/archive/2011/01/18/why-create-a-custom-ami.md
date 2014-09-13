+++
title = "Why create a custom AMI?"
slug = "why-create-a-custom-ami"
url = "/2011/01/18/why-create-a-custom-ami"
date = "2011-01-18T21:44:07.000Z"
+++

I've been getting a lot of questions today about why we do this whole process of creating and registering a custom AMI and then bootstrapping it, rather than just starting from scratch each time. Their questions are motivated by various things, ranging from frustration with the process to not understanding the purpose. I haven't been very articulate in describing why this is part of Lab 1, so I'll try my hand at an explanation here.

<strong>The Concept of a Stem Cell Server</strong>
The Image Project requires you to create a web server and a two-part app server. These both have the same basic configuration: Apache with Python, or Apache with PHP, or IIS with .NET, etc. (as per your preference). It will save you a lot of trouble in the coming labs if you've created a good, general AMI configuration that can serve adequately as a base for all your real servers. You don't want to have to write a configuration script every time that installs the same things--the AMI ought to have those already there. That way, your configuration only needs to reflect what is different or unique about each server.

You have to have perspective beyond just Lab 1.

<strong>Efficiency of Scaling</strong>

One of the primary things to keep in mind when working with Amazon Web Services is that you have to think like Amazon. They have a huge system and need to be able to scale up or down dynamically as demand fluctuates. The requirements of that system led to the current architecture of services like EC2 and S3.

The Image Project is not anywhere near the scale of Amazon.com, simply because we only have a semester to build it. But the architecture of the project is designed to imitate that of a real-world massively scalable system. Keeping that in mind throughout the semester will make some project requirements easier to understand.

When Amazon needs to fire up another EC2 instance for their company infrastructure, it needs to occur rapidly. The longer it takes, the more business they may lose. The process of creating custom AMIs was designed with that in mind.

In our case, the speed at which an instance starts up is not very important. We're not doing it dynamically, and we do it infrequently. As far as the performance of our system is concerned, it doesn't really matter to us whether it takes two seconds or two minutes.

But consider two setups in a large, scalable production system:

<ol><li>In the first setup, we start from a default base AMI, which has just a bare installation of Ubuntu Server. When the instance starts up, we run a script that downloads and installs Apache, Python, several support libraries, and all our website code.</li>
<li>In the second setup, we have created a custom AMI that has everything we need already installed. All we have to do when we launch the instance is dump our code into the Apache root and go.</li></ol>

In this hypothetical large, scalable system, we need to fire up instances dynamically. Setup #1 will take a few minutes to download, install, and configure everything&mdash;all that in addition to the time it takes to start the instance in the first place. In those few minutes, the rest of our instances are still struggling to handle all the requests, and a few customers have left because the pages are taking so long to load.

Setup #2 requires no extra time besides initially starting up the instance (a sunk cost). As soon as it starts up, it's registered with the load balancer and ready to help the other instances handle the traffic. In addition, it doesn't use any extra network bandwidth to download and install packages that could be downloaded just once and stored in the AMI.

You can see that in this type of a system, the efficiency with which we can spin instances up or down makes a difference. We're designing The Image Project so that it is ready to scale like that as soon as our traffic starts increasing.

<strong>Summary</strong>
Keep the big picture in mind. This is designed to be a potentially huge system with loosely-joined components that can scale independently and flexibly. Think like Amazon.