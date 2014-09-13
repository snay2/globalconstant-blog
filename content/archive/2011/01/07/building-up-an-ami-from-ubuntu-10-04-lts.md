+++
title = "Building up an AMI from Ubuntu 10.04 LTS"
slug = "building-up-an-ami-from-ubuntu-10-04-lts"
url = "/2011/01/07/building-up-an-ami-from-ubuntu-10-04-lts"
date = "2011-01-07T12:04:21.000Z"
+++

Now that I've gotten the hang on Amazon EC2, I'm ready to start building my actual stem cell server. I'm starting from the Ubuntu 10.04 LTS image provided by Canonical (<a href="http://aws.amazon.com/amis/4347">ami-a403f7cd</a>). It's a bare-bones server instance that doesn't even have Apache on it yet, although it does have Python.

<strong>Setting up the Server</strong>

I'm going to need the EC2 AMI tools, which requires allowing the Multiverse repository, so I added these to lines to my /etc/apt/sources.list.d/multiverse.list first:

<pre>
deb http://us.ec2.archive.ubuntu.com/ubuntu/ karmic multiverse
deb-src http://us.ec2.archive.ubuntu.com/ubuntu/ karmic main</pre>

Here are the packages I installed (after running apt-get update):

<pre>
ec2-ami-tools
ec2-api-tools
apache2
libapache2-mod-python</pre>

These packages may also be useful but aren't strictly necessary at this point:

<pre>
python-cheetah
python-dev
python-setuptools
python-simplejson
python-pycurl
python-imaging</pre>

I ran apt-get upgrade as well. This presented me with a couple prompts (one from GRUB), which I had to get through. And since it included a kernel update, I restarted the machine.

Next, I added the necessary Python directives to my /etc/apache2/sites-available/default file, as I <a href="/2010/12/28/using-python-and-apache-2-on-ubuntu/">documented earlier</a>.

I added a simple index.py page in /var/www to handle CGI requests. One thing that confused me for a long while is that index.py can't just be any old Python script; it has to be a CGI request handler. Here's a simple example:

<pre>
def index(req):
  return "Hello, world!"</pre>

<strong>Creating and Registering the AMI</strong>

The next step is creating an AMI from this image and saving that to S3. I'm using <a href="http://docs.amazonwebservices.com/AWSEC2/latest/UserGuide/index.html?creating-an-ami-s3-linux.html">this tutorial from Amazon</a> as my guide.

There are three basic steps:

<ol>
	<li><strong>Bundle the volume</strong>

First, I got the X509 certificate and my private key and put them on /mnt. I also got my account number handy (available from the same place in the AWS console as the public/private keys). Then I ran these commands:

<pre>sudo mkdir /mnt/image
sudo ec2-bundle-vol -k PrivateKey.pem -c X509Cert.pem -u <strong>000000000000</strong> -d /mnt/image</pre>

Replace the <strong>000000000000</strong> with your account ID.

After several minutes, that created the AMI bundle in /mnt/image.</li>

	<li><strong>Upload the bundle to S3</strong>

I used this command:

<pre>ec2-upload-bundle -b cs462-machines/<strong>snay2-test1</strong> -m /mnt/image/image.manifest.xml -a &lt;access key&gt; -s &lt;secret key&gt;</pre>

Replace the <strong>snay2-test1</strong> with your own folder name inside the bucket.</li>

	<li><strong>Register the AMI</strong>

I have my dev machine set up such that I don't have to pass the keys along on the command line (see <a href="/2011/01/10/setting-up-my-development-environment-for-aws/">this post</a> for how I did that). But if you don't have it set up that way or if you want to run the command from your EC2 instance directly, that's possible too. Here is the command:

<pre>ec2-register cs462-machines/<strong>snay2-test1</strong>/image.manifest.xml --K PrivateKey.pem -C X509Cert.pem</pre>

Replace the <strong>snay2-test1</strong> with your own folder name inside the bucket.

After a second, that came back with the AMI name. We're done!</li>
</ol>

EDIT: Here is a <a href="https://help.ubuntu.com/community/EC2StartersGuide">detailed tutorial</a> from the Ubuntu community on the AMI tools and other necessary EC2 things. 

EDIT: Revised the last portion of the post to reflect the three basic steps of persisting an AMI.