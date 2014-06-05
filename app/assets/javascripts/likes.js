$(document).ready(function(){
  $('.like-btn').on('click', function(event){
    event.preventDefault();
    // event.stopPropagation();
    $.post(this.href);
  });

  var connection = new WebSocketRails('localhost:3000/websocket');
  channel = connection.subscribe('likes');
  channel.bind('new', function(resp) {
    var postElem = $('.post[data-id=' + post.id + '] .like-btn')
    postElem.text('♡ ' + post.new_like_count);
  });
})