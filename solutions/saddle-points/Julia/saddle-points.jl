function saddlepoints(M)
    # Alternatively, in one go:
    #isempty(M) && return []
    if M == []
        return M
    end

    row_max = maximum(M, dims=2, init=-Inf)
    col_min = minimum(M, dims=1, init=Inf)
    Tuple.(findall(row_max .== col_min))
end
