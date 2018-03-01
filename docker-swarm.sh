#!/bin/bash

# Docker script to discover swarm and the basics of nodes

clear

docker --version
if [ $? -ne 0 ]
then
    echo "You need to install docker to use this script"
    sleep 3
    exit
fi

echo "#############################################################"
echo "#                                                           #"
echo "#          Welcome in the swarm script for Docker           #"
echo "#                                                           #"
echo "#############################################################"
echo "#"
echo "Press 1 to activate swarm on your docker install"
echo "#"
echo "Press 2 to create some nodes"
echo "#"
echo "Press 3 to run a bunch of containers"
echo "#"
echo "Press 4 "
echo "#"
echo "Press 5 to quit this script"
read menuS

case "$menuS" in

"1")
;;

"2")
;;

"3")
;;

"4")
;;

"5")
echo "You are leaving this script, goodbye & see you soon"
rm dump.txt
sleep 2
clear
;;

*)
echo "This number is not a viable option"
sleep 2 
exec /home/kam/Courses/Docker/nuke-docker.sh;
;;

esac