function sum_of_multiples(limit, factors)
    Set(j
    for i in filter(>(0), factors)
    for j in i:i:limit-1) |> sum
end
