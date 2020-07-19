#!/bin/bash

# Get container id of exiting container
dgrep(){
    docker ps -a | grep "$1" | cut -c1-12
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

# Remove an existing container
drm(){
    docker rm $(dgrep "$1")
}

# Stop and remove an existing container
dsrm(){
    dstop $(dgrep "$1") && drm $(dgrep "$1")
}

# Remove an existing image
dirm(){
    docker image remove $(dgrep "$1")
}

# Get logs of an existing container
dlog(){
    docker logs $(dgrep "$1")
}
