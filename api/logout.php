<?php
include('config.php');

$client->revokeToken();

session_destroy();

$response = array(
    'status' => 'success',
    'message' => 'Logged out successfully'
);
echo json_encode($response);

?>