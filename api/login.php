<?php 
include('config.php');

 if (isset($_POST['code']) && empty($_POST['refresh'])) {
    $token = $client->fetchAccessTokenWithAuthCode($_POST['code']);
    if(isset($token['access_token'])){
        $client->setAccessToken($token['access_token']);
        $refreshToken = $token['refresh_token'];    
    }else{
        echo json_encode($token);
    }   
  }else if (!empty($_POST['refresh'])) {
    if ($client->isAccessTokenExpired()) {
        $refreshToken = $_POST['refresh'];

        $client->refreshToken($refreshToken);

        $accessToken = $client->getAccessToken();

        $client->setAccessToken($accessToken);
    }
}
  $google_oauth = new Google_Service_Oauth2($client);
  $google_account_info = $google_oauth->userinfo->get();
  $email =  $google_account_info->email;
  $name =  $google_account_info->name;

  $response = array(
    'name' => $name,
    'token' => $client->getAccessToken(),
    'refresh'=>$refreshToken
);
echo json_encode($response);

?>