+++
title = "Goodreads Across the Web"
slug = "goodreads-across-the-web"
url = "/2011/06/25/goodreads-across-the-web"
date = "2011-06-25T09:33:28.000Z"
+++

<a href="http://apps.kynetx.com/installable_apps/4405-Goodreads_Across_the_Web"><img alt="" src="http://s3.amazonaws.com/appresource/apiappimages/icons/4405/thumb.png" title="Goodreads Across the Web" class="alignright" width="48" height="48" /></a>

This week I released a Kynetx app I've been wanting to write for a long time: <a href="http://apps.kynetx.com/installable_apps/4405-Goodreads_Across_the_Web">Goodreads Across the Web</a>.

This app displays an "Add to Goodreads" button to book pages on Amazon.com and Barnes & Noble. It also displays the average user rating from Goodreads. Clicking on the link takes you the detail page on Goodreads for that particular edition of the book, so you can add it to your shelves.

<a href="http://s3.amazonaws.com/appresource/apiappimages/images/174/large.png"><img alt="" src="http://s3.amazonaws.com/appresource/apiappimages/images/174/large.png" title="Goodreads app running on Amazon.com" class="aligncenter" width="600" height="238" /></a>

I make use of the <a href="http://www.goodreads.com/api">Goodreads API</a> and a few simple Kynetx rules. For Barnes & Noble, I had to use <a href="http://globalconstant.scnay.com/2011/06/21/using-web-events-to-do-dialoguing/">dialoguing</a> to get the ISBN, since they don't put the ISBN in the URL like Amazon does.

You can <a href="http://apps.kynetx.com/installable_apps/4405-Goodreads_Across_the_Web">get this app for the KBX here</a>.

Are you a Goodreads user? What else do you want this app to do?