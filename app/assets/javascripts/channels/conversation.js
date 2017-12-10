App.conversation = App.cable.subscriptions.create("ConversationChannel", {
  connected: function() {},
  disconnected: function() {},
  //search for a specified conversation, based on passed conversation_id,
  //and appended a HTML code within a message to a conversation window
  received: function(data) {
    if (data['command'] == 'tutor_picked')
    {
      if (document.querySelector('#incoming_requests table'))
      {
        var h = document.querySelector("#incoming_requests h1");
        h.innerHTML = "You have new requests!";
        var tb = document.querySelector('#incoming_requests table').children[0]
        tb.insertAdjacentHTML('afterend', data['tutoring_session']);
      } else {
        var a = document.querySelectorAll('#nav_container ul li')[0]; //notification when new request comes in
        a.firstChild.className = "btn btn-success";
      }
    }
    else if (data['command'] == 'tutor_accepted') {
      
      if (document.querySelector('#waiting_for_tutor')) {
        //var outer_frame = document.querySelector('#outer_frame');
        //var frame = document.querySelector('#frame');
        //frame.remove();
        //outer_frame.innerHTML = data['being_tutored'];

        $link = $('#messenger:first');
        $link[0].click();
        //add Location:
        var f = document.querySelector("#frame");
        //f.insertAdjacentHTML('beforebegin', data['tutor_response']);
      } else {

      }

    }
    else if (data['command'] == 'session_canceled') {
      alert("Session is canceled.");
      var row = document.querySelector("[data-tutee_id='" + data['tutee_id'] + "']");    //find and delete the row
      var table = document.querySelector('#table');
      if (table != null && table.contains(row)) { row.parentNode.removeChild(row); }

    }

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

    //*********** FIX_ME ***********
    //var messages_list = conversation.find('.messages-list');
    //var height = messages_list[0].scrollHeight;
    //messages_list.scrollTop(height);
    //*********** FIX_ME end ***********
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
