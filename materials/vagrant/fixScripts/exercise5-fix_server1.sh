#!/bin/bash
#add fix to exercise5-server1 here

sudo sed -i 's/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/g' /etc/ssh/ssh_config

ssh-keygen -t rsa -b 4096 -N ""  -C "server1 ssh key" -f  /home/vagrant/.ssh/id_rsa
chown vagrant:vagrant /home/vagrant/.ssh/id_rsa
chown vagrant:vagrant /home/vagrant/.ssh/id_rsa.pub

cp /home/vagrant/.ssh/id_rsa.pub /vagrant/


ssh-keygen -t rsa -b 4096 -N ""  -C "server1 root ssh key" -f  ~/.ssh/id_rsa
cp ~/.ssh/id_rsa.pub /vagrant/id_rsa.pub_s1_root

cat /vagrant/id_rsa_s2.pub >> /home/vagrant/.ssh/authorized_keys

cat /vagrant/id_rsa.pub_s2_root >> ~/.ssh/authorized_keys
