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
    echo -e "${red}[4]VULNERABILITY CHECK${reset}"
    echo -e "${yellow}[5]CHECK MALWARE INFECTIONS${reset}"
    echo -e "${green}[6]RUN DEFAULT SCRIPTS${reset}"
    echo -e "${red}[7]DEFENSIVE SCRIPT SCAN${reset}"
    echo -e "${blue}[8]EVALUATE ACCESSIBLE SERVICES\n${reset}"

    python3 ai.py

    file_path="/opt/predatorshell/netscout/finger_count.txt"

    if grep -q "1" "$file_path"; then
        echo "Scanning the ports of the target ...." | lolcat
        echo -e "${green}"
        nmap -p "$portnum" "$ipaddr" -oX "$file"
        cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat

    elif grep -q "2" "$file_path"; then
        echo "Checking the service version of the ports of the target ...." | lolcat
        echo -e "${red}"
        nmap -sV -p "$portnum" "$ipaddr" --script version -oX "$file"
        cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat

    elif grep -q "3" "$file_path"; then
        echo "Performing Os Detection ...." | lolcat
        echo -e "${yellow}"
        nmap -A -O "$ipaddr" -oX "$file"
        cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat

    elif grep -q "4" "$file_path"; then
        echo "Looking for vulnerability in the target ...." | lolcat
        echo -e "${red}"
        nmap -p "$portnum" "$ipaddr" --script vuln -oX "$file"
        cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat

    elif grep -q "5" "$file_path"; then
        echo "Looking for malware infections possibilities ...." | lolcat
        echo -e "${green}"
        nmap -p- "$ipaddr" --script malware -oX "$file"
        cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat

    elif grep -q "6" "$file_path"; then
        echo "Running default scripts to scan target ...." | lolcat
        echo -e "${blue}"
        nmap -p- -sC "$ipaddr" -oX "$file"
        cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat

    elif grep -q "7" "$file_path"; then
        echo "Executing defensive scanning methods ...." | lolcat
        echo -e "${blue}"
        nmap -p- "$ipaddr" --script safe -oX "$file"
        cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat

    elif grep -q "8" "$file_path"; then
        echo "Evaluating accesible services ...." | lolcat
        echo -e "${green}"
        nmap -p- "$ipaddr" --script discovery -oX "$file"
        cowsay ஒரு Cow அதாவது ஒரு மாடு | lolcat

    else
        echo -e "${red}INVALID OPTION !${reset}"
    fi

    echo -e "\n${yellow}Want to scan more targets?\n${reset}"
    echo -e "${green}1.CONTINUE${reset}"
    echo -e "${red}2.EXIT\n${reset}"

    python3 ai.py

    file_path="/opt/predatorshell/netscout/finger_count.txt"


    if grep -q "1" "$file_path"; then
        echo -e "${green}OK${reset}"

    elif grep -q "2" "$file_path"; then
        cowsay -f kiss COME BACK SOON !!! | lolcat
        break

    else
        echo "${red}INVALID OPTION ! ${reset}"
        break
    fi

    sleep 5.5

    echo -e "${reset}"

done
