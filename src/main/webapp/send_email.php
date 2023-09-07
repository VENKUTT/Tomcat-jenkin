<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["name"];
    $email = $_POST["email"];
    $message = $_POST["message"];

    // Set the recipient email address
    $to = "suryamanikanta1999@gmail.com";

    // Set the email subject
    $subject = "New Enquiry from ELPDevOps Website";

    // Compose the email body
    $body = "Name: " . $name . "\n";
    $body .= "Email: " . $email . "\n";
    $body .= "Message: " . $message;

    // Send the email
    mail($to, $subject, $body);
}
?>

