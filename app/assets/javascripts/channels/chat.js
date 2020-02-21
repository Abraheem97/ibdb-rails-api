App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
    console.log('connected to action cable')
  },

  disconnected: function() {

  },

  received: function(data) {
    alert('sent')
    var messages = $('#comment_pane');
    messages.prepend(data['message']);
  }

});

// ---
// generated by coffee-script 1.9.2