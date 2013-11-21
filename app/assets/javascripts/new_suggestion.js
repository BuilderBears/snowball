function postSuggestion(){
  $.get('/suggestions/new', function(json){
    // the below comes from authorize in app_controller
    if (json.error == 'login'){
      jsLogin();
      $(window).on("login:success", function(){
        postSuggestion();
      });
    } else {
      window.location = 'suggestions/new'
    }
  })  
}

$(function(){
  $("#new_suggestion").click(function(event){
    event.preventDefault();
    postSuggestion();
  })
})