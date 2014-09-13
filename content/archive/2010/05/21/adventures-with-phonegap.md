+++
title = "Adventures with PhoneGap"
slug = "adventures-with-phonegap"
url = "/2010/05/21/adventures-with-phonegap"
date = "2010-05-21T16:15:52.000Z"
+++

<a href="https://scnay-images.s3.amazonaws.com/globalconstant/adventures_with_phonegap.jpg"><img alt="Palm Pre, Motorola DROID, iPod Touch" src="https://scnay-images.s3.amazonaws.com/globalconstant/adventures_with_phonegap_small.jpg" title="Palm Pre, Motorola DROID, iPod Touch" class="alignright" width="160" height="141" /></a>

I've been working with <a href="http://www.phonegap.com/">PhoneGap</a> this week to create a simple geolocation app. It's a framework for creating mobile applications in HTML, JavaScript, and CSS that will run on all the major platforms. You write your application and reference the APIs that PhoneGap provides. Then you simply drop your HTML and JavaScript into the various platform-specific template projects they provide and compile it with the platform's native compiler. Simple as that.

But the devil is in the details. Every platform and device has subtle differences that make cross-platform development painful. There are even differences between how an emulator and a device run the application.

I've been testing on three platforms: webOS (Palm Pre Plus), Android (Motorola DROID with Android 2.1), and iPhone OS 3 (iPod Touch).

Here are a few of my frustrating findings:

## Notification: alert, beep, vibrate

First off, webOS doesn't support the <a href="http://docs.phonegap.com/phonegap_notification_notification.md.html#notification.alert">alert() command</a> at all. Android and iPhone do, in the typical fashion.

Beeping is fine on the devices themselves (the Motorola DROID even says "Droid" when you call that function). But the Android SDK emulator kills my app when I call it.

Vibration works on Android. I assume it also works on the iPhone, but I only have an iPod Touch at the moment, and it doesn't have a vibrator in the first place. The Palm Pre won't vibrate <em>unless the package name begins with com.palm.</em> Obviously for testing purposes it would be fine to label your app as coming from Palm, Inc. itself, but that won't fly if you want to distribute the app. So no vibration on webOS. And can you guess what the iPhone simulator does with the vibrate() command? It makes the app hang. Go figure.

Moral of the story: Alert, beep, and vibrate won't work reliably if you need to support every platform and don't want your code to break in an emulator.

## Location services

The webOS and iPhone simulators both show their <a href="http://docs.phonegap.com/phonegap_geolocation_geolocation.md.html">location</a> as the headquarters of their respective companies (Sunnyvale or Cupertino). The Android simulator doesn't even provide location data, so it's utterly useless for testing in that regard.

My Palm Pre Plus (running on Verizon) can get its location relatively accurately when I'm running it on 3G (even inside my office). Not so if I'm on the WiFi. If I get a fix at all, it'll take a long time and may be quite inaccurate. (Note that this is the behavior I get everywhere in webOS, not just with PhoneGap.)

The iPod inexplicably thinks it's in Lilburn, Georgia. For comparison, I'm in Provo, Utah. Only 1,927 miles off. Google Maps on the iPod gets the correct location, but not PhoneGap.

The worst of my problems, though, is the Motorola DROID. More than half the time, my app can't find its location. It doesn't matter whether I'm on 3G or WiFi, inside the office or out on ground level. When I compile and run the app immediately after I've changed something, it usually seems to get a location fix. But when I subsequently run the app (whether connected to the debugger or not), it fails to get the location. I've tried it on two different DROIDs and they both exhibit the same behavior. Google Maps and turn-by-turn navigation work perfectly--they find the location and track it reliably. But something between the phone's GPS and the PhoneGap library is getting screwed up.

## Device UUID

webOS and iPhone OS both return a useful UUID on the <a href="http://docs.phonegap.com/phonegap_device_device.md.html#device.uuid">device.uuid</a> property. However, Android (both on the emulator and on the DROID) returns simply the unhelpful "undefined." My app needs to be able to identify users by the UUID of their device, which simply doesn't work on the Android.

UPDATE: Android 2.2 (Froyo) returns a UUID as you would expect. Only problem is that hardly anyone has it as of now (July 2010), and a lot of older mainstream handsets won't be getting it at all.

## HTML Select boxes

This one really ought not to be a problem. But webOS won't let you tap on an HTML select box inside a PhoneGap application. It'll display just fine, but you can't make a selection. Select boxes work fine on normal web pages. iPhone and Android both support the select box perfectly, including the native OS skins. No dice with PhoneGap on the Palm Pre.

EDIT: Ryan from <a href="http://www.nitobi.com/">Nitobi</a> is working on a solution for this on webOS. You can <a href="http://blogs.nitobi.com/ryan/index.php/2010/05/25/html-select-tag-unsupported-in-palm-webos-application-framework/">read about it on his blog</a>.

UPDATE: Ryan has fixed this now.

## Conclusion

So. After wrestling with all of these issues, what have I determined?

PhoneGap is a really slick framework, and it makes it very easy to create a mobile app that is "write once, run anywhere." But the actual implementation details get hairy, and even fundamental operations like geolocation services and vibration are not implemented uniformly across all these devices.

_Caveat emptor._

---

For those interested, I've posted a few questions about these issues on Stack Overflow:

- <a href="http://stackoverflow.com/questions/2877754/phonegaps-vibrate-and-beep-functions-break-in-iphone-android-emulators">vibrate() and beep() breaking in the emulators</a>
- <a href="http://stackoverflow.com/questions/2877597/dropdowns-dont-work-on-webos-with-phonegap">Dropdowns not working in webOS</a>
- <a href="http://stackoverflow.com/questions/2877938/device-uuid-undefined-in-phonegap-on-android">device.uuid on the Android</a>
