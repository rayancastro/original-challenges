/* eslint-disable no-multiple-empty-lines */

function hasNewMessage() {
  // TODO: return true with a probability of 20%.
  if (Math.floor(Math.random() * 100) <= 20) {
    return true;
  }
  return false;
}

function newMessage() {
  // TODO: return a random message as an object with two keys, subject and sender
  const senders = ['Wagon', 'GitHub Team', 'HortaLab', 'CapsCorp', 'Wayne Ent.'];
  const company = senders[Math.floor(Math.random() * senders.length)];
  return {
    sender: company,
    subject: `Welcome to ${company}`
  };
}

function appendMessageToDom(message) {
  // TODO: append the given message to the DOM (as a new row of `#inbox`)

}

function refresh() {
  // TODO: Implement the global refresh logic. If there is a new message,
  //       append it to the DOM. Update the unread counter in title as well.
}

















// Do not remove these lines:
document.addEventListener("DOMContentLoaded", () => {
  setInterval(refresh, 1000); // Every 1 second, the `refresh` function is called.
});

module.exports = { hasNewMessage, newMessage };
