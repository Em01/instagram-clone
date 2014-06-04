$(document).ready(function(){
  $('.like-btn').on('click', function(event){
    event.preventDefault();
    // event.stopPropagation();
    $.post(this.href);
  });
})