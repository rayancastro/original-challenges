const table = document.getElementsByClassName("racer_table")[0];
const lapsOne = document.getElementById("laps_one");
const lapsTwo = document.getElementById("laps_two");

const countdown = () => {
  const timer = document.getElementById("timer");
  timer.innerText = parseInt(timer.innerText, 10) - 1;
  const pointsOne = parseInt(lapsOne.innerText, 10) + (table.rows[1].querySelector(".active").cellIndex / 10);
  const pointsTwo = parseInt(lapsTwo.innerText, 10) + (table.rows[3].querySelector(".active").cellIndex / 10);
  if (timer.innerText <= 0) {
    let result = "";
    if (pointsOne === pointsTwo) {
      result = "Its a tie!!";
    } else if (pointsOne > pointsTwo) {
      result = "Player one wins!!";
    } else {
      result = "Player two wins!!";
    }
    if (!alert(result)) { window.location.reload(); }
  }
};

setInterval(countdown, 1000);
let target;
let nextTarget;
document.onkeydown = (event) => {
  switch (event.keyCode) {
    case 39:
      target = table.rows[1].querySelector(".active");
      if (target.cellIndex < 9) {
        nextTarget = table.rows[1].cells[target.cellIndex + 1];
      } else {
        nextTarget = table.rows[1].cells[0];
        lapsOne.innerText = parseInt(lapsOne.innerText, 10) + 1;
      }
      target.classList.remove("active");
      nextTarget.classList.add("active");
      break;
    case 68:
      target = table.rows[3].querySelector(".active");
      if (target.cellIndex < 9) {
        nextTarget = table.rows[3].cells[target.cellIndex + 1];
      } else {
        nextTarget = table.rows[3].cells[0];
        lapsTwo.innerText = parseInt(lapsTwo.innerText, 10) + 1;
      }
      target.classList.remove("active");
      nextTarget.classList.add("active");
      break;
    default:
  }
};
