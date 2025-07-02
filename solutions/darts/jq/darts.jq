hypot(.x; .y) as $rad |
  if $rad > 10 then 0
  elif $rad > 5 then 1
  elif $rad > 1 then 5
  else 10 end    