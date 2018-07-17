/* eslint-disable no-multiple-empty-lines */
/* eslint-disable prefer-const */

// INSTRUCTIONS - PLEASE READ!!
// Here are some challenges. Solve them from top to bottom

// **Each time** you complete a challenge, please commit and push!
// This is a good practise. Each time you make some progress in software
// development, you want to save a snapshot.


module.exports = function runChallenges(check) {
  // Ex 1. Read what's written in the email input
  //       Make the function getEmail() return it
  function getEmail() {
    // TODO: return the email
    let emailInput = document.getElementById("email");
    return emailInput.value;
  }


  // Ex 2. Change the content of the email input by writing your own email address
  let emailInput = document.getElementById("email");
  emailInput.value = "rayancdc@gmail.com";

  // Ex 3. Replace the email hint (next to the input) with 'This is my email now'
  //       The text should be emphasized using a <strong> tag
  let emailHint = document.getElementById("email-hint");
  emailHint.innerHTML = "This is my email now"


  // Ex 4. Add the .blue CSS class to the table header cells (th elements)
  const tableHeader = document.querySelectorAll("th");
  tableHeader.forEach((th) => {
    th.classList.add("blue");
  });

  // Ex 5. Count the number of table body rows there are
  //       Make the function countTeam() return it
  function countTeam() {
    // TODO: return the number of team
    const tableRows = document.querySelectorAll("tbody tr");
    return tableRows.length;
  }


  // Ex 6. Say there is a 15th team added to the table.
  //       Add a row at the bottom, this new team should have zero points.
  let table = document.querySelector("tbody");
  let newrow = table.appendChild(document.createElement('tr'));
  let newrank = document.createElement('td')
  let t = document.createTextNode("15");
  newrank.appendChild(t);
  let newname = document.createElement('td');
  let t2 = document.createTextNode("The Unstoppable Chaves");
  newname.appendChild(t2);
  let newpoints = document.createElement('td')
  let t3 = document.createTextNode("0");
  newpoints.appendChild(t3);
  newrow.appendChild(newrank);
  newrow.appendChild(newname);
  newrow.appendChild(newpoints);

  // Ex 7. Write some code to sum all points given to all teams
  //       Make the function summarizePoints() return it
  function summarizePoints() {
    // TODO: return the sum

  }


  // Ex 8. Change the background color of all table header cells to #DDF4FF



  // Ex 9. Remove the "Email:" label from the DOM










  // Checking exercise answers. DO NOT MODIFY THIS LINE
  check(getEmail(), countTeam(), summarizePoints());
};
