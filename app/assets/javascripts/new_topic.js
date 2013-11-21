// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function postTopic(){
  console.log("WTF PART 2")
  $.get('/bababababba', function(json){
    console.log("???????")
    // the below comes from authorize in app_controller
    if (json.error == 'login'){
      console.log("inside postTopic");
      jsLogin();
      $(window).on("login:success", function(){
        postTopic();
      });
    } else {
      $.get('/topics/new');
    }
  })  
}


$(function(){
  $("#new_topic").click(function(){
    console.log("WTF")
    postTopic()
  })
})
