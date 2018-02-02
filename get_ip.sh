#!/bin/bash
cd /home/zs/langyxxl
upnpc -l  |grep ExternalIPAddress |awk '{print $3}' >ipaddr.new
diff ipaddr ipaddr.new
if [[ $? != 0 ]]
then
    mv ipaddr.new ipaddr
    git add -A
    git commit -m "`date`"
    git push
fi

