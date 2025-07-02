declare -A raindrop
raindrop=( ["3"]="Pling" ["5"]="Plang" ["7"]="Plong")
out=""
for s in "${!raindrop[@]}"; do (( "$1" % $s == 0 )) && out=${raindrop[$s]}$out; done
echo "${out:-$1}"