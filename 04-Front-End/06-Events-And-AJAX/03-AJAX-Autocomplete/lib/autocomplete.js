const results = document.getElementById("results");
const input = document.getElementById("search");

// TODO: Autocomplete the input with AJAX calls.

const fetchAutoComplete = (event) => {
  const fetchPath = `https://wagon-dictionary.herokuapp.com/autocomplete/${event.target.value}`;
  results.innerHTML = "";
  fetch(fetchPath).then(response => response.json()).then((data) => {
  // Do something once HTTP response is received
    data.words.forEach((word) => {
      results.insertAdjacentHTML("beforeend", `<li>${word}</li>`);
    });
  });
};

// const urlAPI = "https://wagon-dictionary.herokuapp.com/autocomplete/ca"


input.addEventListener("keyup", fetchAutoComplete);
