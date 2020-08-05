#!bin/bash
sudo apt-get install -y python-software-properties debconf-utils
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer
cd /root/
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-6.7.5.zip
cd /
mkdir sonar
chmod 777 sonar
mv /root/sonarqube-6.7.5.zip /sonar/sonarqube.zip
cd /sonar
chmod 666 sonarqube.zip
useradd fresco
(echo "fresco"; sleep 0.5; echo "fresco"; sleep 0.5; echo "fresco") | passwd
groupadd sonar
sudo usermod -a -G sonar fresco
(echo "unzip sonarqube.zip"; sleep 0.5; echo "ulimit -n 65536"; sleep 0.5; echo "/sonar/sonarqube-6.7.5/bin/linux-x86-64/sonar.sh console") | su fresco