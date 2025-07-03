function triangle(n)
    if n < 0
        throw(DomainError(n, "n must be positive"))
    end

    result = Vector{Vector{Int}}()

    for row in 1:n
        current_row = Vector{Int}(undef, row)
        current_row[1] = current_row[end] = 1

        if row > 2
            prev_row = result[row-1]
            for j in 2:(row-1)
                current_row[j] = prev_row[j-1] + prev_row[j]
            end
        end

        push!(result, current_row)
    end

    return result
end