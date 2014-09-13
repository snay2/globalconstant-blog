+++
title = "Foreign keys in MySQL: InnoDB and MyISAM"
slug = "foreign-keys-in-mysql-innodb-and-myisam"
url = "/2009/12/08/foreign-keys-in-mysql-innodb-and-myisam"
date = "2009-12-08T15:14:39.000Z"
+++

To create a foreign key in a MySQL database, there are a few things to keep in mind:
<ul>
	<li>Any tables using the foreign keys must use the InnoDB engine (MyISAM, the default database engine, doesn't support them)</li>
	<li>The foreign key field must be indexed</li>
</ul>

Jim Epler posted a <a href="http://www.mytechmusings.com/2008/04/using-foreign-keys-in-mysql.html">great tutorial</a> (including screencasts) explaining the process of adding foreign keys.

As far as the differences between InnoDB and MyISAM go, here are my findings:
<ul>
	<li>MyISAM is based on a proven, reliable code base</li>
	<li>MyISAM is very fast and efficient for normal operations, such as selecting and inserting</li>
	<li>If you need relational design (esp. foreign keys), you'll need InnoDB</li>
	<li>InnoDB also supports transactions and row-level locking (as opposed to the table locking of MyISAM</li>
	<li>InnoDB has better crash recovery, especially on large data sets</li>
</ul>

See <a href="http://www.mikebernat.com/blog/MySQL_-_InnoDB_vs_MyISAM">Mike Bernat's post</a> and <a href="http://blog.inetu.net/2009/04/mysql-innodb-or-myisam/">this page on INetU</a>. The MySQL developer documentation also provieds a <a href="http://dev.mysql.com/tech-resources/articles/storage-engine/part_3.html">detailed comparison</a> of all the supported database engines.