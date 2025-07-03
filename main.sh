#!/bin/bash

if [ -z "$1" ]; then
    echo "❌ Please specify the path to your notes folder."
    echo "Example: $0 ~/notes"
    exit 1
fi

NOTES_DIR="$1"
if [ ! -d "$NOTES_DIR" ]; then
    echo "❌ Folder '$NOTES_DIR' does not exist."
    exit 1
fi

ORIGINAL_DIR="$(pwd)"
cd "$NOTES_DIR" || exit 1

while true; do
    tag_list=$(rg -oP '(?<=^|\s)(#[a-zA-Z0-9_-]+)(?=\s|$|[.,;:!?()\047])' . --glob '*.md' | \
        grep -o '#[^ ]*' | sort | uniq | while read -r tag; do
            count=$(rg -l "$tag" . --glob '*.md' | wc -l)
            printf "%d %s\n" "$count" "$tag"
        done | sort -nr | awk '{printf "%s [%d]\n", $2, $1}')

    selected_tag_line=$(echo "$tag_list" | fzf --prompt="Выбери тег: ")
    selected_tag=$(echo "$selected_tag_line" | grep -o '^#[^ ]*')

    if [ -z "$selected_tag" ]; then
        break
    fi

    matching_files=$(rg -l "$selected_tag" . --glob '*.md')

    selected_file=$(echo "$matching_files" | fzf \
        --prompt="Открыть заметку (Esc — назад): " \
        --preview "bat --color=always --plain {}" \
        --preview-window=right:70%)

    if [ -z "$selected_file" ]; then
        continue
    fi

    $EDITOR "$selected_file"
done

cd "$ORIGINAL_DIR"
