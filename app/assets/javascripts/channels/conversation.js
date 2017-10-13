App.conversation = App.cable.subscriptions.create("ConversationChannel", {
  connected: function() {},
  disconnected: function() {},
  //search for a specified conversation, based on passed conversation_id,
  //and appended a HTML code within a message to a conversation window
  received: function(data) {
    var conversation = $('#conversations-list').find("[data-conversation-id='" + data['conversation_id'] + "']");

    // check if under the data[‘window’] we pass a partial.
    if (data['window'] !== undefined) {
      var conversation_visible = conversation.is(':visible');

      //check if a conversation’s window is visible
      if (conversation_visible) {
        var messages_visible = (conversation).find('.panel-body').is(':visible');

        if (!messages_visible) {
          //mark that we got a new message by marking a window as green
          conversation.removeClass('panel-default').addClass('panel-success');
        }
        //append a message partial to the window
        conversation.find('.messages-list').find('ul').append(data['message']);
      }
      else {      //just append a message partial
        $('#conversations-list').append(data['window']);
        conversation = $('#conversations-list').find("[data-conversation-id='" + data['conversation_id'] + "']");
        conversation.find('.panel-body').toggle();
      }
    }
    else {
      conversation.find('ul').append(data['message']);
    }

    var messages_list = conversation.find('.messages-list');
    var height = messages_list[0].scrollHeight;
    messages_list.scrollTop(height);
  },
  speak: function(message) {
    return this.perform('speak', {
      message: message
    });
  }
});
$(document).on('submit', '.new_message', function(e) {
  e.preventDefault();
  var values = $(this).serializeArray();
  App.conversation.speak(values);
  $(this).trigger('reset');
});

//Speak runs the speak method on the back-end
//sending the message object
