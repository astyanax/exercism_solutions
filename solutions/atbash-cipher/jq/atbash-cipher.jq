if .property == "encode" then 
    [.input.phrase | ascii_downcase | sub("[^a-z0-9]"; ""; "g") | explode[] | if (. >= 97 and . <= 97+25) then (25 - (. - 97 )) + 97 else . end  ] | implode | sub("(?<c>[a-z0-9]{5})"; "\(.c) "; "g") | rtrimstr(" ")
else
    [.input.phrase | ascii_downcase | sub("[^a-z0-9]"; ""; "g") | explode[] | if (. >= 97 and . <= 97+25) then (25 - (. - 97 )) + 97 else . end  ] | implode 
end