<?php

require "vendor/autoload.php";

use Kreait\Firebase;
use Kreait\Firebase\Messaging\CloudMessage;
use Kreait\Firebase\Messaging\Notification;
use Kreait\Firebase\Factory;
use Kreait\Firebase\ServiceAccount;
use Kreait\Firebase\Messaging\RawMessageFromArray;

// This assumes that you have placed the Firebase credentials in the same directory
// as this PHP file.
$serviceAccount = ServiceAccount::fromJsonFile(__DIR__.'/google-service-account.json');

$firebase = (new Factory)
    ->withServiceAccount($serviceAccount)
    ->withDatabaseUri('https://toexpress-app.appspot.com')
    ->create();

$messaging = $firebase->getMessaging();


$message = new RawMessageFromArray([
    'topic' => 'notifications',
    'notification' => [
        'title' => $_POST["notification_title"],
        'body' => $_POST["notification_body"],
    ],
]);

$result = $messaging->send($message);

//redireccionamos donde corresponde...
echo '<script language = javascript>
    alert("Notificación enviada de manera exitosa")
    self.location = "../pushNotifications"
    </script>';
?>
