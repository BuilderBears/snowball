function postSuggestion(){
  var data = {"suggestion_id":suggestion_id, "suggestion_url":suggestion_url, "suggestion_description":suggestion_description}
  $.get('/suggestions/new', function(json){
    // the below comes from authorize in app_controller
    if (json.error == 'login'){
      jsLogin();
      $(window).on("login:success", function(){
        postSuggestion();
      });
    } else {

      // take all form data and perform post to suggestions/create
    }
  })  
}

$(function(){
  $("#new_suggestion").click(function(event){
    event.preventDefault();
    postSuggestion($(this).data("suggestion_id", "suggestion_url", "suggestion_description"));
  })
})