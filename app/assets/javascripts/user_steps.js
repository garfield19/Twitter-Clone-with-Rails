var text_max = 200;
$('#count_message').html(text_max + ' remaining');

$('#user[about]').keyup(function() {
  var text_length = $('#user[about]').val().length;
  var text_remaining = text_max - text_length;
  
  $('#count_message').html(text_remaining + ' remaining');
});