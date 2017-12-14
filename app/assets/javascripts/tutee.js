(function() {
  $(document).on('change', '#subjects_select', function() {
    return $.ajax({
      type: 'GET',
      url: '/tutee/get_courses',
      data: {
        subject_id: $(this).val()
      }
    }).done(function(data) {
      return $('.course-area').html(data);
    });
  });

}).call(this);

window.onload = function () {

  if (document.querySelector("#messenger_link")) {
      document.querySelector("#messenger_link").addEventListener("click", function() {
        var incoming_requests_link = document.querySelector("#messenger_notify")
        $(incoming_requests_link).removeClass('notify');
      });
  }
}

$(document).ready(
  function () {
  $(document).on('click', '#PayButton',
    function()
        {
          alert("You clicked the new button")
        }
      )
    }
  )




  // document.querySelector("#messenger_link").addEventListener("click", function() {
  //
  //   // var incoming_requests_link = document.querySelector("#incoming_requests_notify")
  //   // jQuery(incoming_requests_link).removeClass('notify');
  // });

// window.onload = function () {
//   //cahnge incoming_requests from green to regular when clicked:
//   alert("works1");
//   if (document.querySelector("#messenger_link")) {
//     document.querySelector("#messenger_link").addEventListener("click", function() {
//       alert("works");
//       // var incoming_requests_link = document.querySelector("#incoming_requests_notify")
//       // jQuery(incoming_requests_link).removeClass('notify');
//     });
//
//   }
