echo "Выберите действие:"
echo "1) Вывести имя компьютера"
echo "2) Вывести полную конфигурацию TCP/IP для всех адаптеров"
echo "3) Отобразить содержимое кэша сопоставления имен DNS клиента"
echo "4) Очистить кэш DNS"

read choice

case $choice in
    1)
        hostname
        ;;
    2)
        ip addr show
        ;;
    3)
        cat /etc/resolv.conf
        ;;
    4)
        sudo systemctl restart systemd-resolved
        ;;
    *)
        echo "Неверный выбор"
        ;;
esac
