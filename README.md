# Dummy Server 

Hosts a dummy website for testing purposes

Usage: `./backend.sh [OPTION]...`  
&nbsp; `-p`                      Select port to host on (Default: 8888)  
&nbsp; `-v`                      Verbose mode  
&nbsp; `-h`                      Show this message
    
Examples:\
&nbsp; `./backend.sh -v -p 80`   Host a server on port 80 and use verbose mode  
&nbsp; `./backend.sh -v`         Host a server on port 8888"

\
To use: 
1. Put your frontpage in `frontend/index.html`.
2. Run `backend.sh`.
3. Select if the program should be verbose by useíng the `-v` flag.
4. Choose the port by using the `-p` flag and putting the port number after it.

    **Warning!** Ports 1024 and under need root privaledges to use!
5. Enjoy!
---
By Nikolas "Koodarimpi" Lehto. (Please refer to the licence.)