export const isArmstrongNumber = (number) => {
  const digits = String(number).split('');

  const sum = digits.reduce((acc, digit) => {
    return acc + Math.pow(parseInt(digit), digits.length);
  }, 0);

  return sum === number;
};
