echo "Объединение и переименование файлов"
echo "Contant for A.TXT" > A.TXT
echo "Contant for B.TXT" > B.TXT
cat A.TXT B.TXT > C.TXT
cat C.TXT
read -n 1 -s -r -p "Нажмите любую клавишу для продолжения..."
mv A.TXT FINA.TXT
mv B.TXT FINB.TXT
echo "Задание выполнено" 
