#!/bin/bash

read -p "Введите имя пользователя для проверки: " username

if getent passwd "$username" > /dev/null 2>&1; then
    echo "Пользователь $username зарегистрирован в системе."
else
    echo "Пользователь $username не зарегистрирован в системе."
fi

if who | grep -w "$username" > /dev/null 2>&1; then
    echo "Пользователь $username работает в текущий момент."
else
    echo "Пользователь $username не работает в текущий момент."
fi

echo "Список зарегистрированных пользователей с домашними каталогами и UID:"
awk -F: '{ print $1, $3, $6 }' /etc/passwd | sort -k2,2nr | while read user uid dir; do
    echo "Имя пользователя: $user, UID: $uid, Домашний каталог: $dir"
done
