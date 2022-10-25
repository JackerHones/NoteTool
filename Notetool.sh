#!/bin/bash
echo "==============================="
		date
echo "==============================="

echo "
████████████████████████████████████████████████
█▄─▀█▄─▄█─▄▄─█─▄─▄─█▄─▄▄─█─▄─▄─█─▄▄─█─▄▄─█▄─▄███
██─█▄▀─██─██─███─████─▄█▀███─███─██─█─██─██─██▀█
▀▄▄▄J▀▄▄O▄▄▄▄▀N▄▄▄E▀▄▄S▄▄▀▀▄▄▄▀▀▄▄▄▄▀▄▄▄▄▀▄▄▄▄▄▀"

echo "Author Isaiah Jones"
echo "Before using this tool make sure to make a file named "notesfile.txt""
echo "Would you like to (search, add notes or clear notes)?"
read userinput


if [[ $userinput = "search" ]]
then 
	echo "What would you like to search for?"
	read searchcriteria
	echo "================================================"
	cat notesfile.txt |
	grep -i -C3 $searchcriteria
	echo "New Search?(yes/no)"
	read newsearchyesorno
fi
#determines what happens after the initial search

if [[ $newsearchyesorno = "yes" ]]
then
	echo "Next search.."
	read searchcriteria
	echo "================================================"
        cat notesfile.txt |
        grep -i -C3 $searchcriteria
	command notetool

elif [[ $newsearchyesorno = "no" ]]
then
	clear
	command notetool
fi

if [[ $userinput = "add notes" ]]
then
	echo "Type your notes below.."
	read notes
	echo "
	 ===================
	$notes
         ====================
      	Notes have been updated..
	 ===================="
	echo $notes >> ~/notesfile.txt

elif [[ $userinput = "clear notes" ]]
then
	echo "Are you sure you'd like to clear your notes?"
	read confirmationinput

if [[ $confirmationinput = yes ]]
then
	echo "Deleting notes"
	rm notesfile.txt
	touch notesfile.txt
elif [[ $confirmationinput = no ]]
then
	echo "Nevermind"
	clear
	command notetool
	
fi
	 else
		 echo "Unknown command, try again with (search or add notes)"
		 set -e

fi
