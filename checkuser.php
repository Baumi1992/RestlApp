<?php

    $connection = mysqli_connect("localhost", "root", "", "notebook");
    $select = "SELECT user_name FROM users";
    $result = mysqli_query($connection, $select);

    $num_rows = mysqli_num_rows($result);

    $checkuser = 'false';

    if($num_rows > 0) {

        while($rows = mysqli_fetch_assoc($result)){  
           
            if($rows['user_name'] == $_POST['username']){
                echo 'true';
                $checkuser = 'true';
                break;
                echo $checkuser; 
            }
       
        }

        
    }
       
    
       
    mysqli_close($connection);     

?>