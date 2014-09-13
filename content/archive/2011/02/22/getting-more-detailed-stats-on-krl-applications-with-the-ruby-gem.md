+++
title = "Getting more detailed stats on KRL applications with the Ruby gem"
slug = "getting-more-detailed-stats-on-krl-applications-with-the-ruby-gem"
url = "/2011/02/22/getting-more-detailed-stats-on-krl-applications-with-the-ruby-gem"
date = "2011-02-22T13:02:37.000Z"
+++

A couple months ago, Kynetx <a href="http://stackoverflow.com/questions/4456263/getting-rse-stats-for-kynetx-apps/4506066#4506066">released</a> a new version of <a href="http://code.kynetx.com/2010/06/23/the-command-line-ruby-gem/">their Ruby gem</a>, which added support for getting statistics on your apps. A limited version of this facility was available in the old AppBuilder, but the feature was removed when the current AppBuilder <a href="http://code.kynetx.com/2010/06/21/getting-to-know-the-new-appbuilder/">rolled out last April</a>.

There is a bare-bones command, <code>krl stats</code>, that will give you a simple run-down of your app's stats for yesterday. It looks like this:

<a href="http://scnay-images.s3.amazonaws.com/globalconstant/krl_stats.png"><img alt="" src="http://scnay-images.s3.amazonaws.com/globalconstant/krl_stats.png" title="krl stats" class="aligncenter" width="600" /></a>

But if you want to get information in any more depth, you'll have to learn the somewhat complex <code>krl stats_query</code> syntax. First run <code>krl stats_interface</code> to list all the possibilities. Let's say for this example that I want to know how many rules were fired per day of the week for the last three months. I would construct a query like this:

<code>krl stats_query -k rules_fired -d day_of_week -r last_three_months</code>

That produces something like this:

<a href="http://scnay-images.s3.amazonaws.com/globalconstant/krl_stats_query.png"><img alt="" src="http://scnay-images.s3.amazonaws.com/globalconstant/krl_stats_query.png" title="krl stats_query" class="aligncenter" width="600" /></a>

I haven't figured out how to specify multiple KPIs or dimensions, though. For example, I might want a report that gave me both BRSE and rules fired, or perhaps one that correlated the day/month/year with the day of the week. I have an open <a href="http://stackoverflow.com/questions/5082566/getting-multiple-columns-on-a-krl-stats-query-with-the-gem">question on StackOverflow</a> that should hopefully clear that up.