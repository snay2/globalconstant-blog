+++
title = "Oracle 10g ORA_ROWSCN Pseudocolumn"
slug = "oracle-10g-ora_rowscn-pseudocolumn"
url = "/2009/10/13/oracle-10g-ora_rowscn-pseudocolumn"
date = "2009-10-13T15:45:27.000Z"
+++

Oracle 10g maintains a pseudocolumn the tracks the revision number of records. It's called <a href="http://download.oracle.com/docs/cd/B19306_01/server.102/b14200/pseudocolumns007.htm#BABFAFIC">ORA_ROWSCN</a>. (SCN stands for System Change Number.) There's also a handy function, <a href="http://download.oracle.com/docs/cd/B19306_01/server.102/b14200/functions142.htm#BABEHBCB">SCN_TO_TIMESTAMP</a>, which will convert that revision number to a human-readable date and time.

But there are a few caveats:

<ul><li>The revision numbers are <a href="http://asktom.oracle.com/pls/asktom/f?p=100:11:0::::P11_QUESTION_ID:517105100346104196">tracked on a block level</a>, meaning that even if you modify only one row, surrounding rows may also receive the new version number. You can turn on row-level tracking when you create the table, but there's no way to do so after the fact.</li>

<li>SCN_TO_TIMESTAMP will only be able to convert the SCN to a timestamp if the revision occurred <a href="http://www.julianjewel.com/wordpress/?p=50">within the last five days</a>. Otherwise you get the lovely error: "ORA-08181: specified number is not a valid system change number".</li></ul>

<a href="http://articles.techrepublic.com.com/5100-10878_11-6088111.html">This article</a> has a good description and two enlightening examples for those interested.