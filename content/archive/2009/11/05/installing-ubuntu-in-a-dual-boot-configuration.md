+++
title = "Installing Ubuntu in a dual-boot configuration"
slug = "installing-ubuntu-in-a-dual-boot-configuration"
url = "/2009/11/05/installing-ubuntu-in-a-dual-boot-configuration"
date = "2009-11-05T22:20:45.000Z"
+++

<a href="https://wiki.ubuntu.com/Artwork/Official"><img src="https://scnay-images.s3.amazonaws.com/globalconstant/ubuntucof.png" alt="Ubuntu Circle of Friends" title="Ubuntu Circle of Friends" width="120" height="120" class="alignright size-full wp-image-155" /></a>I've installed Ubuntu several times on various machines in a dual-boot format, but I've never blogged about it. In all cases, it's been with Windows on the first partition (mostly with XP, but also once with Vista on a new machine), so I'll use that as my example here.

First things first. Get Windows ready. This usually includes <a href="http://support.microsoft.com/kb/314848">defragmenting</a> to get all your files at the beginning of the partition. That's pretty much it.

Next, <a href="http://www.ubuntu.com/getubuntu/download">get the install CD</a> (from <a href="http://www.ubuntu.com/">Ubuntu</a> or your <a href="http://en.wikipedia.org/wiki/Linux_distributions">favorite distribution</a>).

Boot into the installation CD. Ubuntu comes with a partition editor (<a href="http://gparted.sourceforge.net/">GParted</a>) on the CD, which you'll need soon.

Resize your Windows partition in order to leave enough space for (a) the linux system itself, (b) a swap partition if your RAM isn't plentiful, and (c) any other shared partitions you may want to make:
<ul>
<li>(a) In the case of Ubuntu, the <a href="http://www.ubuntu.com/products/whatisubuntu/desktopedition">minimum hard drive space required is 4 GB</a>, although in my experience at least 10-15 GB is better. This partition will probably be of type ext4 (at least, it is in the latest version of Ubuntu)</li>
<li>(b) Depending on how much RAM you have and how much hard disk space is available, you may want to add a <a href="https://help.ubuntu.com/community/SwapFaq">swap partition</a>. This is a sort of paging file used to swap out segments of the RAM that aren't used very often, freeing up memory for more active applications. On my old machine, which has 512 MB RAM, I added a 1 GB swap partition. On my current machine with 4 GB RAM, I don't have any swap space at all and everything runs fine. It's up to you.</li>
<li>(c) If you want to be able to share files between Windows and linux (and haven't yet converted to a cooler solution like <a href="http://www.getdropbox.com/">Dropbox</a>), it might be wise to make a FAT32 partition that can be read by both operating systems. Make this one however large you need.</li></ul>

Be sure to tell the partition editor that you're going to want to put the root file system (/) on your ext4 partition, and ensure that your swap partition (if you made one) is correctly identified as such.

If you've made it this far, you're almost done. Now run the installer and let it work its magic.

Ubuntu's always installed GRUB without a hitch. But if you do run into trouble, <a href="https://help.ubuntu.com/community/GrubHowto#Backup,%20Repairing%20and%20Reinstalling%20GRUB">this documentation from Ubuntu</a> is a good place to look.

Congratulations, and welcome to linux!