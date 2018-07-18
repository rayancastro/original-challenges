function bowlingScore(rolls) {
  // TODO: computer score from rolls
  const game = { bonus: { currentRound: 1,
    nextRound: 1,
    otherRound: 1 },
  secondRound: false,
  frame: 1,
  totalPoints: 0,
  memo: 0,
  roll: 0 };
  for (let i = 0; i < rolls.length; i += 1) {
    game.roll = rolls[i];
    // console.log(`Round ${game.frame} - Roll value: ${game.roll}`)
    game.totalPoints += game.roll * game.bonus.currentRound;
    // console.log(`Added ${game.roll * game.bonus.currentRound} to total`)
    if (game.secondRound) {
      game.secondRound = false;
      game.frame += 1;
      game.memo += game.roll;
      if (game.memo === 10) { game.bonus.nextRound += 1; }
      game.memo = 0;
    } else {
      game.memo += game.roll;
      game.secondRound = true;
      if (game.roll === 10) {
        game.bonus.nextRound += 1;
        game.bonus.otherRound += 1;
        game.frame += 1;
        game.memo = 0;
        game.secondRound = false;
      }
    }
    game.bonus.currentRound = game.bonus.nextRound;
    game.bonus.nextRound = game.bonus.otherRound;
    game.bonus.otherRound = 1;
    // console.log(`Total Points: ${game.totalPoints}`);
    if (game.frame === 11) {
      game.bonus.currentRound = 1;
      game.bonus.nextRound = 1;
      game.bonus.otherRound = 1;
    }
  }
  // Zera todos os bonus roda os ultimos rounds
  return game.totalPoints;
}
// console.log(bowlingScore([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]));
module.exports = bowlingScore; // Do not remove this line.
// Is new round??
// Check rollNumber variable.
// If it is 1, proceed to new round rules.
// If it is 2, procceed to second roll rules.
// New Round!!!
// If roll is equal to 10, its a strike.
// If strike true or spair true, add 10 bonus to the sum.
// Add 10 to the sum, set strike to true. Set memo to 0. Add 1 to round.
// If roll is lower then 10, add roll value to memo. Add roll value to sum.
// If strike is true, add roll bonus to sum, set strike to false and spair to true
// set rollnumber to 1
// Second roll of frame
// If memo + roll = 10, its a spair
// set memo to 0
