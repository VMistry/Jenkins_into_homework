#Install Java
#This adds the PPA which contains Java. (Personal Package Archive, is a collection of software not included in Ubuntu by default).
sudo add-apt-repository ppa:webupd8team/java -y

#Download Oracle Java 8 Installer
#This will update any packages within the virtual box
sudo apt-get update -y
#This will upgrade any packages within the virtual box
sudo apt-get upgrade -y

echo debconf shared/accepted-oracle-license-v1-1 select true | \
sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | \
sudo debconf-set-selections
sudo debconf-get-selections

#The installer should install the latest Java JDK 8 on your Ubuntu machines.
sudo apt-get install oracle-java8-installer -y

#Configure Oracle JDK8 As Default
#This sets Oracle JDK8 as default
sudo apt-get install oracle-java8-set-default -y
#This will check the java version
javac -version

#Install Jenkins
#This adds the Jenkins repository to the system
#Add the repository key for the Jenkins software
cd /tmp && wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
#Then run the commands to add the repository
echo 'deb https://pkg.jenkins.io/debian-stable binary/' | sudo tee -a /etc/apt/sources.list.d/jenkins.list

#This will update any packages within the virtual box
sudo apt-get update -y
#This will install the jenkins software on the box
sudo apt-get install jenkins -y

#This can be used to stop, start and enable Jenkins to always start up when the server boots
sudo systemctl stop jenkins.service
sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service

#This is to give permission to access password for all(a) users
sudo chmod a+rwx /var/lib/jenkins/secrets
sudo chmod a+rwx /var/lib/jenkins/secrets/initialAdminPassword


#"sudo systemctl status jenkins" to activate


#Useful websites
#https://websiteforstudents.com/install-jenkins-on-ubuntu-16-04-17-10-18-04-lts-server/
