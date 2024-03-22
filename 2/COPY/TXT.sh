echo "Введите путь к директории:"
read directory

if [ ! -d "$directory" ]; then
    echo "Директория не существует."
    exit 1
fi

txt_files=$(find "$directory" -type f -name "*.txt")

for file in $txt_files; do
    echo "Файл: $file"
    cat "$file"
    echo "-----------------------"
done
