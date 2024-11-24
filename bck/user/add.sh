sudo useradd $1
sudo passwd $1
sudo mkdir /home/$1
sudo chown $1 /home/$1
sudo usermod -a -G users $1
