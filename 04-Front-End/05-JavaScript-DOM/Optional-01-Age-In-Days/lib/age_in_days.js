function ageInDays(day, month, year) {
  // TODO: Implement the method and return an integer
  const ageInMillis = Date.now() - new Date(year, month - 1, day);
  return Math.round(ageInMillis / 86400000);
}

module.exports = ageInDays; // Do not remove. We need this for the spec to know about your method.
