<?php
$username = $_POST['username'];
$email = $_POST['email'];
$password = md5($_POST['password']);
$login = $_POST['login'];
$check = "";
$connection = mysqli_connect("localhost", "root", "", "restlapp");


if(strcmp($login, 'true') === 0 ) {
    $select = "SELECT username FROM webuser WHERE email='". $_POST['email']."' AND password='". md5($_POST['password'])."'";
} else {
    $select = "SELECT username FROM webuser WHERE email='$email'";
}

$result=mysqli_query($connection,$select);
$num_rows = mysqli_num_rows($result);

$successfullyRegistered = false;
if(strcmp($login, 'false') === 0 && $num_rows == 0){
    $successfullyRegistered = register($connection,$username, $email, $password);
}

if($successfullyRegistered) {
    $userData[] = array($username);
    echo json_encode($userData);
} else {

    if ($num_rows > 0) {
        while($row = mysqli_fetch_assoc($result)){   
            $userData[] = $row;
            echo json_encode($userData);
        }
    } else if ($num_rows == 0){
        echo 0;
    }
    
}




mysqli_close($connection);


function register($connection, $username, $email, $password){
    
    $insert = $connection->prepare("INSERT INTO webuser (username, password, email) VALUES (?, ?, ?)");
    $insert->bind_param("sss", $username, $password, $email);

    // set parameters and execute
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = md5($_POST['password']);
    return $insert->execute();
}

?>