
$(document).ready(function () {

    $('#signUp').click(function(event) {
        
        event.preventDefault();
        var data = {username: $('#userName').val(), password: $('#signupPassword').val(), email: $('#signupEmail').val()};
        
        $.ajax({
            type: "POST",
            data: data,
            url: 'register.php',
            success: function(data) {
                console.log(data);
                if(data.trim() == false) {
                    alert('Opps, something went wrong! Please try again!')
                    window.location.href="http://localhost/ResteApp/index.html";
                }  
                else{
                    //sessionStorage.setItem('username', data[0]);
                    window.location.href="http://localhost/ResteApp/start.html"; 
    
                    
                }
            },
            error: function(error) {
                console.log(error);
            }
        }); 
      });




    $('#login').click(function(event) {
        event.preventDefault();
        //console.log("TEST");
        var self = $(this);
        //console.log($(this).text());
        var data = {email: $('#loginEmail').val(), password: $('#loginPassword').val()};
       
        $.ajax({
            type: "POST",
            data: data,
            url: 'check_login.php',
            success: function(data) {
                $('#failed_login').text(""); 
                if(data == 'true') {
                    window.location.href="http://localhost/Notizbuch/notes.php";  
                }
                else{
                    $('#failed_login').append("<h2>USERNAME ODER PASSWORT STIMMT NICHT!</h2>");
                    $('#failed_login').append('<form><input type="submit" id="forgotten_password" value="Passwort vergessen"</form>');    
                };  
            },
            error: function(error) {
                //console.log(error);       
            }
        });
    });
    
    
    $('#signup_user').keyup(function(){
        $('#failed').empty();
        //console.log("TEST");
        var user = $(this);
        var data = {username: $(this).val()};
        $.ajax({
            type: "POST",
            data: data,
            url: 'checkuser.php',
            success: function(data) {
                //console.log(data);
                $('#userTaken').text(""); 
                if(data == 'true') {
                    $(user).css('color', 'red');
                    $('#userTaken').append("<h2>Benutzername schon vergeben!</h2>");
                    usertaken = true;   
                }
                else {
                    $(user).css('color', '#26a849');
                    $('#userTaken').text("");
                    
                };
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
    
    
    
    
    $("#signup_password2").keyup(function(){
            
        if($('#signup_password').val() != $(this).val()){
            $(this).css('color', 'red');
        }
        else{
            $(this).css('color', 'green');
        };   
    });
    
    
    
    
    $('#signup_user').keyup(function(){
        $('#failed').empty();
        //console.log("TEST");
        var user = $(this);
        var data = {username: $(this).val()};
        $.ajax({
            type: "POST",
            data: data,
            url: 'checkuser.php',
            success: function(data) {
                //console.log(data);
                $('#userTaken').text(""); 
                if(data == 'true') {
                    $(user).css('color', 'red');
                    $('#userTaken').append("<h2>Benutzername schon vergeben!</h2>");
                    usertaken = true;   
                }
                else {
                    $(user).css('color', '#26a849');
                    $('#userTaken').text("");
                    
                };
            },
            error: function(error) {
                console.log(error);
            }
        });
    });





});








