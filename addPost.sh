#!/bin/bash

# Замените это на вашу директорию _posts
POSTS_DIR="_posts"

# Получение текущей даты в формате YYYY-MM-DD
DATE=$(date +%F)
TIME=$(date +%T)

# Замените пробелы в заголовке на дефисы
TITLE_SLUG=$(echo "$1" | tr " " "-")

# Формирование полного пути к файлу
FILENAME="$POSTS_DIR/$DATE-$TITLE_SLUG.md"

# Создание файла с YAML front matter
echo "---" > $FILENAME
echo "layout: post" > $FILENAME
echo "title: $1" >> $FILENAME
echo "date: $DATE $TIME" >> $FILENAME
echo "---" >> $FILENAME
echo "" >> $FILENAME

# Открытие файла в Vim
v $FILENAME
