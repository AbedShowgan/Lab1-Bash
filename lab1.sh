#!/bin/bash

# Directory name variable   ## ./ shows the contents of the folder
WORKING_DIR=".pb"

# File name variable
DATA="$WORKING_DIR/phonebook" 

# Create the directory here:
##mkdir "$WORKING_DIR"

# Creates the file here: (this file will contain the phonebook registries)
touch "$DATA"

# The main-menu function - 
# an endless loop that prints the menu, gets input from user and 
# call the appropiate functions. 
mainMenu(){


	while true; do 
		clear;
		echo "**************" ## change from " to '
		echo "Phonebook App"
		echo "**************"
		echo "Please select an option"
		echo "a) add a record "
		echo "s) search a record "
		echo "v) view all records "
		echo "d) delete a record "
		echo "e) erase all records "
		echo "q) quit "
		read -p 'Option:' -n 1 option
		# drops one line
		echo ""

		# That's how a 'switch'	looks like in bash
		case $option in
			a) addRecord ;; ### break
			s) searchRecord ;;
			v) viewRecords ;;
			d) deleteRecord ;;
			e) eraseRecords ;;
			q) exit ;;
			*) echo "Please type a valid option" ; sleep 1 ;; 
		esac ## reverse case
	done
	

}

mainMenu  

function addRecord
{
read -p 'name:' -i name

echo "$name"
name =$1
number = $2
echo "$name $number">"$DATA.txt"
}



function searchRecord
{
}



function viewRecords
{

cat "lab1.sh"


}


function eraseRecords
{

}



