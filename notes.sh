#!/bin/bash
# bash notes
greet() {
    echo "hello $1"
}

greet "practice"

nums=(1 2 3)
for n in "${nums[@]}"; do
    echo $((n * 2))
done

# TODO: try arrays/associative next
