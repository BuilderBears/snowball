function jsLogin(){
  // fire a get request to load the form
  // gets a script in views/sessions that starts with 'new'.. 
  // goes to new.js.erb and runs it

  $.getScript("/sessions/new")

  // inject the form into the dom as a modal
}