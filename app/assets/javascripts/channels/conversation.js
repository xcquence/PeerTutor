App.conversation = App.cable.subscriptions.create("ConversationChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    //after sending a message we received it here
    //We search for a specified conversation, based on passed conversation_id,
    //and appended a HTML code within a message to a conversation window and scroll to the bottom of it
    var conversation = $('#conversations-list').find("[data-conversation-id='" + data['conversation_id'] + "']");
    conversation.find('.messages-list').find('ul').append(data['message']);

    var messages_list = conversation.find('.messages-list');
    var height = messages_list[0].scrollHeight;
    messages_list.scrollTop(height);
  },

  //Speak runs the speak method on the back-end inside conversation_cahnnel.rb
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
