#!/bin/bash

usage(){
    printf " \
    Usage: ./backend.sh [OPTION]...
    -p                      Select port to host on (Default: 8888)
    -v                      Verbose mode
    -h                      Show this message
    
    Examples:
    ./backend.sh -v -p 80   Host a server on port 80 and use verbose mode
    ./backend.sh -v         Host a server on port 8888"
}

# Parse flags
verbose=false;
while getopts "hvp:" option; do
    case $option in
        h)
            usage
            ;;
        v)
            verbose=true;
            ;;
        p)
            port=$OPTARG;
            shift
            ;;
        *)
            echo "Bad or misplaced argument";
            exit 1;
            ;;    
    esac;
done;

if [ -r 'frontend/index.html' ]; then
    response="'HTTP/1.1 200 OK\n\n%s'$(cat 'frontend/index.html')";

    touch logs/server.log;

    while true; do 
        if [ $verbose ]; then
            echo DEBUG: verbose
            # If the client entered the -v flag, print the output and save it to the log file
            echo "'$response'" | nc -lvq 1 -p "${port:-8888}" 2>&1 | tee -a "logs/server.log"
        else
            echo DEBUG: not verbose
            # If the client didn't enter the -v flag, save the output without printing it and notify about the connection 
            echo "'$response'" | nc -lvq 1 -p "${port:-8888}" >> "logs/server.log" 
            echo "Connection received."
        fi;
    done;
else
    echo "index.html missing"
    exit 2
fi;
