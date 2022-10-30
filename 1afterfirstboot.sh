# create a separate stack user to run DevStack
sudo useradd -s /bin/bash -d /opt/stack -m stack

# ensure home directory for the stack user has executable permission for all
sudo chmod +x /opt/stack

# giving sudo privileges & swapping user
echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack
sudo -u stack -i

# update & install packages from rhel repos & RDO repo
sudo dnf install -y https://www.rdoproject.org/repos/rdo-release.el8.rpm

subscription-manager repos  \
--enable=rhel-8-for-x86_64-baseos-rpms \
--enable=rhel-8-for-x86_64-appstream-rpms \
--enable=rhel-8-for-x86_64-highavailability-rpms \
--enable=rhel-8-for-x86_64-supplementary-rpms \
--enable=codeready-builder-for-rhel-8-x86_64-rpms

sudo dnf update -y

# install networks-scripts & disabling firewall
sudo dnf install network-scripts -y
sudo systemctl disable firewalld
sudo systemctl stop firewalld
sudo systemctl disable NetworkManager
sudo systemctl stop NetworkManager
sudo systemctl enable network
sudo systemctl start network
