<?php

    $connection = mysqli_connect("localhost", "root", "", "restlapp");
    $select = "SELECT email FROM webuser";
    $result = mysqli_query($connection, $select);

    $num_rows = mysqli_num_rows($result);

    $checkuser = 'false';

    if($num_rows > 0) {

        while($rows = mysqli_fetch_assoc($result)){  
           
            if($rows['email'] == $_POST['email']){
                echo 'true';
                $checkuser = 'true';
                break;
                echo $checkuser; 
            }
       
        }

        
    }
       
    
       
    mysqli_close($connection);     

?>