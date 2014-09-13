+++
title = "Image Project submission Kynetx app"
slug = "image-project-submission-kynetx-app"
url = "/2011/02/14/image-project-submission-kynetx-app"
date = "2011-02-14T19:51:49.000Z"
+++

I wrote a simple Kynetx app today that annotates Flickr and TwitPic with links to submit the image to the CS 462 Image Project website. This is similar to what students will implement in <a href="http://classes.windley.com/462/wiki/index.php/Lab_5">Lab 5</a>. I'm providing a reference implementation right now to make testing the app server in Labs 3 and 4 easier.

The app finds the image and detail URLs for you (which, depending on the site, can be a rather complicated thing). It then takes you to the /submit endpoint on the demo web server so you can fill in the rest of the details and submit the image to the system.

The Flickr version adds an "Add to the Image Project" button to the toolbar right above the image, in the same theme as the rest of the buttons.

The TwitPic version adds an "Add to the Image Project" to the image toolbar that appears when you hover over the image.

This browser extension includes both of those (and it will be updated later when I add a few more sites).

Download the extensions here:
<ul><li><a href="http://dl.dropbox.com/u/1882021/462/462_Image_Submitter.crx">Chrome</a></li>
<li><a href="http://dl.dropbox.com/u/1882021/462/462_Image_Submitter.xpi">Firefox</a></li></ul>

If you'd rather use a bookmarklet, drag this to your bookmarks bar:

<a href="javascript:(function(){var d=document;var s=d.createElement('script');s.text=&quot;KOBJ_config={'rids':['a163x44']};&quot;;d.body.appendChild(s);var l=d.createElement('script');l.src='http://init.kobj.net/js/shared/kobj-static.js';d.body.appendChild(l);})()">462 Image Submitter</a>