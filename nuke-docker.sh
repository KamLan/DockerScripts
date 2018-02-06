#!/bin/bash

#Script automation for Docker cleanup

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
echo "#   Welcome in the automated cleanup script for Docker      #"
echo "#                                                           #"
echo "#############################################################"
echo "#"
echo "Press 1 if you want to delete all the current containers"
echo "#"
echo "Press 2 if you want to delete all the current volumes"
echo "#"
echo "Press 3 if you want to delete all the current images"
echo "#"
echo "Press 4 if you want to delete all the current services"
echo "#"
echo "Press 5 to quit this script"
read menuS

case "$menuS" in

"1")
echo "Here are the containers currently on your machine: "
docker ps -a > dump.txt
cat dump.txt
echo "This will delete all the containers running or not, please confirm Y/N"
read confirm
if [ $confirm = Y ]
then
    echo "All containers are being suppressed ..."
    docker rm $(docker ps -a -q) -f 
    echo "All container have been deleted, you are goind back to the main menu"
    sleep 3
else
    echo "The containers will be safe, you are going back to the main menu ..."
    sleep 3
fi
    clear
    exec /home/kam/Courses/Docker/nuke-docker.sh;
;;

"2")
echo "Here are the volumes currently on your machine"
docker volume ls > dump.txt
cat dump.txt
echo "This will delete all the volumes on your machine, please confirm Y/N"
read confirm
if [ $confirm = Y ]
then
    echo "All volumes are being suppressed ..."
    docker volume rm $(docker volume ls -q) -f 
    echo "All volumes have been deleted, you are goind back to the main menu"
    sleep 3
else
    echo "The volumes will be safe, you are going back to the main menu ..."
    sleep 3
fi
    clear
    exec /home/kam/Courses/Docker/nuke-docker.sh;
;;

"3")
echo "Here are the images currently on your machine"
docker image ls | sort > dump.txt
cat dump.txt
echo "This will delete all the images on your machine, please confirm Y/N"
read confirm
if [ $confirm = Y ]
then
    echo "All images are being suppressed ..."
    #docker rmi $(docker image -q) -f 
    echo "All images have been deleted, you are goind back to the main menu"
    sleep 3
else
    echo "The images will be safe, you are going back to the main menu ..."
    sleep 3
fi
    clear
    exec /home/kam/Courses/Docker/nuke-docker.sh;
;;

"4")
echo "Here are the services currently on your machine"
docker service ls > dump.txt
cat dump.txt
echo "This will delete all the services on your machine, please confirm Y/N"
read confirm
if [ $confirm = Y ]
then
    echo "All services are being suppressed ..."
    docker service rm $(docker service ls -q) 
    echo "All services have been deleted, you are goind back to the main menu"
    sleep 3
else
    echo "The services will be safe, you are going back to the main menu ..."
    sleep 3
fi
    clear
    exec /home/kam/Courses/Docker/nuke-docker.sh;
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