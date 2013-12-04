function postSuggestion(){
  $.get('/suggestions/new', function(json){
    // the below comes from authorize in app_controller
    if (json.error == 'login'){
      jsLogin();
      $(window).on("login:success", function(){
        window.location.reload();
      });
      $(window).on("login:failure", function(){
        alert("email or password is incorrect");
      });
    }
  })  
}

$(function(){
  $("#new_suggestion").click(function(event){
    event.preventDefault();
    postSuggestion();
  })
})