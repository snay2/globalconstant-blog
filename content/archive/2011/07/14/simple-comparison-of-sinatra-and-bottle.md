+++
title = "Simple comparison of Sinatra and Bottle"
slug = "simple-comparison-of-sinatra-and-bottle"
url = "/2011/07/14/simple-comparison-of-sinatra-and-bottle"
date = "2011-07-14T16:42:14.000Z"
+++

I needed to write a very simple web server today. I maintained a small <a href="http://www.sinatrarb.com/">Sinatra</a> server when I was the <a href="/2011/04/19/cs-462-in-conclusion/">TA for CS 462</a>. The code was clean and sensible, so I decided to give it a try.

However, liking Python as I do, I <a href="http://stackoverflow.com/questions/3070469/what-python-equivalent-of-sinatra-would-you-recommend">went searching</a> for a Sinatra lookalike for Python. There are a few, but I tried <a href="http://bottlepy.org">Bottle</a>.

I implemented the server using both frameworks for comparison. Here's what the code for each looks like, with Bottle on the left and Sinatra on the right (click to enlarge):

<a href="https://s3.amazonaws.com/scnay-images/globalconstant/sinatra-bottle.png"><img alt="" src="https://s3.amazonaws.com/scnay-images/globalconstant/sinatra-bottle.png" title="Bottle vs. Sinatra" class="aligncenter" width="600" /></a>

The Bottle version of the server is several lines longer and not quite as succinct. While I'm still new to Ruby, there are several things I like better about its syntax than Python's (e.g., the <code>.to_i</code> operator, beestings, better handling of "global" variables--settings in this case).

I think Sinatra wins here. What do you think?