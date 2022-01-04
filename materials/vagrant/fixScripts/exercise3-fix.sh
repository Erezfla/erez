#!/bin/bash
#add fix to exercise3 here
cd /etc/apache2/sites-enabled
sudo sed -i '33s/denied/granted/g' 000-default.conf
sudo service apache2 restart
