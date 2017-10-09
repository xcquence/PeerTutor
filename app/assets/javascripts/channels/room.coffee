App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.content.blank?
      $('#messages-table').append '<div class="message">' +
        '<div class="message-user">' + data.username + ":" + '</div>' +
        '<div class="message-content">' + data.content + '</div>' + '</div>'
    # Called when there's incoming data on the websocket for this channel


$(document).on 'turbolinks:load', ->      #wait for page to load fully
  submit_message()

submit_message = () ->                    #executes if any key is pressed in element with id="message_content"
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13                #13 corresponds to "Enter" key
      $('input').click()                  #Click to submit the form.
      event.target.value = ""             #clear text from the input box
      event.preventDefault()              #prevent adding a newline by default
