#!/bin/sh

sum() {
    total=0
    for val in "$@"; do
        case $val in
            ''|*[!0-9]*) echo 0; return ;;
        esac
        total=$((total + val))
    done
    echo "$total"
}

read -r line1
read -r line2

sum1=$(sum $line1)
sum2=$(sum $line2)

if [ "$sum1" -eq "$sum2" ]; then
    echo "Sums are equal"
else
    echo "Sums are NOT equal"
fi
