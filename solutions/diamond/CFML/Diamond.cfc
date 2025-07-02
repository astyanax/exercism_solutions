component {
  array function rows(letter) {
    if ( letter == 'A' ) { return ["A"]; }
    if ( letter < 'A' || letter > 'Z' ) { return []; }

    offset = Asc(letter) - Asc('A');
    height = 1 + 2 * offset;
    diamond = [repeatString(" ", offset) & "A" & repeatString(" ", offset)];

    for ( var i = 1; i <= height / 2; i++ ) {
      space = repeatString(" ", offset - i);
      fill = repeatString(" ", 2 * i - 1);
      char = Chr(Asc('A') + i);
      diamond.push(space & char & fill & char & space);
    }
  return diamond.append(diamond[-2::-1], true);
  }
}

