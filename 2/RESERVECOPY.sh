backup_directory() {
    src_dir=$1
    dest_dir=$2
    mode=$3

    if [ "$mode" = "replace" ]; then
        cp -r "$src_dir"/* "$dest_dir"
    elif [ "$mode" = "add" ]; then
        cp -rn "$src_dir"/* "$dest_dir"
    elif [ "$mode" = "delete" ]; then
        diff -qr "$src_dir" "$dest_dir" | grep "^Only in $dest_dir" | sed "s/Only in $dest_dir://" | xargs -I {} rm -rf "$dest_dir/{}"
    elif [ "$mode" = "sync" ]; then
        rsync -av --delete --update "$src_dir"/ "$dest_dir"
    else
        echo "Неверный режим работы."
        show_help
        exit 1
    fi
}

show_help() {
    echo "Использование: $0 <исходный_каталог> [резервный_каталог]"
    echo "Режимы работы:"
    echo "1) Замещение файлов"
    echo "2) Добавление файлов"
    echo "3) Удаление файлов"
    echo "4) Синхронизация файлов"
}

if [ $# -lt 2 ]; then
    show_help
    exit 1
fi

src_directory="$1"
dest_directory="${2:-$1}"

if [ ! -d "$src_directory" ]; then
    echo "Директория-источник не существует."
    exit 1
fi

echo "Выберите режим работы:"
echo "1) Замещение файлов"
echo "2) Добавление файлов"
echo "3) Удаление файлов"
echo "4) Синхронизация файлов"
read -p "Введите номер режима: " mode

case $mode in
    1) mode="replace";;
    2) mode="add";;
    3) mode="delete";;
    4) mode="sync";;
    *) echo "Неверный режим работы."; exit 1;;
esac

backup_directory "$src_directory" "$dest_directory" "$mode"