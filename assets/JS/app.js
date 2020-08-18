let allIngredients = [];
let selectedIngredients = [];
let ingredientJSON;
let dataBase;
$(document).ready(function () {
  console.log("Script loaded!");

  if('serviceWorker' in navigator){
    try {
      navigator.serviceWorker.register('serviceworker.js');
      console.log('ServiceWorker registered');
    } catch (error) {
      console.log('ServiceWorker registration failed');
      
    }
  }
 
  setTimeout(function(){
    console.log('TEST');
    $('#testDiv').css('display', 'flex');
 }, 1000); //11000
  
    
  openDb();
  slider();

  $('#loginButton').click(function(){
    $('#loginForm').css('display', 'flex');
    $('#signupForm').css('display', 'none');
  
  });
  
  $('#signUpButton').click(function(){
    console.log('signup');
    $('#loginForm').css('display', 'none');
    $('#signupForm').css('display', 'flex');
  
  });

  

  slider();
  $.ajax({
    url: 'getIngredients.php',
    // url: 'http://localhost/ResteApp/assets/JSON/items.json',
    type: 'POST',
      success: function (data){
        
        ingredientJSON = JSON.parse(data);
        getallIngredients(ingredientJSON);
        
  
      },
      error: function (xhr, status, error){
        let errorMessage = xhr.status + ':' + xhr.statusText 
        console.log('Error - ' + errorMessage);
      }
  });

});

function getallIngredients(ingredientJSON){
  let item;
  let selectedItem;

  for (let j = 0; j < ingredientJSON.length; j++) {
    // console.log(data[j]);
       allIngredients[j]= {
                              ingredientID: ingredientJSON[j]['ingredientID'],
                              name: ingredientJSON[j]['name'],
                              amount: ingredientJSON['mengenAngabe'],
                              iconURL: ingredientJSON[j]['iconURL'],
  };

      item = $("<div class='ingredient' data-id='" + ingredientJSON[j]['ingredientID'] + "' data-name='" + ingredientJSON[j]['name'].toLowerCase() +"'><img class='itemImage' src='assets/ICONS/" + ingredientJSON[j]['iconURL'] +"' alt='"+ ingredientJSON[j]['name'] +"'>" + ingredientJSON[j]['name'] + "</div>");
      
      $(item).click(function(){
        let ingredientName= $(this).text();
        let amount = 1;
        //console.log(ingredientID);
        selectedItem = $("<div class='ingredient' data-id='" + ingredientJSON[j]['ingredientID'] + "'><img class='itemImage' src='assets/ICONS/" + ingredientJSON[j]['iconURL'] +"' alt='"+ ingredientJSON[j]['name'] +"'><div class='amountEdit'>" + amount + " " +  ingredientJSON[j]['mengenAngabe'] +"</div>" + ingredientJSON[j]['name'] + "</div>");

        $(this).toggleClass('selected');

        if($(this).hasClass('selected')){
          $('#selectedIngredientList').append(selectedItem);
          selectedIngredients[ingredientName] = amount;
          addIngredient(ingredientName, 'ingredientList', ingredientJSON[j]['iconURL'], amount);
          
          console.log(selectedIngredients);
        }else if($(this).hasClass('ingredient')){
          let currentID = $(this).data('id');
          $('#selectedIngredientList').find('[data-id="'+ currentID +'"]').remove();
          removeIngredient(ingredientName, 'ingredientList');
          delete selectedIngredients[ingredientName];    
        }

 
      })
      $('#ingredientList').append(item);  
  }

 console.log(allIngredients);
 
};


function searchingIngredient(){
  
  $('#ingredientSearch').keyup(function(){
   // console.log('TEST');
    let inputValue = $(this).val().toLowerCase();
    
      $('#ingredientList .ingredient').each(function(){
        if($(this).data('name').indexOf(inputValue) <= -1){
          $(this).css('display', 'none');
        }else{
          $(this).css('display', 'flex');
        }
      });

    });
};

