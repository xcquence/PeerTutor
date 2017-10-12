App.conversation = App.cable.subscriptions.create("ConversationChannel", {
  //perform the same actions as on back-end but this time on the front-end
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  //perform the same actions as on back-end but this time on the front-end
  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  //when we want to render a partial from the back-end
  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
  },

  speak: function() {
    return this.perform('speak');
  }
});
