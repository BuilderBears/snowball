function postSuggestion(){
  $.get('/suggestions/new', function(json){
    // the below comes from authorize in app_controller
    if (json.error == 'login'){
      jsLogin();
      $(window).on("login:success", function(){
        postSuggestion();
        window.location.reload();
      });
    } else {
      // window.location = 'topic/';
      // window.location.reload();
    }
  })  
}

$(function(){
  $("#new_suggestion").click(function(event){
    event.preventDefault();
    postSuggestion();
  })
})