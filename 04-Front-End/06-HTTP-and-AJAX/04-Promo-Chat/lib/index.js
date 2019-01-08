const batch = 158; // change to your own batch id
const baseUrl = "https://wagon-chat.herokuapp.com/";

const content = document.getElementById("your-message");
const author = document.getElementById("your-name");
const list = document.getElementById("comment-list");
const refreshButton = document.getElementById("refresh");
const form = document.getElementById("comment-form");
const apiPath = `${baseUrl}${batch}/messages`;
// Your turn to code!

const showMessage = (event) => {
  event.preventDefault();
  const messageObject = {
    author: author.value,
    content: content.value
  };

  list.insertAdjacentHTML("afterbegin", `<li>${content.value} (posted <span class="date">9 minutes ago</span>) by ${author.value}</li>`);
  fetch(apiPath, {
    method: "POST",
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(messageObject)
  }).then(response => response.json()).then((data) => {
    console.log(data);
  });
};

const getMessages = (event) => {
  fetch(apiPath).then(response => response.json()).then((data) => {
    list.innerHTML = "";
    data.messages.forEach((message) => {
      list.insertAdjacentHTML("afterbegin", `<li>${message.content} (posted <span class="date">${Math.floor((Date.now() - new Date(message.created_at)) / (1000 * 60))}</span> minutes ago) by ${message.author}</li>`);
    });
  });
};

setInterval(getMessages, 1000);

form.addEventListener("submit", showMessage);
