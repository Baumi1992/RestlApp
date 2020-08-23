let allIngredients = [];
let selectedIngredients = [];
let ingredientJSON;
let recipeJSON;
let dataBase;
let userJSON;
let currentUser;
let currentEmail;
let amount;
$(document).ready(function () {
    openDb();
    if('serviceWorker' in navigator){
        try {
            navigator.serviceWorker.register('serviceworker.js');
            console.log('ServiceWorker registered');
        } catch (error) {
            console.log('ServiceWorker registration failed');
        }
    };

    // ------------------- FETCH INGREDIENTS FROM SQL-DATABASE -------------------- //
    $.ajax({
        url: 'getIngredients.php',
        // url: 'http://localhost/ResteApp/assets/JSON/items.json',
        type: 'POST',
        success: function (data){
        ingredientJSON = JSON.parse(data);
        //getallIngredients(ingredientJSON);
        },
        error: function (xhr, status, error){
        let errorMessage = xhr.status + ':' + xhr.statusText 
        console.log('Error - ' + errorMessage);
        }
    });

    $('#loader').load( "loader.html");
    searchingIngredient();
    setTimeout(function(){
    console.log('TEST');
    $('#popUp').css('display', 'flex');
    }, 1000); //11000
    
    // ------------------- SHOW LOGINFORM -------------------- //
    $('html').on("click", "#loginButton", function(){
        $('#loginForm').css('display', 'flex');
        $('#signupForm').css('display', 'none');
    });
    
    // ------------------- SHOW SIGNUPFORM -------------------- //
    $('html').on("click", "#signUpButton", function(){
        console.log('signup');
        $('#loginForm').css('display', 'none');
        $('#signupForm').css('display', 'flex');
    });

    // ------------------- CHANGE CONTENT BY CLICKING FOOTERBUTTON -------------------- //
    $('.footerNav').click(function(){
        let buttonID = $(this).attr('id');

        $('main > div.active').removeClass('active');
        $('.footerNav').removeClass("active");
        $('#' + buttonID + 'Main').addClass('active');

        if($('#' + buttonID + 'Main').is(':empty')) {

            let loaded = $('#' + buttonID + 'Main').load( buttonID + ".html", function() {
            //console.log('test');
                if( buttonID == 'ingredient') {
                    getallIngredients(ingredientJSON);
                    searchingIngredient();
                }
                else if(buttonID == 'recipe'){
                    getallRecipes();
                    searchingRecipe(loaded);
                }
                else if(buttonID == 'list'){   
                }
                else if(buttonID == 'webuser'){
                   $('#userWelcome').append("Hi, " + currentUser + "");      
                        
                }
            });    
        }
        $('#' + buttonID + 'Main').addClass('active');
        $('#'+ buttonID).addClass("active");
    });

    // ------------------- REGISTER NEW USER -------------------- //
    $('html').on("click", "#signUp", function(event) {
        event.preventDefault();
        var data = {username: $('#userName').val(), password: $('#signupPassword').val(), email: $('#signupEmail').val(), login: 'false'};
        
        $.ajax({
            type: "POST",
            data: data,
            url: 'authentication.php',
            success: function(data) {
                $('#signupForm').append("<h3>Erfolgreich registriert!</h3>");
            },
            error: function(error) {
                console.log(error);
                alert('Opps, something went wrong! Please try again!')
                    window.location.href="http://localhost/ResteApp/index.html";
            }
        }); 
    });

    $('html').on("click", "#changeButton", function(event) {
        event.preventDefault();
        var data = {username: $('#userWelcome').text(), email: currentEmail , newUsername: $('#changeUser').val()/*, newPassword: $('#changePassword')*/};
        console.log(currentUser);
        console.log(typeof currentUser);
        $.ajax({
            type: "POST",
            data: data,
            url: 'changeUsername.php',
            success: function(data) {
                console.log(data);
                    currentUser = data;
                    console.log(currentUser);
                    console.log(currentUser.username);
                $('#changeText').empty();
                $('#changeText').append("Username erfolgreich geändert!");
                $('#userWelcome').empty();  
                $('#userWelcome').append("Hi, " + currentUser + "");  
            },
            error: function(error) {
                console.log(error);
                alert('Opps, something went wrong! Please try again!')
                    //window.location.href="http://localhost/ResteApp/index.html";
            }
        }); 
    });

    $('html').on("click", "#logout", function(event) {
        location.reload();
       
    });




    $('html').on("keyup", "#signupEmail", function() {
        $('#failed').empty();
        console.log("SIGNUPTEST");
        var user = $(this);
        var data = {email: $(this).val()};
        $.ajax({
            type: "POST",
            data: data,
            url: 'checkuser.php',
            success: function(data) {
                //console.log(data);
                $('#userTaken').text(""); 
                if(data == 'true') {
                    $(user).css('color', 'red');
                    $('#userTaken').append("<p>E-Mail schon vergeben!</p>");
                    $('#signUp').attr('disabled', true);
                    usertaken = true;   
                }
                else {
                    $(user).css('color', '#26a849');
                    $('#userTaken').text("");
                    $('#signUp').attr('disabled', false);
                };
            },
            error: function(error) {
                console.log(error);
            }
        });
    });

    $('html').on("keyup", "#signupPassword2", function() {
        $('#password').text("");
        if($('#signupPassword').val() != $(this).val()){
            $(this).css('color', 'red');
            $('#password').append("<p>Passwort nicht ident!</p>");
        }
        else{
            $(this).css('color', 'green');
            $('#password').text("");
        };   
    });

    $('html').on("click", ".selectedIngredient", function() {
        let name = $(this).data('name');
        console.log('EDID CLICKED');
        $('#popUpEdit').css('display', 'flex');
        $('.name').empty();
        $('.name').append("<div class='name'>"+ name +"</div>");
        


    });

    $('html').on("click", "#settings", function() {
        
        console.log('Settings CLICKED');
        $('#popUpChange').css('display', 'flex');
        // $('.name').empty();
        // $('.name').append("<div class='name'>"+ name +"</div>");
        


    });

    $('html').on("click", ".popup_close", function(event){
        $('#popUpEdit').css('display', 'none');
        $('#popUpChange').css('display', 'none');

    });

    $('html').on("click", "#editButton", function(event){
        event.preventDefault();
        console.log('SAVED');

        if($('#amountInput').val() != ""){
            amount = $('#amountInput').val();
            $('.amount').empty();
            $('.amount').append(amount);
        }

        $('#popUpEdit').css('display', 'none');
        
        
    });


    // ------------------- USER LOGIN -------------------- //
    $('html').on("click", "#login", function(event) {
        event.preventDefault();
        //console.log("TEST");
        var self = $(this);
        //console.log($(this).text());
        var data = {username: "", email: $('#loginEmail').val(), password: $('#loginPassword').val(), login: 'true'};
        $.ajax({
            type: "POST",
            data: data,
            url: 'authentication.php',
            success: function(data) {
                console.log(data);
                $('#failed_login').text(""); 
                
                if(data != "0"){
                    userJSON = JSON.parse(data);
                    console.debug(userJSON);
                    $('#failed_login').text(""); 
                
                    console.log(typeof data);
                    $('#ingredientMain').load("ingredient.html", function() {
                        $('header, footer').css('display', 'flex');
                        $('#ingredientMain').addClass("active"); 
                        $('#loader').removeClass("active"); 
                        getallIngredients(ingredientJSON);
                    });

                    currentUser = userJSON[0];
                    currentEmail = userJSON[1];
                    console.log(currentUser);
                    console.log(currentEmail);

                }else {
                    $('#failed_login').append("<p>USERNAME ODER PASSWORT STIMMT NICHT!</p>");
                    $('#loginFormButton').append('<input type="submit" id="forgotten_password" value="Passwort vergessen">');  
                }
            },
            error: function(error) {
                console.log(error);   
            }
        });
    });
});

