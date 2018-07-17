function sumOfNegative(numbers) {
  // TODO: You are getting an array `numbers`. Return the sum of **negative** numbers only.
  let sum = 0;
  numbers.forEach((num) => {
    if (num < 0) {
      sum += num;
    }
  });
  return sum;
}

module.exports = sumOfNegative; // Do not remove.
