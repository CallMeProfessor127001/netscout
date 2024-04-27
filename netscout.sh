#!/bin/bash

clear

red="\033[38;5;196m"
green="\033[38;5;82m"
yellow="\033[0;33m"
blue="\033[38;5;51m"
reset="\033[0m" # Reset color to default

toilet -f mono12 -F metal -W NET ____MAPPER-X | lolcat
echo -e "NEXT-GEN NETWORK MAPPER" | lolcat
cowsay -f dragon-and-cow PROFESSOR VISHAL professorvishal31@gmail.com | lolcat

num=1
while true
do
	echo -e "\n"
	echo -e "${green}ENTER YOUR TARGET'S IP ADDRESS : ${reset}"
	read ipaddr

	echo -e "\n${red}ENTER PORT NUMBER OR RANGE OF PORTS TO SCAN : ${reset}"
	read portnum

	echo -e "\n${yellow}ENTER THE FILE NAME TO SAVE THE RESULTS : ${reset}"
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

	echo -e "\n"

	if [ $tool -eq 1 ]
	then
		echo "Scanning the ports of the target ...." | lolcat
		echo -e "$green"
		nmap -p "$portnum" "$ipaddr" -oX "$file"
		cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat

	elif [ $tool -eq 2 ]
	then
		echo "Checking the service version of the ports of the target ...." | lolcat
		echo -e "${red}"
		nmap -sV -p "$portnum" "$ipaddr" --script version -oX "$file"
		cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat

	elif [ $tool -eq 3 ]
	then
		echo "Performing Os Detection ...." | lolcat
		echo -e "${yellow}"
		nmap -A -O "$ipaddr" -oX "$file"
		cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat

	elif [ $tool -eq 4 ]
	then
		echo "Looking for vulnerability in the target ...." | lolcat
		echo -e "${red}"
		nmap -p "$portnum" "$ipaddr" --script vuln -oX "$file"
		cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat

	elif [ $tool -eq 5 ]
	then
		echo "Looking for malware infections possibilities ...." | lolcat
		echo -e "${green}"
		nmap -p- "$ipaddr" --script malware -oX "$file"
		cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat

	elif [ $tool -eq 6 ]
	then
		echo "Running default scripts to scan target ...." | lolcat
		echo -e "${blue}"
		nmap -p- -sC "$ipaddr" -oX "$file"
		cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat

	elif [ $tool -eq 7 ]
	then
		echo "Executing defensive scanning methods ...." | lolcat
		nmap -p- "$ipaddr" --script safe -oX "$file"
		cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat

	elif [ $tool -eq 8 ]
	then
		echo "Evaluating accesible services ...." | lolcat
		echo -e "${green}"
		nmap -p- "$ipaddr" --script discovery -oX "$file"
		cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat

	else
		echo -e "${red}INVALID OPTION :( \n${reset}"

	fi

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
	num=$(( $num+1 ))
	sleep 5.5

	echo -e "${reset}"
	
done

echo -e "${reset}"
