BEGIN {
  if ( num % 3 == 0 ) res = res "Pling";
  if ( num % 5 == 0 ) res = res "Plang";
  if ( num % 7 == 0 ) res = res "Plong";
  print ( res ? res : num )
}