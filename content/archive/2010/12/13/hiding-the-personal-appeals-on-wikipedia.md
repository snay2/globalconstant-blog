+++
title = "Hiding the \"personal appeal\" banners on Wikipedia using Kynetx"
slug = "hiding-the-personal-appeals-on-wikipedia"
url = "/2010/12/13/hiding-the-personal-appeals-on-wikipedia"
date = "2010-12-13T11:09:08.000Z"
+++

I've already seen the Wikipedia banners a million times: "Please read this personal appeal from Jimmy Wales/Sue Gardner/whoever". I'm not interested in seeing them anymore. So I wrote a simple Kynetx app to get rid of them.

Here's the code:

<pre>ruleset a163x33 {
  meta {
    name "Hide Wikipedia notices"
    description &lt;&lt;
      Hides the siteNotice&gt;centralNotice divs at the top of Wikipedia
      (such as the "personal appeals" from people)
    &gt;&gt;
    author "Steve Nay"
    logging off
  }

  dispatch {
    domain "wikipedia.org"
  }

  global {
    css &lt;&lt;
      #siteNotice &gt; #centralNotice { display: none; }
    &gt;&gt;;
  }

  rule hideNotice {
    select when web pageview "en.wikipedia.org/w(iki)?/(.*)"
    noop();
  }
}</pre>

It basically just emits some CSS that will hide all the div tags with the id centralNotice that occur as direct children of the siteNotice divs. Then it does that any time you visit a page on Wikipedia. Really simple.

Now those banners will never appear at the top of Wikipedia articles anymore!

You can <a href="http://marketplace.kynetx.com/app/hide-wikipedia-notices">get this app on the Kynetx MarketPlace</a>.