$('.footerNav').click(function(){

  let buttonID = $(this).attr('id');

  $('main > div.active').removeClass('active');
  $('.footerNav').removeClass("active");
  if($('#' + buttonID + 'Main').is(':empty')) {

    $('#' + buttonID + 'Main').load( buttonID + ".html", function() {
      //console.log('test');
      
      
      if(buttonID == 'home'){
          slider();
         
      }
      else if( buttonID == 'ingredient') {
          getallIngredients(ingredientJSON);
          
          searchingIngredient();
      }
      else if(buttonID == 'recipe'){
          
      }
      else if(buttonID == 'list'){
         

      }
      else if(buttonID == 'webuser'){
         
  
      }
    });

  }
  
  $('#' + buttonID + 'Main').addClass('active');
  $('#'+ buttonID).addClass("active");
 
});



//Opening a Database
function openDb(){
  // Open the database
  //parameters - database name and version number. - integer
  var request = indexedDB.open("Database", 6);
 
  //Generating handlers
  //Error handlers
  request.onerror = function(event) {
    console.log("Error: ")
  };
  //OnSuccess Handler
  request.onsuccess = function(event) {
       console.log("Success: ")

       dataBase = event.target.result
       console.log(dataBase);

       if(dataBase){
        dataBase.transaction(["ingredientList"], "readwrite").objectStore('ingredientList').getAll().onsuccess = function(e) {
          console.log(e.target.result);
          
          e.target.result.forEach(function(ingredient , value){
            console.log(ingredient.name);
           selectedItem = $("<div class='ingredient' data-name='"+ ingredient.name.toLowerCase() +"'><img class='itemImage' src='assets/ICONS/" + ingredient.url +"' alt='"+ ingredient.name +"'><div>"+ ingredient.amount +"</div>"+ ingredient.name +"</div>");
           listElement = $('<div class="myIngredientList"><div class="myIngredient" data-name=" '+ ingredient.name.toLowerCase() + '">' + ingredient.name + '</div><input type="number" placeholder="Menge eingeben"></div>');
           $('#selectedIngredientList').append(selectedItem);
           $('#myIngredientContainer').append(listElement);
           // console.log(data('name'));  
           $('#ingredientList').find('[data-name="'+ ingredient.name.toLowerCase() +'"]').addClass('selected');

          });
        };
       }
       
   };
    
    //OnUpgradeNeeded Handler
  request.onupgradeneeded = function(event) { 
    console.log("On Upgrade Needed")
       
    dataBase = event.target.result;
    console.log(dataBase);
      // Create an objectStore for this database
      //Provide the ObjectStore name and provide the keyPath which acts as a primary key
    
        var objectStore = dataBase.createObjectStore("ingredientList", {keyPath: 'name', autoIncrement: false });
  };

 
  
}

//Simple function to get the ObjectStore
//Provide the ObjectStore name and the mode ('readwrite')
function getObjectStore(store_name, mode) {
  console.log(dataBase);
  var tx = dataBase.transaction(store_name, mode);
  return tx.objectStore(store_name);
}

//Adding to the Database
function addIngredient(ingredientName, store_name, URL) {
  var obj = { name: ingredientName, amount: "1", url: URL };
  var store = getObjectStore(store_name, 'readwrite');
  var req;
  try {
    req = store.add(obj);
  } catch (e) {
    throw e;
  }
  req.onsuccess = function (evt) {
    console.log("Insertion in DB successful");
  };
  req.onerror = function() {
    console.log("Insertion in DB Failed ", this.error);
  };
}


//Removing from the Database
function removeIngredient(ingredientName, store_name) {
  var store = getObjectStore(store_name, 'readwrite');
  var req;
  try {
    req = store.delete(ingredientName);
  } catch (e) {
    throw e;
  }
  req.onsuccess = function (evt) {
    console.log("Remove from DB successful");
  };
  req.onerror = function() {
    console.log("Remove from DB Failed ", this.error);
  };
};


function slider(){
  $('.bxslider').bxSlider({
    speed: 300,
    auto: true,
    autoControls: false,
    pager: false,
    controls: false,
    mode: 'fade',
    infiniteLoop:  true,
    
});


};

