<?php
$user = $_POST['username'];
$email = $_POST['email'];
$newUser = $_POST['newUsername'];
$newPassword = md5($_POST['newPassword']);


$servername = "localhost";
$username = "peter";
$password = "Rennratte01";
$dbname = "restlapp";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// $sql = "UPDATE webuser SET username='$newUser', password='$newPassword' WHERE email='$email'";
$sql = "UPDATE webuser SET username='$newUser', password='$newPassword' WHERE email='$email'";

if ($conn->query($sql) === TRUE) {
  echo $newUser;
} else {
  echo "Error updating record: " . $conn->error;
}

$conn->close();




// $currentUser = $_POST['oldUsername'];
// $newUser = $_POST['newUsername']

// $connection = mysqli_connect("localhost", "root", "", "restlapp");
// $select = "SELECT * FROM webuser WHERE username ='".$_POST['oldUsername']."'";
// $result = mysqli_query($connection, $select);
// $num_rows = mysqli_num_rows($result);






// // if($_POST['newUsername'] == ""){
// //     $changeUser = $currentUser;
// // }else{
//      $changeUser = $newUser;
// // }

// if($num_rows > 0){

//     $update = "UPDATE webuser SET username='$changeUser' WHERE username='".$currentUser."'";
//     mysqli_query($connection, $update);
    
//     $userData[] = array($changeUser);
    
// }
// echo $changeUser;
// // echo json_encode($userData);

// mysqli_close($connection);

?>