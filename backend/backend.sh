#!/bin/bash

while true; do 

printf 'HTTP/1.1 200 OK\n\n%s' \
"$(cat ../frontend/index.html)" | \

nc -lvq 1 -p ${1:-8888};

done
