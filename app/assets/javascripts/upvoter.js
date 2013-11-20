// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// function upvoteValidation(response_id){
//   if (session["user_id"]){
//     console.log("can't vote; login first")
//   } else {
//     upvoteResponse(response_id, session["user_id"]);
//   }
// }

function upvoteResponse(response_id){
  var data = {"response_id":response_id}
  $.post('/concerns_upvote_response', data, function(json){
    if (json.error == 'login'){
      jsLogin();
    } else {
      $('#upvotecountspan'+response_id.toString()).html(json.upvote_count);
    }
  })
}

$(function(){
  $("input.upvote").click(function(){
    upvoteResponse($(this).data("response-id"))
  })
})