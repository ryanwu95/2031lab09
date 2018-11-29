#!/bin/bash



a=0
read=$(gpio read 5)

while true
do
    read=$(gpio read 5)
    if [ "$read" -eq 0 ]
    then
        
        ((a++))
	./waitForButtonPress.sh
	echo "$a"
        ./setbits.sh "$a"

        if [ "$a" -eq 16 ]
        then
	gpio write 4 1 
            sleep 1
            gpio write 4 0      
       break
        fi

        if [ "$a" -eq 0 ]
        then
            gpio write 4 1 
            sleep 1
            gpio write 4 0 
        fi
    fi
done
