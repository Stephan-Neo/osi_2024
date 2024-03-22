#!/bin/bash

report_file="filesystem_report.txt"
df -h > $report_file

echo "Информация о файле отчета:"
echo "Имя файла: $report_file"

file_size=$(stat -c %s "$report_file")
echo "Размер файла: $file_size байт"

file_permissions=$(stat -c %A "$report_file")
echo "Права доступа к файлу: $file_permissions"
