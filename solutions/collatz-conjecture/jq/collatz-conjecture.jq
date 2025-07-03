def next:
  if . % 2 == 0 then . / 2 else 3 * . + 1 end;

def validate:
  if . < 1 then ("Only positive integers are allowed" | halt_error ) else . end;

def steps:
  validate | [while (. > 1; next)] | length;
