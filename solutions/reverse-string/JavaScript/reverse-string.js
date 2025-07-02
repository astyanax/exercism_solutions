export const reverseString = (str) => {
  // From fastest to slowest
  return str.split('').reverse().join('')
  //return str.split('').reduce((reversed, character) => character + reversed, '')
  //return [...str].reverse().join('');
};
