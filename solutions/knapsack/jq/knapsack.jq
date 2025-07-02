def maxOf($valueA; $valueB):
  if $valueA >= $valueB then $valueA else $valueB end;

def packKnapsack($capacity; $itemNo):
  if $itemNo < length then
    .[$itemNo] as $item |
    maxOf(
      if $capacity >= $item.weight then
        $item.value + packKnapsack($capacity - $item.weight; $itemNo + 1)
      else 
        0
      end;
      packKnapsack($capacity; $itemNo + 1)
    )
  else 0
  end;

.maximumWeight as $capacity | .items | packKnapsack($capacity; 0)
