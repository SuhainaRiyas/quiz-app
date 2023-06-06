<?php
error_reporting(E_ALL);
session_start();
ini_set('display_errors', 1);
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");

require_once 'vendor/autoload.php';

$connect = mysqli_connect("localhost", "root", "", "quiz-app");

if($connect === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

$clientID = '773685090248-7bo1uloio6fibdfr13r8jjspb2tj0i81.apps.googleusercontent.com';
$clientSecret = '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';
$redirectUri = 'http://localhost:3000/home';
  
$client = new Google_Client();
$client->setClientId($clientID);
$client->setClientSecret($clientSecret);
$client->setRedirectUri($redirectUri);
$client->addScope("email");
$client->addScope("profile");
$client->setAccessType("offline");


?>