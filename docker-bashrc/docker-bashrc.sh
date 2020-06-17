#!/bin/bash

# Get container id of exiting container
dgrep(){
    docker ps | grep "$1" | cut -c1-12
}

# bash into an existing container
dbash() {
    docker exec -ti $(docker ps -a | grep "$1" | cut -c1-12) /bin/bash
}

# Execute something in an existing container
dex() {
    docker exec -ti $(docker ps -a | grep "$1" | cut -c1-12)
}

# sh into an existing container
dsh() {
    docker exec -ti $(docker ps -a | grep "$1" | cut -c1-12) /bin/sh
}

# Start an existing container
dstart(){
    docker start $(docker ps -a | grep "$1" | cut -c1-12)
}

# Stop an existing container
dstop(){
    docker stop $(docker ps -a | grep "$1" | cut -c1-10)
}

# Get logs of an existing container
dlog(){
    docker logs $(docker ps -a | grep "$1" | cut -c1-10)
}


