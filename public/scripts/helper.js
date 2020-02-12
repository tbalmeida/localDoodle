module.exports = {
  generateRandomString(pLength) {
    const arrayChar = 'abcdefghijklmnopqrstuvxwyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    const arrayLength = arrayChar.length - 1;
    let vShortStr = "";

    // loops for the length requested, selection randomly a char from the array to compose the ID
    for (let i = 1; i <= pLength; i++) {
      vShortStr += arrayChar[Math.round(Math.random() * arrayLength) ];
    }
    return vShortStr;
  }

};
