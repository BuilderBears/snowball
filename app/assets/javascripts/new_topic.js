function postTopic(){
  $.get('/topics/new', function(json){
    // the below comes from authorize in app_controller
    if (json.error == 'login'){
      jsLogin();
      $(window).on("login:success", function(){
        postTopic();
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