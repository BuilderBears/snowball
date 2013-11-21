function upvoteSuggestion(suggestion_id){
  var data = {"suggestion_id":suggestion_id}
  $.post('/topics_upvote_suggestion', data, function(json){
    // the below comes from authorize in app_controller
    if (json.error == 'login'){
      jsLogin();
      $(window).on("login:success", function(){
        upvoteSuggestion(suggestion_id);
      });
    } else {
      $('#upvotecountspan'+suggestion_id.toString()).html(json.upvote_count);
    }
  })
}

$(function(){
  $("input.upvote").click(function(){
    upvoteSuggestion($(this).data("suggestion-id"))
  })
})