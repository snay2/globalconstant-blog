#!/bin/bash

echo -e "\033[0;32mDeploying updates to Github...\033[0m"

# Build the project.
hugo -s ./

# Add changes to git.
# git add .

# Commit changes.
# msg="Site rebuild `date`"
# if [ $# -eq 1 ]
    # then msg="$1"
# fi
# git commit -m "$msg"

# Push source and build repos.
# git push origin master
# git subtree push --prefix=public git@github.com:snay2/snay2.github.io.git master


# Push to FTP server with mirror mode (requires lftp)
# Set up ~/.netrc like this:
# > machine ftp.messagingengine.com
# >     user yourusername@fastmail.com
# >     password yourPassword
lftp -c "set ftp:list-options -a;
open ftp.messagingengine.com;
lcd ~/sandbox/globalconstant-blog/public;
cd /scnay.fastmail.com/files/public_html;
mirror --reverse --delete --only-newer --use-cache --verbose --allow-chown --allow-suid --no-umask --parallel=2"
