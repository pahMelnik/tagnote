#!/bin/bash

NOTES_DIR="./sample-notes"
mkdir -p "$NOTES_DIR/projects" "$NOTES_DIR/ideas" "$NOTES_DIR/journal"

# Create notes with various tags
cat > "$NOTES_DIR/todo.md" <<EOF
# My TODO List

- [ ] Finish the #project
- [ ] Buy groceries #personal
- [ ] Read about #productivity
EOF

cat > "$NOTES_DIR/ideas/startup.md" <<EOF
# Startup Brainstorm

Here are some ideas:

- AI for tagging notes automatically #idea #ai
- Terminal UI for notes navigation #cli #idea
EOF

cat > "$NOTES_DIR/projects/note-tags.md" <<EOF
# note-tags tool

This project uses #bash, #fzf, #ripgrep and #bat to work with #tags inside markdown files.

- Add support for multi-tag filtering #todo
- Publish on GitHub #plan
EOF

cat > "$NOTES_DIR/journal/2024-07-01.md" <<EOF
# Monday thoughts

Felt productive today. Started working on #note-tags script.

- Need to refactor the #bash logic
- Add #highlight for selected tags
EOF

cat > "$NOTES_DIR/random.md" <<EOF
# Random Notes

This file mentions nothing important.

Maybe just add a tag here: #misc
EOF

echo "✅ Sample notes created in $NOTES_DIR"
