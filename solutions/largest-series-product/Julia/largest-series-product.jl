# https://docs.julialang.org/en/v1/base/collections/#Base.prod
# https://docs.julialang.org/en/v1/base/collections/#Base.maximum
function largest_product(str, span)
    if span > length(str) || span < 1 || contains(str, r"[^\d]")
        throw(ArgumentError("Invalid span value"))
    end
    digits = str |> s-> split(s, "") .|> s->parse(Int64, s)
    map(i -> digits[i:i+span-1] |> prod, 1:length(digits)-span+1) |> maximum
end
