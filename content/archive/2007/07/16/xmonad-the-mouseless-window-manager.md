+++
title = "xmonad: the mouseless window manager"
slug = "xmonad-the-mouseless-window-manager"
url = "/2007/07/16/xmonad-the-mouseless-window-manager"
date = "2007-07-16T08:33:02.000Z"
+++

The other day I discovered (through link surfing) a window manager called <a href="http://xmonad.org/">xmonad</a>. It is an extremely small (the compiled executable is 1.2M), lightning fast, sleek window manager for Linux designed to make the most of screen real estate and maximize your productivity using X. It can operate entirely without the mouse.

<a title="xmonad window manager" href="https://scnay-images.s3.amazonaws.com/globalconstant/xmonad_screenshot.png"><img src="https://scnay-images.s3.amazonaws.com/globalconstant/xmonad_small.png" alt="xmonad window manager" align="right" /></a>xmonad works by opening windows in tiles, which are rearranged as you open more windows. The primary window is on the left or top half of the screen (depending on which mode you're in) and the other windows stack in the other half of the screen. You can switch between windows using Mod+J and Mod+K ("Mod" is the Alt key on my machine), and you can swap windows to and from the primary position. Naturally, there are multitudinous ways to resize, move, and reorder the windows within the different panes. It also includes support for multiple workspaces (as do most WMs) and even multiple monitors if you have them.

I've been playing with xmonad for a little while now and I quite enjoy it. It allows me to work easily from the command line but still run my X apps without too much hassle. I've found, however, that with programs like Firefox which pop up smaller windows on occasion (e.g., file and settings dialogs), it's best to run in full-screen mode. When running in the normal tiling mode, the popups sometimes take on strange proportions as they are squeezed into the existing layout. Using full-screen mode usually gives them their natural dimensions.

No title bars, no icons, no nonsense. This window manager is very simple, clean, and fast. There's a bit of a learning curve with all the keyboard navigation, but for any Linux hacker who knows <a href="http://www.vim.org/">vim</a>, it shouldn't be too hard to pick up.

Mostly for my own benefit, but also for any  fellow Linux geeks, I've posted the process I went through to install xmonad:
<ol>
	<li>First make sure you look at the <a href="http://xmonad.org/intro.html">overview</a>, which includes everything you need to get started. It describes how to get the Haskell compiler and the required packages, including mtl, X11, and X11-extras (those were the three I had to get myself).</li>
	<li>Once I had installed all the required packages, I installed <a href="http://gotmor.googlepages.com/dzen">dzen</a> and dmenu (which involved compiling them from source with <span style="font-family:monospace;">make</span>).</li>
	<li>At this point, you want to edit xmonad's Config.hs script to put a space at the top for dzen to run as the status bar. This file is in the source directory for xmonad. Open it and find the line that says "<span style="font-family:monospace;">defaultGaps = [(0,0,0,0)]</span>" and replace it with "<span style="font-family:monospace;">defaultGaps = [(18,0,0,0)]</span>".</li>
	<li>Now compile xmonad with the runhaskell command, as described in the documentation. (Make sure to keep the source around, since any reconfiguration you do requires recompilation.)</li>
	<li>I found it easiest to use the .xsession script to launch xmonad from the gdm, rather than using a .desktop file in /usr/share/xsessions, since it's easier to specify startup programs and the like. Here is my .xsession script:

<blockquote>unclutter -idle 1 &amp;
while true ; do
    bt=`acpi -b | sed -n 's/.*, ([0-9]*%).*$/1/;1p' | xargs printf 'Battery: %sn'`
    tm=`date +"%H:%M %a %b %d"`
    printf "%s | %sn" "$bt" "$tm"
    sleep 60
done | dzen2 -ta r -fg '#ffffff' -bg '#808080' &amp;
xterm &amp;
xmonad</blockquote>
</li>
<li><ul><li>The unclutter command instructs X to hide the mouse once it's been idle for one second. (There is a package for unclutter in Ubuntu.)</li>
	<li>The next six lines describe the text I want dzen to display in the status bar. The "date" part displays the date in the form "21:59 Fri Jul 13". The other part extracts the battery percentage from acpi and formats it (which is important because I'm on a laptop).</li>
	<li>The printf command concatenates those two pieces of information.</li>
	<li>The sleep command tells dzen to wait 60 seconds between each update.</li>
	<li>The last line actually passes that loop to dzen and sets some options.</li>
	<li>The second-to-last line starts a terminal so I can start using it as soon as I log in. (Otherwise it just presents a blank screen and the status bar.)</li>
	<li>Finally, the xmonad command starts the window manager itself.</li>
</ul>
</li>
	<li>Now it's play time! Experiment with the layout features and keyboard shortcuts and customize to your heart's content! And long live the terminal! ;)</li>
</ol>
So there we go. Yet another nifty window manager for Linux.

UPDATE: Tassilo posted some more technical information about xmonad on his blog. <a href="http://tsdh.wordpress.com/2007/06/24/xmonad-does-things-just-right/">Take a look</a> if you're interested in diving in yourself. Also, thanks the the guys at xmonad for <a href="http://xmonad.org/press.html">their link</a>.