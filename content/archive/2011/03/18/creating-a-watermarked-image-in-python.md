+++
title = "Creating a watermarked image in Python"
slug = "creating-a-watermarked-image-in-python"
url = "/2011/03/18/creating-a-watermarked-image-in-python"
date = "2011-03-18T11:09:15.000Z"
+++

Applying a watermark to an image in Python is a fairly simple process, but there don't seem to be many good tutorials on how to do it. This is a very simple example that creates an alpha layer, positions some text in the upper left hand corner, and fades it. It then applies the layer to the original image and saves it to disk. Here's what it looks like:

<script src="https://gist.github.com/876425.js?file=watermark.py"></script>

Hopefully those comments explain things well enough.

You can save out the image after each step and watch the transformations if that is helpful for understanding what's going on.

NOTE: This uses the Python Imaging Library, which is in the <code>python-imaging</code> package on Ubuntu. Make sure that's installed.