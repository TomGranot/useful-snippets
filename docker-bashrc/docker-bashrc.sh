#!/bin/bash

# Get container id of exiting container
dgrep(){
    docker ps | grep "$1" | cut -c1-12
}

# bash into an existing container
dbash() {
    docker exec -ti $(dgrep "$1") /bin/bash
}

# sh into an existing container
dsh() {
    docker exec -ti $(dgrep "$1") /bin/sh
}

# Execute something in an existing container
dex() {
    docker exec -ti $(dgrep "$1")
}

# Start an existing container
dstart(){
    docker start $(dgrep "$1")
}

# Stop an existing container
dstop(){
    docker stop $(dgrep "$1")
}

# Get logs of an existing container
dlog(){
    docker logs $(dgrep "$1")
}
