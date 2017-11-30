# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change', '#subjects_select_tutor', ->
  #  alert($(this).val())  # checking
  $.ajax(
    type: 'GET'      #get data from url  ('POST - send data to url')
    url: '/tutor/get_courses'  #where you get data from
    data: {
      subject_id: $(this).val()
    }
  ).done (data) ->
    $('.course-area-tutor').html(data)


$(document).on 'change', '#course_select_tutor', ->
  # alert($(this).val())  # checking
  $.ajax(
    type: 'GET'      #get data from url  ('POST - send data to url')
    url: '/tutor/get_tags'  #where you get data from
    data: {
      course_id: $(this).val()
    }
  ).done (data) ->
    $('.tutor-classes-field').append(data)
