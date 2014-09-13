+++
title = "Simple stats for Kynetx apps"
slug = "simple-stats-for-kynetx-apps"
url = "/2011/06/02/simple-stats-for-kynetx-apps"
date = "2011-06-02T17:10:16.000Z"
+++

<a href="http://apps.kynetx.com/installable_apps/3459-TomatoFlix"><img alt="" src="https://s3.amazonaws.com/scnay-images/kynetx/TomatoFlix.png" title="TomatoFlix" class="alignright" width="100" height="100" /></a>

<a href="http://apps.kynetx.com/installable_apps/3459-TomatoFlix">TomatoFlix</a> has become rather popular lately. It runs on several different sites: Netflix (hence the name), IMDb, Redbox, Movies.com, and Fandango. I want some more detailed information about where people use it the most.

I decided to use app variables as simple counters. The idea for this came from a similar thing that <a href="https://twitter.com/edorcutt">Ed Orcutt</a> did with HoverMe.

At the end of each rule, I added a postlude that increments an app variable identifying the website where it was run. The rule for Netflix now looks like this at the end:

<script src="https://gist.github.com/1005540.js?file=postlude.rb"></script>

Simple enough. Every time the rule gets fired on Netflix, that counter gets incremented.

Now to build a front-end for viewing the stats. I'm not too picky about this, since no one will look at them besides me. I use <a href="https://twitter.com/rsbohn">Randall Bohn</a>'s <a href="http://ktest.heroku.com/">ktest Heroku app</a> as the endpoint. Then I just build a simple notify() like this:

<script src="https://gist.github.com/1005540.js?file=stats.rb"></script>

Now I just have to add a bookmark to my toolbar that goes to my app's url on ktest.heroku.com and we're set. (<a href="http://twitter.com/TelegramSam">Sam Curren</a>'s K<a href="http://apps.kynetx.com/installable_apps/4039-Kynetx_AppBuilder_kTest_Link">ynetx AppBuilder kTest Link app</a> makes that really easy to find.) Here's what it looks like:

<a href="https://s3.amazonaws.com/scnay-images/globalconstant/tomatoflix-stats.png"><img alt="" src="https://s3.amazonaws.com/scnay-images/globalconstant/tomatoflix-stats.png" title="TomatoFlix stats" class="aligncenter" width="257" height="110" /></a>

And since ktest runs the dev version of the app as if it were a bookmarklet, I don't have to add ktest.heroku.com to the dispatch block (which might confuse users <a href="http://apps.kynetx.com/installable_apps/3459-TomatoFlix">downloading the app</a>).

