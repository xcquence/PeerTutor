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


alert("HELLO");
