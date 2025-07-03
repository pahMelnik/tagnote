#!/bin/bash

SOURCE="$HOME/code/note-tags/main.sh"
TARGET="$HOME/.local/bin/tagnotes"

# Создаём ~/.local/bin, если нужно
mkdir -p "$HOME/.local/bin"

# Удаляем старую ссылку, если есть
if [ -L "$TARGET" ]; then
    echo "🔁 Обновляю ссылку $TARGET"
    rm "$TARGET"
elif [ -e "$TARGET" ]; then
    echo "❌ $TARGET уже существует и это не ссылка. Удалите вручную."
    exit 1
fi

# Создаём симлинк
ln -s "$SOURCE" "$TARGET"
chmod +x "$SOURCE"

echo "✅ Установлено: можешь запускать как 'tagnotes'"
