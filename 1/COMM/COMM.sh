#!/bin/bash

echo "Копирование и удаление файла"
mkdir DIR1
echo "Contant for TEXT1.TXT" > DIR1/TEXT1.TXT
mkdir DIR1/DIR2
cp DIR1/TEXT1.TXT DIR1/DIR2/TEXTNEW.TXT
rm DIR1/TEXT1.TXT
echo "Файл скопирован и удален"
read -p "Нажмите любую клавишу для продолжения..."
