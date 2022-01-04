#!/bin/bash
#echo "1"
if [ $# -lt 2 ]; then
#    echo "2"
#   echo "you have to pass atleast 2 arguments"
    exit 1
fi
#echo "3"
blocks=()
files_sum=0
#go over all arguments except last
#echo "4"
for i in ${@:1:$#-1};
  do :
     echo "adding file" $i
     blocks+=("$i")
     bytes=$(wc -c $i | awk '{print $1}')
     files_sum=$((files_sum + bytes))
  done
files_list="${blocks[@]}"
echo "my full files list is: " $files_list
dest_folder="${@: -1}"
org_server=`hostname`
dest_server=''
if [ $org_server = "server1" ]
        then dest_server="server2"
fi
if [ $org_server = "server2" ]
        then dest_server="server1"
fi
scp $files_list $dest_server:$dest_folder
#print sum of all files
echo $files_sum
