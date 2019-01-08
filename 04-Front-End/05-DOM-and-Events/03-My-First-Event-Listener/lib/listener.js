const audio = new Audio('../sound.mp3');

const addSound = (event) => {
  const target = event.currentTarget;
  // Add disable class
  target.classList.add("disable");
  // Change text from click me to Bingo!
  target.innerText = "Bingo!";
  // Play mp3 sound in the browser
  audio.play();
};
// Select blueButton from document
const blueButton = document.getElementById("clickme");
// Add listener when click on the blue button
blueButton.addEventListener('click', addSound);
