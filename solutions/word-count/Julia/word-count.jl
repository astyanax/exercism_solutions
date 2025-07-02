function wordcount(sentence)
    words = split(lowercase(sentence), r"('\B|\B'|[^\w'])+"; keepempty=false)
    Dict(word => count(==(word), words) for word in unique(words))
end