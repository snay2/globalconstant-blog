+++
title = "Using a git post-receive hook for easy production deploys"
slug = "using-a-git-post-receive-hook-for-easy-production-deploys"
url = "/2013/02/20/using-a-git-post-receive-hook-for-easy-production-deploys"
date = "2013-02-20T09:48:55.000Z"
+++

I have a git repository on my dev machine, which I use for developing and testing code locally. When I'm ready to deploy to production, I simply push that git repo to the server and use a post-receive hook there to move the code into the proper places. Here's what my setup looks like.

My `~/.ssh/config` has a Host entry called `prod` for the production server that specifies where it lives and how to authenticate.

In `.git/config`, I have a remote section for the production server:

    [remote "prod"]
        url = ssh://prod:~/web.git
        fetch = +refs/heads/*:refs/remotes/origin/*

`web.git` on the server is set up as a bare repository. In the `hooks` folder, I have a `post-receive` file like this:

    #!/bin/sh
    # Check out the source tree without .git
    GIT_WORK_TREE=/home/ubuntu/stage/web git checkout -f

    # Turn off debug mode, if enabled
    sed -i -e "/^DEBUG = True$/s/True/False/" /home/ubuntu/stage/web/settings.py

    # You can do any other configuration here to transform the code
    #  from development to production.

    # Restart Apache
    sudo apache2ctl restart

Permissions are set on the `/home/ubuntu/stage/web` folder and the `/etc/apache2/sites-enabled/` file points to that folder as the DocumentRoot.

That's all it takes. Now every time I do a `git push prod master` on my dev machine, the code is uploaded to the server, properly configured for a production environment, and fed to Apache.
