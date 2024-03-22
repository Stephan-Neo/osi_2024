if [ $# -ne 2 ]; then
    echo "Использование: $0 <директория> <имя_файла>"
    exit 1
fi

directory="$1"
file="$2"

if [ -e "$directory/$file" ]; then
    echo "Файл найден: $directory/$file"

    if [ -r "$directory/$file" ]; then
        echo "Файл доступен для чтения"
    else
        echo "Файл недоступен для чтения"
    fi

    if [ -w "$directory/$file" ]; then
        echo "Файл доступен для записи"
    else
        echo "Файл недоступен для записи"
    fi

    if [ -x "$directory/$file" ]; then
        echo "Файл доступен для выполнения"
    else
        echo "Файл недоступен для выполнения"
    fi
else
    echo "Файл не найден: $directory/$file"
fi