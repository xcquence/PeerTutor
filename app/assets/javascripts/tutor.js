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

//cahnge incoming_requests from green to regular when clicked:
window.onload = function () {
  if (document.querySelector("#incoming_requests_link")) {
    document.querySelector("#incoming_requests_link").addEventListener("click", function() {
      //alert("works");
      var incoming_requests_link = document.querySelector("#incoming_requests_link")
      incoming_requests_link.classList = "btn";
    });;
  }
}
