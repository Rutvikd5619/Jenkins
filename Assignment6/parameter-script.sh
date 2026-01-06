#!/bin/bash

if [[ "$tools" == "Java" ]]
then
        java --version
        if [ $? -eq 0 ]
        then
                echo "java already installed"
        else
                dnf install java -y
                echo "Java installed sucessfully"
        fi

elif [[ "$tools" == "Git" ]]
then
        git --version
        if [ $? -eq 0 ]
        then
                echo "Git already installed."
        else
                dnf install git -y
                echo "git installed successfully."
        fi

elif [[ "$tools" == "tomcat" ]]
then
        if ls $tools /mnt>/dev/null
        then
                echo "tomcat already installed"
        else
                mkdir /mnt/tomcat
                cd /mnt/tomcat
                wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.50/bin/apache-tomcat-10.1.50.zip
                unzip apache-tomcat-10.1.50.zip
                rm -rf apache-tomcat-10.1.50.zip
                echo "Tomcat installed successfully."
        fi

elif [[ "$tools" == "maven" ]]
then
        mvn --version
        if [ $? -eq 0 ]
        then
                echo "Maven already installed"
        else
                mkdir /mnt/maven
                cd /mnt/maven
                wget https://dlcdn.apache.org/maven/maven-3/3.9.12/binaries/apache-maven-3.9.12-bin.zip
                unzip apache-maven-3.9.12-bin.zip
                rm -rf apache-maven-3.9.12-bin.zip
                echo 'export PATH="/mnt/maven/apache-maven-3.9.12/bin:$PATH"' >> ~/.bashrc
                echo "maven Installed successfully."
        fi

else
        echo "Wrong parameter"
fi
