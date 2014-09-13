+++
title = "Amazon Elastic Beanstalk"
slug = "amazon-elastic-beanstalk"
url = "/2011/01/19/amazon-elastic-beanstalk"
date = "2011-01-19T12:51:28.000Z"
+++

Amazon announced a new AWS product this morning: the <a href="http://aws.amazon.com/elasticbeanstalk/">Elastic Beanstalk</a>. Insert your own trite fairy tale references here.

The thing that strikes me about Beanstalk is that it's the first product in AWS that was designed to be accessible to the common end user. It's based on Platform as a Service designs used by other industry players (some examples are <a href="http://code.google.com/appengine/">Google App Engine</a> and <a href="http://www.jboss.com/solutions/PaaS/">Red Hat's JBoss PaaS</a>). The developer has only to create his application, package it into a WAR file, and upload it to the PaaS provider.

The difference between Amazon's offering and, say, Google's is that Amazon gives you full, transparent control over the stack being used to run your application. App Engine doesn't give you anywhere near that kind of control. With Elastic Beanstalk, you're free to go log in to the EC2 instances running your application, inspect the contents of S3, etc.

If you're a power user and want to tinker with those things, you can. If you're just an average developer who just wants a scalable application without having to worry about the implementation details, you're free to leave them alone.

For the time being, Beanstalk only runs Java apps on Tomcat, but I'm excited to see what else they will support in the coming months.