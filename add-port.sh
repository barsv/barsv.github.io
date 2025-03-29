#!/bin/bash

read -p "Post title: " TITLE
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//')
DATE=$(date +%Y-%m-%d)
FILENAME="_posts/${DATE}-${SLUG}.md"

cat <<EOF > "$FILENAME"
---
layout: post
title: "$TITLE"
date: $DATE
categories: [linux]
tags: [gnome, popos, workaround]
---

EOF

echo "✅ New post created: $FILENAME"
