// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function upvoteResponse(response_id, user_id){
  var data = {"response_id":response_id, "user_id":user_id}
  $.post('/concerns_upvote_response', data, function(new_upvote_count){
    $('#upvotecountspan'+response_id.toString()).html(new_upvote_count);
  })
}
