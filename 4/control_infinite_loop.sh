chmod +x infinite_loop

if [ -f "/tmp/infinite_loop_running" ]
then
    echo "Бесконечный цикл уже запущен."
    pid=$(cat /tmp/infinite_loop_pid)
    memory_usage=$(ps -p $pid -o rss=)
    echo "Процесс занимает $memory_usage КБ памяти."
    echo "Хотите его остановить? (y/n)"
    read answer
    if [ "$answer" == "y" ]
    then
        pid=$(cat /tmp/infinite_loop_pid)
        kill $pid
        rm /tmp/infinite_loop_running
        rm /tmp/infinite_loop_pid
        echo "Бесконечный цикл остановлен."
    else
        echo "Программа завершена."
    fi
else
    echo "Бесконечный цикл не запущен."
    echo "Хотите его запустить? (y/n)"
    read answer
    if [ "$answer" == "y" ]
    then
        ./infinite_loop &
        echo $! > /tmp/infinite_loop_pid
        touch /tmp/infinite_loop_running
        echo "Бесконечный цикл запущен."
    else
        echo "Программа завершена."
    fi
fi
