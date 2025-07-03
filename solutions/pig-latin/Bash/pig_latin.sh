#!/usr/bin/env bash
make_pig_latin() {
    word="$1"
    len="${#word}"
    grep '^[aeiou]' -Eq <<<"$word"
    [[ $? -eq 0 ]] && echo "$word""ay" && exit
    grep '^(squ|thr|sch)' -Eq <<<"$word"
    [[ $? -eq 0 ]] && echo "${word:3:len-3}""${word:0:3}""ay" && exit
    grep '^(ch|sq|th|rh|qu)' -Eq <<<"$word"
    [[ $? -eq 0 ]] && echo "${word:2:len-2}""${word:0:2}""ay" && exit
    grep '^(xr|yt)' -Eq <<<"$word"
    [[ $? -eq 0 ]] && echo "$word""ay" && exit
    echo "${word:1:len-1}""${word:0:1}""ay"
}

result=''
for i in $(seq $#); do
    result+=$(make_pig_latin "${!i}")' '
done

echo "${result% }"
