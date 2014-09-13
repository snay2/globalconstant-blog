+++
title = "The beginnings of a Google Docs spreadsheet KRL module"
slug = "the-beginnings-of-a-google-docs-spreadsheet-krl-module"
url = "/2011/04/04/the-beginnings-of-a-google-docs-spreadsheet-krl-module"
date = "2011-04-04T22:39:06.000Z"
+++

KRL modules are just too much fun. I've written the basics of one for reading and writing to Google Docs spreadsheets. It's based heavily on <a href="https://gist.github.com/621183">an example by Sam Curren</a>. There are two things that you must do to use the app:
<ul>
	<li><strong>Publish the spreadsheet.</strong> This is one of the options under the "Share" button in the upper-right corner of Google Docs. This will make the data accessible for read operations.</li>
	<li><strong>Create a form and make it active.</strong> This is under the "Form" menu, and it allows the module to write new rows into the spreadsheet.</li>
</ul>

Find information about this module in the new <a href="http://apps.kynetx.com/modules/a163x73">Kynetx module listing</a>.

The current version (still in its infancy) only supports writing one field with the <code>submitsingle</code> action. Eventually you'll be able to pass an array of values and have those submitted, but I'm not there yet. In addition, that is the only way to write to the spreadsheet. You can't, for example, update a cell. Yet.

I'd like to make this work with non-public spreadsheets, but those details get a little hairy, since authentication is involved. All in good time.