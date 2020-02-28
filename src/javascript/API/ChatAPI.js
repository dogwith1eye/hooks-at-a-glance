const ChatAPI = {
  subscribeToFriendStatus(id, handleStatusChange) {
    console.log("subscribed");
    var status = { isOnline: true };
    handleStatusChange(status);
  },
  unsubscribeFromFriendStatus(id, handleStatusChange) {
    console.log("unsubscribed");
  }
};

export default ChatAPI;
