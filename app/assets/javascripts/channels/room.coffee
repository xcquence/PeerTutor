App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->                           #Called when the subscription is ready for use on the server


  disconnected: ->                        #Called when the subscription has been terminated by the server


  received: (data) ->                     #Called when there's incoming data on the websocket for this channel
    unless data.content.blank?
      $('#messages-table').append '<div class="message">' +
        '<div class="message-user">' + data.username + ":" + '</div>' +
        '<div class="message-content">' + data.content + '</div>' + '</div>'
      scroll_bottom()                     #scrolls to the latest message after new message is submited


$(document).on 'turbolinks:load', ->      #wait for page to load fully
  submit_message()
  scroll_bottom()                         #scrolls to the latest message on initial load of the page


######################### HELPER FUNCTIONS:  #########################

submit_message = () ->                    #executes if any key is pressed in element with id="message_content"
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13                #13 corresponds to "Enter" key
      $('input').click()                  #Click to submit the form.
      event.target.value = ""             #clear text from the input box
      event.preventDefault()              #prevent adding a newline by default



scroll_bottom = () ->                     #forces the browser to scroll up (height of the #messages div)
  $('#messages').scrollTop($('#messages')[0].scrollHeight)



#For scroll bottom function to work CSS needs to be updated. (overflow: auto)
