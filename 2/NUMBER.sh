read -p "Введите первое число: " num1
read -p "Введите второе число: " num2

if [ "$num1" -gt "$num2" ]; then
    echo "Первое число больше"
elif [ "$num1" -lt "$num2" ]; then
    echo "Второе число больше"
else
    echo "Числа равны"
fi