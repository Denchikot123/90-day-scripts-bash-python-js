1 Task

#!/bin/bash

for file in *; do
    if [ -f "$file" ]; then
        mv "$file" "bak_$file"
        echo "Renamed $file -> bak_$file"
    fi
done

2 Task

#!/bin/bash

for file in *; do
    if [ -f "$file" ]; then
        new=$(echo "$file" | tr "абвгдеёжзийклмнопрстуфхцчшщъыьэюя" "abcdefghijklmnopqrstuvwxyz")
        [ "$file" != "$new" ] && mv "$file" "$new"
    fi
done

3 Task

#!/bin/bash

for file in *.html; do
    [ -f "$file" ] && mv "$file" "${file%.html}.txt"
done
