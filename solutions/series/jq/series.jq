if (.series == "") then
  "series cannot be empty\n" | halt_error
elif .sliceLength < 0 then
  "slice length cannot be negative\n" | halt_error
elif .sliceLength == 0 then
  "slice length cannot be zero\n" | halt_error
elif .sliceLength > (.series | length) then
  "slice length cannot be greater than series length\n" | halt_error
else
  . as {series: $series, sliceLength: $slice}
  | ( $series | length ) as $length         
  | [range(0; $length - $slice + 1)] 
  | map($series[. : . + $slice])
end