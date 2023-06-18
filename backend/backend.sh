#!/bin/bash

# Parse flags
while getopts ":v:p:" option; do
    case $option in
        p)
            port="OPTARG"
            ;;
        v)
            verbose=true
            ;;
        *)
            echo "Bad or misplaced argument"
            ;;    
    esac
done

response='HTTP/1.1 200 OK\n\n%s' "$(cat ../frontend/index.html)"

while true; do 
    if [verbose -eq true]; then
        # If the client entered the -v flag, print the output and save it to the log file
        $(response) > nc -lvq 1 -p ${port:-8888} | tee -a "../logs/server.log"
    else
        # If the client didn't enter the -v flag, save the output without printing it and notify about the connection 
        $(response) > nc -lvq 1 -p ${port:-8888} >> "../logs/server.log"
        echo "Connection received."
    fi
done
