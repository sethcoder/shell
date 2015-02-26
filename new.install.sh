distro=$(cat /etc/*-release | grep DISTRIB_ID | sed s/DISTRIB_ID=// | tr '[:upper:]' '[:lower:]')
codebase=$(cat /etc/*-release | grep DISTRIB_CODENAME | sed s/DISTRIB_CODENAME=//)

if [ -z "$distro" ]; then
   echo "DISTRO not defined from DISTRIB_ID, checking PRETTY_NAME:";

   d=$(cat /etc/*-release | grep "PRETTY_NAME=" | sed "s/PRETTY_NAME=//")
   codebase=$(echo $d | sed "s/[ a-Z0-9.\/]*(//" | sed "s/)//")
   distro=$(echo $d | sed "s/ GNU\/Linux[ a-Z0-9.]*([a-Z0-9]*)//" | tr '[:upper:]' '[:lower:]')

   echo $distro;
   echo $codebase

   if [ -z "$distro" ]; then
       echo "Can not determine linux distro and codebase";
       exit
   fi
fi

echo "New install script for $distro $codebase"
echo "======================================================================="

#sudo echo 'parson ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
#sudo echo 'sparson ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

sudo apt-get update

# MISC NEW INSTALL PROGRAMS
sudo apt-get install guake terminator mc sshfs gparted -y
sudo apt-get install gimp youtube-dl -y

# LAMP STUFF
sudo apt-get install apache2 mysql-server php5 phpmyadmin -y
sudo apt-get install apache2-mpm-prefork apache2-utils -y
sudo apt-get install libapache2-mod-php5 libapr1 libaprutil1 -y
sudo apt-get install libdbd-mysql-perl libdbi-perl libnet-daemon-perl -y
sudo apt-get install libplrpc-perl libpq5 mysql-client-5.5 mysql-common -y
sudo apt-get install php5-gd php5-mysql php5-imagick p7zip-full -y
sudo apt-get install wkhtmltopdf pev unadf xdms unace -y

# ZSH
sudo apt-get install zsh -y
echo "Enter password to change shell to zsh "
chsh -s /bin/zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/shell/.zshrc ~/.zshrc

# GOOGLE CHROME
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

########################### DEVELOPMENT SECTION

# CODELITE
sudo apt-key adv --fetch-keys http://repos.codelite.org/CodeLite.asc
sudo apt-add-repository "deb http://repos.codelite.org/$distro/ $codebase universe"
sudo apt-get update
sudo apt-get install codelite wxcrafter -y

# GIT / SUBVERSION
sudo apt-get install git -y
git config --global push.default simple
git config --global user.name "Seth Parson"
git config --global user.email "seth@parson.email"
sudo apt-get install subversion -y

# JAVA
sudo echo "deb http://ppa.launchpad.net/webupd8team/java/$distro $codebase main" | sudo tee /etc/apt/sources.list.d/webupd8team-java.list
sudo echo "deb-src http://ppa.launchpad.net/webupd8team/java/$distro $codebase main" | sudo tee -a /etc/apt/sources.list.d/webupd8team-java.list
sudo apt-key adv --keyserver "keyserver.$distro.com" --recv-keys EEA14886
sudo apt-get update
sudo apt-get install oracle-java7-installer -y
sudo apt-get install oracle-java7-set-default -y

# OTHER DEV STUFF
sudo apt-get install python2.7 python3.4 ansible lua5.2 -y

echo "======================================================================="
