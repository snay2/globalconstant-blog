+++
title = "Setting up my development environment for AWS"
slug = "setting-up-my-development-environment-for-aws"
url = "/2011/01/10/setting-up-my-development-environment-for-aws"
date = "2011-01-10T12:43:21.000Z"
+++

<em>This is mostly for my own benefit, since I'll more likely than not have to explain the process to others in the class.</em>

This describes all the pieces I needed to set up to get my dev machine set up to work with Amazon Web Services.

The first thing I needed were the security credentials. To find these, log in to the <a href="http://console.aws.amazon.com/">AWS Console</a>, click on Account at the top, and then click on Security Credentials. (At the time of writing, the URL for that page is <a href="https://aws-portal.amazon.com/gp/aws/developer/account/index.html?ie=UTF8&action=access-key">this</a>.)

There are four security credentials you need:
<ul>
	<li>Access Key ID (string)</li>
	<li>Secret Access Key (string)</li>
	<li>X.509 Certificate (.pem file)</li>
	<li>Private key associated with the X.509 (.pem file)</li>
</ul>

All of those are accessible to anyone who can log in to the account, except for the private key. Amazon does not keep a copy of the private key for the X.509 certificate; you can download it when you create the certificate, but if you lose it after that you'll have to revoke the certificate and create a new one.

Store all of these in a secure place.

Next, you'll need a key pair to run instances on EC2. You can create this when you launch an instance. Select the option "Create a New Key Pair" when you get to that step in the launch process. This will give you a .pem file. Save that in a secure location as well; you'll need it to SSH into your machine.

Once you have all of those things, there are a couple other things that are useful. I set up my .ssh/config file to allow me to SSH in easily. Here's what the EC2 section looks like:

<pre>
Host ec2
    HostName {host name}.amazonaws.com
    User ubuntu
    IdentityFile ~/.ec2/snay2.pem</pre>

The last thing that's useful to have, especially when you're creating AMIs, are the <a href="http://aws.amazon.com/developertools/351">EC2 API tools</a> for the command line. I installed these into my home directory (since the BYU CS labs don't give me write access to the more sensible location of /usr/share) and set up my .bashrc to initialize the necessary environment variables to run the tools:

<pre>
export EC2_HOME=~/.ec2/tools/
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=~/.ec2/PrivateKey.pem
export EC2_CERT=~/.ec2/X509Cert.pem</pre>

I think that's about it.