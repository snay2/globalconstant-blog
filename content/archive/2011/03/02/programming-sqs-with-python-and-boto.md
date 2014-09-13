+++
title = "Programming SQS with Python and Boto"
slug = "programming-sqs-with-python-and-boto"
url = "/2011/03/02/programming-sqs-with-python-and-boto"
date = "2011-03-02T18:37:52.000Z"
+++

In my <a href="/2011/02/15/programming-simpledb-with-python-and-boto/">last post</a>, I left out a few details needed for Lab 4. One of those is Amazon SQS: Simple Queue Service.

You'll notice in the <code>comment</code> function of simpledb.py that there is an invocation of <code>funcs.addCommentToQueue()</code>. I won't show that function here, but I'll give you an example using a test queue. The analogous function here is called <code>addMessageToQueue()</code>.

Reading messages from SQS is pretty simple too. The second function, <code>readMessageFromQueue()</code>, gets all the messages currently in the queue and prints them out.

<script src="https://gist.github.com/853743.js?file=funcs.py"></script>

If you run this a few times, you'll notice some interesting behaviors:

<ul>
<li>Messages do not make it through the queue immediately. There is some latency.</li>
<li>Messages are not guaranteed to come in any particular order.</li>
<li>Messages may come more than once.</li>
</ul>

These limitations are just fine for our system, because we're using them mainly to handle batch tasks (image processing). You probably won't run into trouble with them, but you need to be aware of and handle these cases in your code.

Here is the supporting code for the above examples:

<script src="https://gist.github.com/853743.js?file=index.py"></script>

<script src="https://gist.github.com/853743.js?file=index.html"></script>

When you actually implement Lab 4, you will use a daemon. I will write more about that later. Basically, it will entail using a while loop and reading one message at a time, not in bulk like this.

Here is a good tutorial with a few more details than I have gone into here: <a href="http://boto.s3.amazonaws.com/sqs_tut.html">An Introduction to boto's SQS interface</a>.