<?php
$username = $_POST['username'];
$email = $_POST['email'];
$password = md5($_POST['password']);


// // Initialize variable for database credentials
// $dbhost = 'localhost';
// $dbuser = 'root';
// $dbpass = '';
// $dbname = 'restlapp';

// //Create database connection
// $dblink = new mysqli($dbhost, $dbuser, $dbpass, $dbname);
 
// //Check connection was successful
// if ($dblink->connect_errno) {
//     printf("Failed to connect to database");
//     exit();
// }

// //Fetch 3 rows from actor table
// $result = $dblink->query("SELECT * FROM webuser WHERE username='$username'");

// //Initialize array variable  
// $dbdata = array();

// //Fetch into associative array
//   while ( $row = $result->fetch_assoc())  {
// 	$dbdata[]=$row;
//   }

// //Print array in JSON format
//  echo json_encode($dbdata);
 
$connection = mysqli_connect("localhost", "root", "", "restlapp");
$select = "SELECT * FROM webuser WHERE email='$email'";
$result=mysqli_query($connection,$select);
$num_rows = mysqli_num_rows($result);


if ($num_rows > 0) {
    echo false;
    while($rows = mysqli_fetch_assoc($result)){ 
        session_start();
       
        $_SESSION['user'] = $rows['username']; 
        $_SESSION['email'] = $rows['email']; 
    
        if($email == $rows['email']){
           
        }
    }   
}
else { 
    $insert = "INSERT INTO webuser (username, password, email) VALUES ('$username','$password', '$email')";
    $result = mysqli_query($connection,$insert);   
    echo $result;
}


mysqli_close($connection);
?>











 