(function() {
  $(document).on('change', '#subjects_select_tutor', function() {
    return $.ajax({
      type: 'GET',
      url: '/tutor/get_courses',
      data: {
        subject_id: $(this).val()
      }
    }).done(function(data) {
      return $('.course-area-tutor').html(data);
    });
  });

  $(document).on('change', '#course_select_tutor', function() {
    return $.ajax({
      type: 'GET',
      url: '/tutor/get_tags',
      data: {
        course_id: $(this).val()
      }
    }).done(function(data) {
      return $('.tutor-classes-field').append(data);
    });
  });

}).call(this);


window.onload = function () {
  //cahnge incoming_requests from green to regular when clicked:
  if (document.querySelector("#incoming_requests_link")) {
    document.querySelector("#incoming_requests_link").addEventListener("click", function() {
      //alert("works");
      var incoming_requests_link = document.querySelector("#incoming_requests_notify")
      jQuery(incoming_requests_link).removeClass('notify');
    });;

  }

  //change currently_tutoring to green when tutor accept request
  else if (document.querySelector("#accept")) {
    document.querySelector("#accept").addEventListener("click", function() {
      var a = document.querySelector('#currently_tutoring_notify');
      a.classList.add('notify');
    });
  }

  else if (document.querySelector("#currently_tutoring_link")) {
    document.querySelector("#currently_tutoring_link").addEventListener("click", function() {
      //alert("works");
      var incoming_requests_link = document.querySelector("#currently_tutoring_notify")
      jQuery(incoming_requests_link).removeClass('notify');
    });
  }


  //turn on the live button
  $bulb = $( "#live_btn" );
  $bulb.click(function(e) {
    e.preventDefault();
    if ($bulb.data().status == 'off') {
      $bulb.data().status = 'on'
      $bulb.attr('src', 'https://vignette.wikia.nocookie.net/battlefordreamisland/images/6/6f/Lightbulb.png/revision/latest/scale-to-width-down/278?cb=20161222154836');
    } else {
      $bulb.data().status = 'off'
      $bulb.attr('src', 'http://images.clipartpanda.com/light-bulb-png-MiLxq9oyT.png');
    }
  });


}
