function postTopic(){
  $.get('/topics/new', function(json){
    // the below comes from authorize in app_controller
    if (json.error == 'login'){
      jsLogin();
      $(window).on("login:success", function(){
        postTopic();
      });
      $(window).on("login:failure", function(){
        console.log("we triggered login failure")
        console.log(json)
        alert("email or password is incorrect");
        // above alert is a hack, do below:
        // AJAX-refresh modal with flash message
      });
    } else {
      window.location = '/topics/new';
    }
  })  
}

$(function(){
  $("#new_topic").click(function(event){
    event.preventDefault();
    postTopic();
  })
})
