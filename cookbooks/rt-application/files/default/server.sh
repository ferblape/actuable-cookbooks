#!/bin/bash

SERVER=app.js
PIDFILE=/var/www/actuable-rt/app.pid

PID=`ps aux | grep node | grep -v grep | awk '{print $2}'`
kill $PID
echo "Killing... "$PID
rm $PIDFILE
sleep 5
nohup `which node` /var/www/actuable-rt/app.js > /var/www/actuable-rt/out.log &
sleep 1
PID=`ps aux | grep node | grep -v grep | awk '{print $2}'`
echo $PID > $PIDFILE
echo "Node running in "$PID