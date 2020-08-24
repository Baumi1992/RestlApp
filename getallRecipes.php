<?php

// Initialize variable for database credentials
$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$dbname = 'restlapp';

//Create database connection
  $dblink = new mysqli($dbhost, $dbuser, $dbpass, $dbname);

//Check connection was successful
  if ($dblink->connect_errno) {
     printf("Failed to connect to database");
     exit();
  }

//Fetch 3 rows from actor table
  $result = $dblink->query("SELECT * FROM recipe 
  INNER JOIN recipe_ingredient
  ON recipe.recipeID = recipe_ingredient.recipeID
  INNER JOIN ingredient
  ON recipe_ingredient.ingredientID = ingredient.ingredientID");

//Initialize array variable  
$dbdata = array();

//Fetch into associative array
 
while ( $row = $result->fetch_assoc())  {
  //$dbdata[]=$row;

  
  if(isset($recipeArray[$row['recipeID']])){

    $in['amount'] = $row['menge'];
    $in['unit'] = $row['mengenAngabe'];
    $in['name'] = $row['name'];

    array_push($recipeArray[$row['recipeID']]['ingredient'], $in  );
   
  }else{
    $in['amount'] = $row['menge'];
    $in['unit'] = $row['mengenAngabe'];
    $in['name'] = $row['name'];

    $recipeArray[$row['recipeID']]=array("name"=>$row['recipeName'],"recipeURL"=>$row['recipeImageURL'],"ingredient"=>[$in],"preperation"=>$row['preperation'],"duration"=>$row['duration'],"level"=>$row['level']);
  }

  
}

//Print array in JSON format
 echo json_encode($recipeArray);
 
?>