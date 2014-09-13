+++
title = "Sending email through Gmail using PHP"
slug = "sending-email-through-gmail-using-php"
url = "/2009/11/06/sending-email-through-gmail-using-php"
date = "2009-11-06T22:52:59.000Z"
+++

Sending email is often a necessary feature in web applications. Here's how you can send email from PHP by using SMTP through Gmail.

First, you're going to need two <a href="http://pear.php.net/">PEAR</a> packages: <a href="http://pear.php.net/package/Mail">Mail</a> and <a href="http://pear.php.net/package/Net_SMTP">Net_SMTP</a>. Make sure the directory where these files are found is listed in the <a href="http://www.php.net/manual/en/ini.core.php#ini.include-path">include_path directive in your php.ini</a> file.

This is based largely on a code snippet from <a href="http://email.about.com/od/emailprogrammingtips/qt/PHP_Email_SMTP_Authentication.htm">email.about.com</a>. Modify according to your needs. Entries in <strong>bold</strong> are ones you will definitely need to change.

    <?php

    require_once('Mail.php');

    $from = '<strong>Sender <sender@gmail.com></strong>';
    $to = '<strong>Receiver <receiver@something.com></strong>';
    $subject = '<strong>Sent from PHP on my machine</strong>';
    $body = '<strong>This is a message I sent from PHP using the '
        . 'PEAR Mail package and SMTP through Gmail. Enjoy!</strong>';

    $host = 'smtp.gmail.com';
    $port = 587; // Must be 465 or 587
    $username = '<strong>sender</strong>';
    $password = '<strong>your_password</strong>';

    $headers = array('From' => $from,
        'To' => $to,
        'Subject' => $subject);
    $smtp = Mail::factory('smtp',
        array(
            'host' => $host,
            'port' => $port,
            'auth' => true,
            'username' => $username,
            'password' => $password));

    $mail = $smtp->send($to, $headers, $body);

    if (PEAR::isError($mail)) {
        echo $mail->getMessage();
    } else {
        echo "Message sent successfully!";
    }
    echo "\n";

    ?>
