output="$1"
target="$2"
preset="$3"
queries=("${@:4}")

echo "$output" "$target" "$preset" "${queries[@]}"