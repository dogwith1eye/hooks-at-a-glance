exports.subscribeToFriendStatus = function(id, handleStatusChange) {
  console.log("subscribed");
  var status = { isOnline: true };
  console.log(handleStatusChange);
  handleStatusChange(status);
};

exports.unsubscribeFromFriendStatus = function(id) {
  console.log("unsubscribed");
};
