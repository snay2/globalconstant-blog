+++
title = "Owning my data"
slug = "owning-my-data"
url = "/2012/08/31/owning-my-data"
date = "2012-08-31T13:49:32.000Z"
+++

Two months ago I decided to switch to Octopress. The idea of writing posts in Markdown and compiling them into a static site was appealing. The problem was that I had to be on my laptop at home to write a post, and I hadn't quite mastered the quirks of the system. As a result, I haven't written a blog post in two months, so I decided to switch back to WordPress.

One of the main arguments in favor of a system like Octopress is "owning your data". Rather than use a "free" hosted service that mines your writing to produce useful data for advertisers, it's better to pay a little more (in time or money) and host your writing yourself. I moved this blog to my own server a few years ago, and it has been worth it.

<strong>Project Reclaim</strong>
I read about Boone Gorges "<a href="http://projectreclaim.net/">Project Reclaim</a>" today and found it intriguing. He's on a quest to get rid of as much proprietary software and systems as he can and regain control of his data. Seems like a worthwhile endeavor that I want to pursue as well. At the moment, the following services are my biggest hangups:

<ol>
<li><strong>Gmail,</strong> not just for the email itself, but for Google Docs, OAuth-like logins, and Chrome Sync</li>
<li><strong>Twitter.</strong> I am a heavy user of Twitter, but all the content I produce there disappears into Twitter's unsearchable archives after a matter of weeks. I need a more long-term solution in which I control my writing, but it needs to be just as easy to use (desktop, web, and mobile).</li>
<li><strong>Instagram.</strong> This is my platform of choice for photo sharing on Twitter and Facebook. I'm currently porting everything to <a href="http://snay2.openphoto.me/">OpenPhoto</a>, which lets you use your own S3 bucket to store the images. All the photos are stored in my own S3 account.</li>
<li><strong>Dropbox.</strong> <a href="http://owncloud.org/">Owncloud</a> looks like a great alternative, as they have desktop sync clients and possibly mobile clients in the works. As soon as version 5 comes out (which <a href="http://blog.gapinthecloud.com/2012/06/10/configuring-external-storage-for-owncloud/">supports using S3</a> instead of the server's own disk space), I'll install it on this domain and give it a try.</li>
</ol>

There are a few others, like Facebook (to which I rarely post anything) and Mint.com (no matter how trustworthy Intuit may be, I'd be better off using something like <a href="http://www.youneedabudget.com/">YNAB</a> on my own machine and importing transactions manually). But I'm not as concerned about those at the moment. I first want to own all my important content production--writing and photos--and then I'll work on the rest.

<strong>Current objectives</strong>
As I mentioned, I'm moving over to <strong>OpenPhoto</strong>. A few days should tell me whether it's good enough to replace Instagram.

I'm also going to create a new <strong>linkblog</strong> on this domain. I had hoped to use Dave Winer's <a href="http://serversetup.reallysimple.org/">Radio2</a> software, since it stores its data on S3 and produces a <a href="http://links.scripting.com/">nice output</a>. But it's Windows- or Mac-only software, and I am only running Linux servers. I'm hoping I can find a good way to do that with WordPress. Once I do, I'll start having those feed into Twitter and then use their native clients only for conversation and less-important writing.

I may also decide to move away from <strong>Gmail</strong>, choosing something like <a href="http://www.rackspace.com/apps/email_hosting/rackspace_email/">hosted email from Rackspace</a>, about which I've heard good things. At $2/month, it's an affordable alternative to Google's data mining.