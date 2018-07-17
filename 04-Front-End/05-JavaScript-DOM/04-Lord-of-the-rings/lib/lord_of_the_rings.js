const GOOD = ["Hobbits", "Elves", "Dwarves", "Eagles"];
const EVIL = ["Orcs", "Wargs", "Goblins", "Uruk Hai", "Trolls"];

function isGood(soldierType) {
  // TODO: return `true` if the soldierType is Good.
  if (GOOD.includes(soldierType)) {
    return true;
  }
  return false;
}

function buildSoldierMap(battlefield) {
  // TODO: Given a battlefield (String), return a Map of forces.
  const races = battlefield.split(",");
  const battle = new Map();
  races.forEach((race) => {
    const result = race.split(":");
    battle.set(result[0], parseInt(result[1], 10));
  });
  return battle;
}

function whoWinsTheWar(battlefield) {
  // TODO: Based on the battlefield's description (it's a String), return "Good", "Evil" or "Tie".
  const soldierMap = buildSoldierMap(battlefield);
  let sumGood = 0;
  let sumEvil = 0;
  soldierMap.forEach((value, key) => {
    if (isGood(key)) {
      sumGood += value;
    } else {
      sumEvil += value;
    }
  });
  if (sumGood > sumEvil) {
    return "Good";
  } else if (sumGood < sumEvil) {
    return "Evil";
  }
  return "Tie";
}

module.exports = { whoWinsTheWar, buildSoldierMap, isGood }; // Do not remove this line
