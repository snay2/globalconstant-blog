+++
title = "Setting up a passwordless login over SSH"
slug = "passwordless-login-ssh"
url = "/2009/11/10/passwordless-login-ssh"
date = "2009-11-10T23:54:00.000Z"
+++

Here's how you can set up a public key to allow you to login to a remote server over SSH without a password. (I draw mainly on the <a href="http://linuxproblem.org/art_9.html">instructions here</a>.)

First, open a terminal on your machine. We'll call it mybox. We're going to create a <strong>public key</strong>.

<blockquote>[me@mybox ~]$ ssh-keygen -t rsa</blockquote>

This will ask you first where you want to save the public key you're creating. (The default location ~/.ssh/id_rsa is fine.) It will then ask you for a passphrase. You can just press enter twice at those prompts to skip the passphrase (I always have).

Now make sure there is a .ssh directory in the home folder on the server where you want to log in (we'll call it myserver):

<blockquote>[me@mybox ~]$ ssh me@myserver mkdir -p .ssh</blockquote>

Next we'll append the public key from mybox to the authorized_keys list on myserver:

<blockquote>[me@mybox ~]$ cat .ssh/id_rsa.pub | ssh me@myserver 'cat &gt;&gt; .ssh/authorized_keys'
<strong>(Note that those are single quotes, not backquotes.)</strong></blockquote>

That's it. You can test it with any command that uses an ssh tunnel (ssh or even svn or git, for example). Also note that you can use this same public key to set up passwordless login on any machine you like.

Now another handy thing is adding <strong>preconfigured setups</strong> to your ssh config file. It's located in ~/.ssh/config. Here's an example setup:

<blockquote>host server
&nbsp;&nbsp;&nbsp;&nbsp;Hostname myserver
&nbsp;&nbsp;&nbsp;&nbsp;User me</blockquote>

(See <a href="http://www.tectia.com/manuals/server-win-admin/44/Configuration_File_Reference.html">this reference</a> for explanation on all the possible parameters you can use.)

Now you can type ssh server on the command line and get logged right in--no need to specify your username or enter a password.

Now mind you, this could potentially be a dangerous setup. Only use this on a <strong>well-secured computer</strong> where you are the only person with access to your terminal. Any hacker that gets in to your machine can now log in as you to myserver without having to know your username or password. Convenience comes at a price.