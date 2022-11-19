#!/bin/bash

# Directory name variable   ## ./ shows the contents of the folder
WORKING_DIR=".pb"

# File name variable
DATA="$WORKING_DIR/phonebook" 

# Create the directory here:
mkdir -p "$WORKING_DIR"

# Creates the file here: (this file will contain the phonebook registries)
touch "$DATA"


addRecord(){
	read -p 'Name:' -i name 
	read -p 'Number: ' num;
	REC="$name $num" #variable to store name and num
	echo "$REC" >> "$DATA" #append name and number to phonebook
	echo "Record has been Added."
	sleep 3


}

searchRecord(){
	read -p "search Record: " search 
	if [-z "$search" ]; then # -z checks if string is empty
		echo "No Input"
		
	
	else
		found=`grep "$search" "$DATA"`;
		if [-z "$found" ];then
			echo "There is no $search in directory"
			
		fi
	fi
	
}	

#deleteRecord(){

#}

viewRecords(){
		
	#cat $DATA
	#echo VIEWRECORDS
	cat .pb/phonebook
	sleep 4
	
}

eraseRecords(){

	echo "Do you want to delete all records in phonebook 1 for yes 0 for no?"
	read -p "1/0:   " answer
	if [ -z "$answer" ]
	then
		echo "No Input"
		sleep 3
	
	#elif ["$answer" -eq 1]; then 
	elif (("$answer"==1)) 
	then 
		#> .pb/phonebook
		#truncate -s 0 .pb/phonebook
		#echo -n "" > phonebook
		#echo -n > .pb/phonebook
		cat /dev/null > .pb/phonebook
		#echo yessss
		sleep 3
	fi
}




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








#function viewRecords



#function eraseRecords




