+++
title = "Cost of ownCloud on S3 vs. Dropbox"
slug = "cost-of-owncloud-vs-dropbox"
url = "/2012/09/11/cost-of-owncloud-vs-dropbox"
date = "2012-09-11T11:04:42.000Z"
+++

_UPDATE SEPTEMBER 2014: I receive a lot of requests to update this with current numbers. Especially after Dropbox's change in late 2014 to 1 TB of storage, this would be a useful comparison to run again. Hopefully I'll get around to it soon._

Part of my quest to <a href="/2012/08/31/owning-my-data/">own my data</a> involves looking at alternatives to Dropbox. This sentence from their <a href="https://www.dropbox.com/terms">terms of service</a> is disconcerting:

<blockquote>We reserve the right to suspend or end the Services at any time, with or without cause, and with or without notice.</blockquote>

Amazon Web Services is <a href="http://aws.amazon.com/agreement/">more explicit</a> in the reasons and timeline for termination. Either party may terminate the agreement with 30 days notice, or Amazon may terminate it immediately <em>with notice</em>, but only for specific reasons (mostly legal, regulatory, or contractual reasons). That is a much more transparent and comforting policy.

<a href="http://owncloud.org/">ownCloud</a> looks like a good alternative to run your own Dropbox-like system, complete with desktop syncing and a mobile app. You need a web server and enough storage, either that server itself or something like Amazon S3. I decided to investigate the financial feasibility of running ownCloud and ditching Dropbox.

For comparison, let's consider the smallest Dropbox paid account (100 GB) and the equivalent amount of storage on Amazon S3.

<strong>Dropbox</strong>
Simple. 100 GB is <strong>$99.00</strong>/year. No bandwidth costs.

<strong>S3</strong>
<table>
<thead><td>Item</td><td>Amount</td><td>Price/GB</td><td>Total</td></thead>
<tr><td>Storage</td><td>100 GB</td><td>$0.125</td><td>$12.50</td></tr>
<tr><td>Bandwidth in</td><td>50 GB</td><td>$0.00</td><td>$0.00</td></tr>
<tr><td>Bandwidth out</td><td>50 GB</td><td>$0.120*</td><td>$5.88</td></tr>
<tr><td colspan="3">Total per month</td><td>$18.38</td></tr>
<tr><td colspan="3">Total per year</td><td><strong>$220.56</strong></td></tr>
</table>
*The first GB of bandwidth out is free.

In short, with full utilization and ignoring the cost of running the server for the ownCloud software, S3 is 223% more expensive ($121.56 extra per year).

Let's look at a scenario with a more moderate usage of 25 GB (closer to what I'm using now). With Dropbox you'll still pay the same price, but S3 will only charge for what you use.

<table>
<thead><td>Item</td><td>Amount</td><td>Price/GB</td><td>Total</td></thead>
<tr><td>Storage</td><td>25 GB</td><td>$0.125</td><td>$3.13</td></tr>
<tr><td>Bandwidth in</td><td>12 GB</td><td>$0.00</td><td>$0.00</td></tr>
<tr><td>Bandwidth out</td><td>13 GB</td><td>$0.120*</td><td>$1.56</td></tr>
<tr><td colspan="3">Total per month</td><td>$4.69</td></tr>
<tr><td colspan="3">Total per year</td><td><strong>$56.28</strong></td></tr>
</table>

Using only a quarter of the 100 GB, we come in about $40 cheaper on S3 (still ignoring server costs).

If you use about 40 GB, you come in close to the same price on S3 as on Dropbox.

<strong>Conclusion</strong>
In short, if you're going to use the full 100 GB, it will save you tons of money to stay with Dropbox rather than run ownCloud and put the files on S3. You'll have to weigh whether the higher price is worth the data ownership.
