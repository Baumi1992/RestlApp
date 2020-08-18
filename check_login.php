<?php

$connection = mysqli_connect("localhost", "root", "", "notebook");
$select = "SELECT * FROM webuser WHERE email='". $_POST['email']."' AND password='". md5($_POST['password'])."'";
$result = mysqli_query( $connection, $select);

$num_rows = mysqli_num_rows($result);

$checkuser = 'false';

if( $num_rows > 0 ) {
    session_start();
    
    if($_SESSION['user'] = $_POST['user'] || $_SESSION['email'] = $_POST['user']){
        
        $_SESSION['user'] = $_POST['user'];
        $checkuser = 'true';
    }
    
    
    $_SESSION['user'] = $_POST['user'];
    $checkuser = 'true';

    while($rows  = mysqli_fetch_assoc($result)){
       
        $_SESSION['user_id'] = $rows['user_id'];
        $_SESSION['color'] = $rows['bg_color'];
        $_SESSION['photo'] = $rows['photo'];
        $_SESSION['first_name'] = $rows['first_name'];
        $_SESSION['last_name'] = $rows['last_name'];
        
    }
    
}
echo $checkuser;

?>