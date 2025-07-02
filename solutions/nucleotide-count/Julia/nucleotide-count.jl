function count_nucleotides(strand)
    nucleotides = collect("ACGT")
    #if ~issubset(unique(strand), nucleotides)
    if unique(strand) ⊈ nucleotides
        throw(DomainError(""))
    end
    return Dict(k => count(==(k), strand) for k in nucleotides)
end
