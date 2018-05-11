#!/bin/sh
cd /root/etc-netstats
while true
do
if [ ! `pgrep node` ] ; then
	node ./bin/www
fi
sleep 10
done
