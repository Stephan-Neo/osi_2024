#!/bin/bash

read -p "Введите путь к каталогу для анализа: " dir_path

report_file="file_report.txt"

find "$dir_path" -type f -exec stat --format "%i %A %s %x %n" {} \; | sort -n > "$report_file"

chmod 777 "$report_file"

ln "$report_file" ~/hard_link_to_report.txt

ln -s "$(pwd)/$report_file" ~/Desktop/symbolic_link_to_report.txt

echo "Отчет готов. Полные права на файл открыты."
echo "Жесткая ссылка создана в домашнем каталоге, символьная ссылка - на рабочем столе."
