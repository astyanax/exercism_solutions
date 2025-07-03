local function prod(s,start,stop)
    local res = 1
    for i=start,stop do res = res * tonumber(s:sub(i,i)) end
    return res
end

return function (opts)
    assert(opts.span >= 0 and opts.span <= #opts.digits)

    local res = prod(opts.digits,1,opts.span)
    local cur = res

    for i=2,#opts.digits-opts.span+1 do
        cur = prod(opts.digits,i,i+opts.span-1)
        if cur > res then res = cur end
    end

    return res
end