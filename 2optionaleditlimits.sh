# optional edit processes limits
echo " # Default limit for number of user's processes to prevent
# accidental fork bombs.# See rhbz #432903 for reasoning.
*    soft  nproc  131070
*    hard  nproc  131070
*    soft  nofile 131070
*    hard  nofile 131070
root  soft  nproc  unlimited
stack soft  nproc  unlimited " | sudo tee /etc/security/limits.d/20-nproc.conf
  
sudo reboot  
