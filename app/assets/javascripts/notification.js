//change currently_tutoring to green when tutor clicked accept
$('.container_box').on('click','#accept', function(){
  var a = document.querySelector('#currently_tutoring_notify');
  if (a) {
    $(a).addClass('notify');
  }
});

//change currently_tutoring from green to regular when clicked:
$('.row').on('click', '#currently_tutoring_link', function() {
  var incoming_requests_link = document.querySelector('#currently_tutoring_notify');
  $(incoming_requests_link).removeClass('notify');
});
