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
  const inbox = document.getElementById("inbox")
  inbox.insertAdjacentHTML('beforeEnd', `<div class="row message unread"><div class="col-xs-3">${message.sender}</div><div class="col-xs-9">${message.subject}</div></div>`);
}

function refresh() {
  // TODO: Implement the global refresh logic. If there is a new message,
  //       append it to the DOM. Update the unread counter in title as well.
  if (hasNewMessage()) {
    let countElement = document.getElementById("count");
    let count = countElement.innerText;
    countnum = parseInt(count.substr(1,count.length - 2), 10)
    appendMessageToDom(newMessage());
    countnum += 1;
    countElement.innerText = `(${countnum})`;
  }
}

















// Do not remove these lines:
document.addEventListener("DOMContentLoaded", () => {
  setInterval(refresh, 1000); // Every 1 second, the `refresh` function is called.
});

module.exports = { hasNewMessage, newMessage };
