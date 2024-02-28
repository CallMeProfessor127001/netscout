#!/bin/bash

red="\033[38;5;196m"
green="\033[38;5;82m"
yellow="\033[0;33m"
blue="\033[38;5;51m"
reset="\033[0m" # Reset color to default

toilet -f mono12 -F metal -W __NET__ _SCOUT__ | lolcat
echo -e "\nAUTOMATED NETWORK EXPLORER" | lolcat
cowsay -f dragon-and-cow PROFESSOR VISHAL professorvishal31@gmail.com | lolcat

while true
do
	echo -e "${blue}ENTER YOUR TARGET'S IP ADDRESS : ${reset}"
	read ipaddr

	echo -e "${yellow}ENTER PORT NUMBER OR RANGE OF PORTS TO SCAN : ${reset}"
	read portnum

	echo -e "${red}ENTER THE FILE NAME TO SAVE THE RESULTS : ${reset}"
	read file

	echo -e "\n"

	figlet CHOOSE A METHOD TO SCAN TARGET -c | lolcat

	echo -e "${yellow}[1]PORT SCAN${reset}"
	echo -e "${blue}[2]SERVICE VERSION DETECTION${reset}"
	echo -e "${green}[3]OS DETECTION${reset}"
	echo -e "${red}[4]VULNERABLILITY CHECK${reset}"
	echo -e "${yellow}[5]CHECK MALWARE INFECTIONS${reset}"
	echo -e "${green}[6]RUN DEFAULT SCRIPTS${reset}"
	echo -e "${red}[7]DEFENSIVE SCRIPT SCAN${reset}"
	echo -e "${blue}[8]EVALUATE ACCESSIBLE SERVICES\n${reset}"

	read tool;

	case $tool in
		1) echo "Scanning the ports of the target ...." | lolcat;echo -e "${green}";nmap -p "$portnum" "$ipaddr" -oX "$file";cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat;;
		2) echo "Checking the service version of the ports of the target ...." | lolcat;echo -e "${red}";nmap -sV -p "$portnum" "$ipaddr" --script version -oX "$file";cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat;;
		3) echo "Performing Os Detection ...." | lolcat;echo -e "${yellow}";nmap -A -O "$ipaddr" -oX "$file";cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat;;
		4) echo "Looking for vulnerability in the target ...." | lolcat;echo -e "${red}";nmap -p "$portnum" "$ipaddr" --script vuln -oX "$file";cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat;;
		5) echo "Looking for malware infections possibilities ...." | lolcat;echo -e "${green}";nmap -p- "$ipaddr" --script malware -oX "$file";cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat;;
		6) echo "Running default scripts to scan target ...." | lolcat;echo -e "${blue}";nmap -p- -sC "$ipaddr" -oX "$file";cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat;;
		7) echo "Executing defensive scanning methods ...." | lolcat;echo -e "${blue}";nmap -p- "$ipaddr" --script safe -oX "$file";cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat;;
		8) echo "Evaluating accesible services ...." | lolcat;echo -e "${green}";nmap -p- "$ipaddr" --script discovery -oX "$file";cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat;;
		*) echo -e "${red}INVALID OPTION :( \n${reset}"
	esac

        echo -e "\n${yellow}Want to scan more targets?\n${reset}"
        echo -e "${green}1.CONTINUE${reset}"
        echo -e "${red}2.EXIT\n${reset}"
        read conti

	if [ $conti -eq 1 ]
	then
		echo -e "${green}OK${reset}"
	else
		cowsay -f kiss COME BACK SOON !!! | lolcat
		break

	fi
	sleep 5.5

	echo -e "${reset}"
	
done

echo -e "${reset}"
