while true
do
echo ""
echo -e "\033[31m\t⟨\033[32m Always Kill The Server When Your Done!!\033[31m ⟩\033[0m"
echo -e "\033[1;31m"
echo -e "\t\t ░█░█░█▀█░█▀▀░▀█▀░█▀█░█░█░█▀█"
echo -e "\t\t ░█▀█░█░█░▀▀█░░█░░█▀▀░█▀█░█▀▀"
echo -e "\t\t ░▀░▀░▀▀▀░▀▀▀░░▀░░▀░░░▀░▀░▀░░"
echo -e "\t\t⟨ Ctrl+c to Exit the Program ⟩\033[0m"
read -p $'\e[1;32mEnter File Name:\e[34m ' filename
echo ""
if [[ $filename != *.html ]]; then
    echo -e "\033[31mError: Please provide a valid .html file name."
    continue
  fi
echo ""
read -p $'\e[1;32mHost the server now (y/n):\e[34m ' host
echo -e "\033[31m"

if [ "$host" == "y" ]; then
  php -S localhost:8080 &
  am start -a android.intent.action.VIEW -d http://127.0.0.1:8080/$filename
else
  echo -e "\033[31mServer not started."
  echo -e "Exiting the program"
  exit
fi
echo ""
read -p $'\e[33m   ⟨Type "\e[1;35mk\e[33m" Hit ENTER to kill Server ⟩\e[1;31m     ' kill
if [ "$kill" == "k" ]; then
  pkill -9 php
  echo ""
  echo -e "\033[31m\t\t⟨ Server Killed ⟩\033[0m"
fi
done
