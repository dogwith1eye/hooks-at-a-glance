exports.subscribeToFriendStatus = function(id, handleStatusChange) {
  console.log("subscribed");
  var online = { isOnline: true };
  console.log("online");
  handleStatusChange(online);
  setTimeout(function() {
    var offline = { isOffline: true };
    console.log("offline");
    handleStatusChange(offline);
  }, 2000);
};

exports.unsubscribeFromFriendStatus = function(id) {
  console.log("unsubscribed");
};
