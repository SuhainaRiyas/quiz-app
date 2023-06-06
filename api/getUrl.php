<?php
include('config.php');

    $authUrl = $client->createAuthUrl();
    if($authUrl){
        $response = array(
            'authUrl' => $authUrl,   
        );
        echo json_encode($response);
    }else{
        $response = array(
            'status' => 'error',
            'message' => 'No questions found for this topic'
        );
        echo json_encode($response);
    } 

?>