function getallIngredients(ingredientJSON){
    
    console.log('ingredients loaded');
    let item;
    let selectedItem;
    console.log(ingredientJSON);
    for (let j = 0; j < ingredientJSON.length; j++) {
        allIngredients[j]= {
                                ingredientID: ingredientJSON[j]['ingredientID'],
                                name: ingredientJSON[j]['name'],
                                amount: ingredientJSON['mengenAngabe'],
                                iconURL: ingredientJSON[j]['iconURL'],
    };
        item = $("<div class='ingredient' data-id='" + ingredientJSON[j]['ingredientID'] + "' data-name='" + ingredientJSON[j]['name'].toLowerCase() +"'><img class='itemImage' src='assets/ICONS/" + ingredientJSON[j]['iconURL'] +"' alt='"+ ingredientJSON[j]['name'] +"'>" + ingredientJSON[j]['name'] + "</div>");
        
        $(item).click(function(){
            let ingredientName= $(this).text();
            
            //console.log(ingredientID);
            selectedItem = $("<div class='selectedIngredient' data-id='" + ingredientJSON[j]['ingredientID'] + "' data-name='"+ ingredientJSON[j]['name'] +"'><img class='itemImage' src='assets/ICONS/" + ingredientJSON[j]['iconURL'] +"' alt='"+ ingredientJSON[j]['name'] +"'><div class='amountEdit'><div class='amount'>1 </div><div class='unit'>"+ " " +  ingredientJSON[j]['mengenAngabe'] +"</div></div>" + ingredientJSON[j]['name'] + "</div>");

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

    $('html').on("keyup", '#ingredientSearch', function() {
    
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
};

//Simple function to get the ObjectStore
//Provide the ObjectStore name and the mode ('readwrite')
function getObjectStore(store_name, mode) {
    console.log(dataBase);
    var tx = dataBase.transaction(store_name, mode);
    return tx.objectStore(store_name);
}

//Adding to the Database
function addIngredient(ingredientName, store_name, URL, amount) {
    var obj = { name: ingredientName, amount: amount, url: URL };
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
};

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

function getallRecipes(){
    $.ajax({
        type: "POST",
        url: 'getallRecipes.php',
        success: function(data) {
            console.log(data);
            recipeJSON = JSON.parse(data);
            console.log(recipeJSON);
            jQuery.each(recipeJSON, function() {
                    console.log(this);
                    recipe = this;
                    recipeElement = "<div class='recipe' data-name='" + recipe.name.toLowerCase()+"'>"
                                        +"<div class='recipeHead'>"
                                            +"<img class='recipeImage' src='assets/RECIPEIMAGES/" + recipe.recipeURL +"' alt='"+ recipe.name +"'>"
                                            +"<div>"
                                                +"<p class='recipeTitle'>"+ recipe.name +"</p>"
                                                +"<p class='recipeDetails'>Dauer: " + recipe.duration +" min</p>"
                                                +"<p class='recipeDetails'>Schwierigkeit: " + recipe.level+"</p>"
                                            +"</div>"
                                        +"</div>"
                                        +"<div class='recipeIngredient'>"
                                            +"<ul>";
                                        console.log(recipe.ingredient)
                                        for(let i = 0; i < recipe.ingredient.length; i++) {
                                            recipeElement += "<li>"+ recipe.ingredient[i] +"</li>";
                                        }
                    recipeElement +=        "</ul>"
                                        +"</div>"
                                        +"<div class='recipePreperation'>"+ recipe.preperation +"</div>"
                                    +"</div>";
                    $('#recipeList').append(recipeElement); 
            }); 
        },
        error: function(error) {
            console.log(error); 
        }
    });
}

function searchingRecipe(element){
    
    $(element).on("keyup", function() {
        console.log('recipe');  
        let inputValue = $('#recipeSearch').val().toLowerCase();
        $('#recipeList .recipe').each(function(){
        if($(this).data('name').indexOf(inputValue) <= -1){
            $(this).css('display', 'none');
        }else{
            $(this).css('display', 'flex');
        }
        });
    });
};







