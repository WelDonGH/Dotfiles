#!/usr/bin/env bash

start_time=$(date +%s.%N)

DOWNLOADS="$HOME/Downloads/"

declare -A categories

categories=(
    ["Images"]="jpg jpeg png gif svg bmp webp"
    ["Videos"]="mp4 mkv avi mov wmw webm"
    ["Music"]="mp3 ogg flac wav m4a"
    ["Documents"]="pdf txt doc docx odt ppt pptx rtf xls xlsx md"
    ["Archives"]="zip rar tar gz bz2 xz 7z"
    ["Iso"]="iso"
    ["Torrents"]="torrent"
)

for category in "${!categories[@]}"; do
    if [ ! -d "$DOWNLOADS/$category" ]; then
        mkdir -p "$DOWNLOADS/$category"
    fi
done
if [ ! -d "$DOWNLOADS/Other" ]; then
    mkdir -p "$DOWNLOADS/Other"
fi

notify-send "$(echo -e "Сортирую...")"

files_found=0
files_moved=0

for file in "$DOWNLOADS"/*; do
    if [ -d "$file" ]; then 
        continue
    fi

    filename=$(basename "$file")
    extension="${filename##*.}"
    
    files_found=$((files_moved + 1))

    extension=$(echo "$extension" | tr '[:upper:]' '[:lower:]')

    found=false

    for category in "${!categories[@]}"; do
        extension_list="${categories[$category]}"
        if [[ " $extension_list " == *" $extension "* ]]; then
            mv "$file" "$DOWNLOADS/$category/"
            echo -e "$filename -> $category"
            found=true
            files_moved=$((files_moved + 1))
            break
        fi
    done

    if [ "$found" == false ]; then
        mv "$file" "$DOWNLOADS/Other/"
        echo -e "$filename -> Other"
        break
    fi
done

end_time=$(date +%s.%N)

duration=$(echo "$end_time - $start_time" | bc)

minutes=$(echo "$duration / 60" | bc)
seconds=$(echo "$duration % 60 / 1" | bc)

notify-send "$(echo -e "Сортировка завершена")"
notify-send "$(echo -e "Файлов перемещено: $files_moved")"
notify-send "$(echo -e "Заняло времени: ${minutes}мин ${seconds}сек")"

