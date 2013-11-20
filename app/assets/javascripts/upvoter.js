// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function upvoteResponse(response_id){
  var data = {"response_id":response_id}
  $.post('/concerns_upvote_response', data, function(new_upvote_count){
    $('#upvotecountspan'+response_id.toString()).html(new_upvote_count);
    console.log(new_upvote_count);
  })
}

//each upvote is an instance so hitting the upvote button makes a new instance of upvote as per the reponse_id

//how to figure out who upvotes what?