+++
title = "Using Chrome desktop notifications on your own site"
slug = "using-chrome-desktop-notifications-on-your-own-site"
url = "/2011/02/24/using-chrome-desktop-notifications-on-your-own-site"
date = "2011-02-24T17:25:02.000Z"
+++

Google Chrome has an API to allow websites to use desktop notifications. This is the same thing that Google's apps (e.g., Gmail) and some Chrome extensions (e.g., TweetDeck) use for message notifications. It's drop-dead simple to use. Here's a simple example:

<script src="https://gist.github.com/843099.js?file=notifications.html"></script>

This does two things. First, it requests permission for the website to display notifications. This presents the user with this banner:
<a href="http://scnay-images.s3.amazonaws.com/globalconstant/notification-permission.png"><img alt="" src="http://scnay-images.s3.amazonaws.com/globalconstant/notification-permission.png" title="Notification permission request" class="aligncenter" width="516" height="102" /></a>

Once permission has been obtained, the callback displays the notification like this:

<a href="http://scnay-images.s3.amazonaws.com/globalconstant/notification-display.png"><img alt="" src="http://scnay-images.s3.amazonaws.com/globalconstant/notification-display.png" title="Notification display" class="aligncenter" width="302" height="82" /></a>

Of course, you will want to use the checkPermission() function to make sure the user clicked "Allow". If they denied permission, you might have to do something else.

Here is some <a href="http://www.chromium.org/developers/design-documents/desktop-notifications/api-specification">documentation from the Chromium project</a> about Chrome's implementation, and here is <a href="http://0xfe.blogspot.com/2010/04/desktop-notifications-with-webkit.html">a more in-depth example</a>.