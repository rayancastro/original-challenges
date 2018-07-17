function convertObjectToMap(object) {
  const map = new Map();
  const entries = Object.entries(object);
  entries.forEach((pair) => {
    map.set(pair[0], pair[1]);
  });
  return map;
}

function splitTheBill(group) {
  // TODO: implement the method and return a hash
  const values = Object.values(group);
  const mappedGroup = convertObjectToMap(group);
  let total = 0;
  values.forEach((value) => {
  // For each person, add the spent value to total
    total += value;
  });
  // get the average from the total
  const average = total / values.length;
  // for each person, the total to receive is what he has spent - average
  const result = {};
  mappedGroup.forEach((value, key) => {
    result[key] = value - average;
  });
  return result;
}

module.exports = splitTheBill; // Do not remove this line.
