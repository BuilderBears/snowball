// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// function upvoteValidation(suggestion_id){
//   if (session["user_id"]){
//     console.log("can't vote; login first")
//   } else {
//     upvoteSuggestion(suggestion_id, session["user_id"]);
//   }
// }

function upvoteSuggestion(suggestion_id){
  var data = {"suggestion_id":suggestion_id}
  $.post('/topics_upvote_suggestion', data, function(json){
    // the below comes from authorize in app_controller
    if (json.error == 'login'){
      jsLogin();
      $(window).on("login:success", function(){
        console.log("just fired login success")
        upvoteSuggestion(suggestion_id);
      });
    } else {
      $('#upvotecountspan'+suggestion_id.toString()).html(json.upvote_count);
    }
  })
}

$(function(){
  $("button.upvote").click(function(){
    upvoteSuggestion($(this).data("suggestion-id"))
  })
})