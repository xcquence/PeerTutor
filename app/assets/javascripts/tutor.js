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
  var incoming_requests_link = document.querySelector("#incoming_requests_link");
  if (incoming_requests_link != null) {
  incoming_requests_link.onclick = function() {
    incoming_requests_link.classList = "btn"
  }}
}
