+++
title = "Bash script to easily sign multiple PGP keys"
slug = "bash-script-to-easily-sign-multiple-pgp-keys"
url = "/2011/10/21/bash-script-to-easily-sign-multiple-pgp-keys"
date = "2011-10-21T11:16:58.000Z"
+++

The project this week in Computer Security (CS 465) deals with secure email. Everyone in the class generated a PGP key, and we had a "key-signing party" in class. Everyone identified his or her PGP key ID and showed two forms of identification to prove ownership.

The second part of the key signing is done by each person individually. It requires downloading each key, verifying it, and signing it. This can be a tedious process that consists of four gpg commands:

<pre>gpg --keyserver pgp.mit.edu --search-keys user@email.com
gpg --fingerprint user@email.com
gpg --sign-key user@email.com
gpg --keyserver pgp.mit.edu --send-key KEY_ID﻿</pre>

Typing those is obviously a pain, so I wrote a bash shell script to automate them. I also added a grep-like command that extracts the KEY_ID from the fingerprint output so I don't have to read and type it in manually. The whole thing loops infinitely until I press Ctrl+C. Here's what it looks like:

<script src="https://gist.github.com/1304368.js?file=sign.sh"></script>