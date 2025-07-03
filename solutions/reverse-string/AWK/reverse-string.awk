END {
    x=""
    for(i=length($0) ; i!=0 ; i--)
        x=(x substr($0,i,1))
    print x
}