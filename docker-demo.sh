#!/bin/bash

#Script automation demonstration of Docker

clear

docker --version
if [ $? -ne 0 ]
then
    echo "You need to install docker to use this script"
    sleep 3
    exit
fi

echo "#################################################################"
echo "#                                                               #"
echo "#    Welcome in the automated demonstration script of  Docker   #"
echo "#                                                               #"
echo "#################################################################"
echo "#"
echo "Press 1 if you want to see the creation of a container"
echo "#"
echo "Press 2 if you want to setup a development environment"
echo "#"
echo "Press 3 if you want to setup a production environement"
echo "#"
echo "Press 4 if you want to setup a continuous integration process environment"
echo "#"
echo "Press 5 to quit this script"
read menuS

case "$menuS" in

"1")
echo "You have picked to see the creation of a container !: "
echo "docker container run --name nginx --rm -d -p 8088:80 nginx:latest"
docker container run --name nginx --rm -d -p 8088:80 nginx:latest > dump.txt
cat dump.txt
docker container inspect nginx | grep IPAddress  > dump.txt
echo "This command has run a container of a nginx server you can reach it on:"
echo "127.0.0.1:8088" 
echo "or the container ip address below, at the port : 80"
cat dump.txt
sleep 3
echo "Press any key to clean the container and the associated" 
echo "volumes and go back to the main menu"
read goback
    case "$goback" in
    *)
    docker container stop nginx
    clear
    exec /home/kam/Courses/Docker/Scripts/docker-demo.sh;
    ;;
    esac
;;

"2")
echo "You have picked to see the creation of a development environment"
echo "docker container run --name node-envir --rm -d -p 3000:3000 nodejs-example-envir"
docker container run --name node-envir --rm -d -p 3000:3000 nodejs-example-envir > dump.txt
cat dump.txt
docker container inspect node-envir | grep IPAddress > dump.txt
echo "This command has run a container with an installation of nodeJs and the nodeJs framework Express:"
echo "127.0.0.1:3000" 
echo "or the container ip address below at the port : 3000"
cat dump.txt
sleep 3
echo "Press any key to clean the container and the associated" 
echo "volumes and go back to the main menu"
read goback
    case "$goback" in
    *)
    docker container stop node-envir
    clear
    exec /home/kam/Courses/Docker/Scripts/docker-demo.sh;
    ;;
    esac
;;

"3")
echo "You have picked to see the creation of a production environment"
echo "docker container run --name tomcat-prod --rm -d -p 8090:8080 tomcat-custom-deploy"
docker container run --name tomcat-prod --rm -d -p 8090:8080 tomcat-custom-deploy > dump.txt
cat dump.txt
docker container inspect tomcat-prod | grep IPAddress > dump.txt
echo "This command has run a container of a tomcat server which has deployed a war file, you can reach it on:"
echo "127.0.0.1:8088/sample" 
echo "your login to access tomcat manager is manager/root" 
echo "or the container ip address below at the port : 8080/sample"
cat dump.txt
sleep 3
echo "Press any key to clean the container and the associated" 
echo "volumes and go back to the main menu"
read goback
    case "$goback" in
    *)
    docker container stop tomcat-prod
    clear
    exec /home/kam/Courses/Docker/Scripts/docker-demo.sh;
    ;;
    esac
;;

"4")
echo "You have pick to see the creation of a continous integration process environment"
echo "docker-compose up -d"
docker-compose up -d > dump.txt
cat dump.txt
echo "Tomcat container, ip address below and port : 8080"
docker container inspect scripts_tomcat_1 | grep IPAddress > dump.txt
cat dump.txt
echo "Sonarqube container, ip address below and port : 9000"
docker container inspect scripts_sonarqube_1 | grep IPAddress > dump.txt
cat dump.txt
echo "GitLab container, ip address below and port : 80"
docker container inspect scripts_gitlab_1 | grep IPAddress > dump.txt
cat dump.txt
echo "Jenkins container, ip address below and port : 8080"
docker container inspect scripts_jenkins_1 | grep IPAddress > dump.txt
cat dump.txt
sleep 3
echo "Press any key to clean the containers and the associated" 
echo "volumes and go back to the main menu"
read goback
    case "$goback" in
    *)
    docker-compose down
    clear
    exec /home/kam/Courses/Docker/Scripts/docker-demo.sh;
    ;;
    esac
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
exec /home/kam/Courses/Docker/Scripts/docker-demo.sh;
;;
esac