#!/bin/sh

if [ $# -ne 1 ]; then
	echo "Usage `basename $0` [start|stop|restart]"
	exit
fi

TIMESS=`date +%s`
PROGRAM='example-server'

function Start() {
	/home/bin/$PROGRAM -c /home/conf/example.conf > /home/tmp/logs/$TIMESS.log &
	PID=`ps -ef | grep $PROGRAM | grep -v 'grep' | awk '{print $2}'`
	if [ -z $PID ]; then
		:
	else
		echo "New PID[$PID]"
  fi
}

function Stop() {
	PID=`ps -ef | grep $PROGRAM | grep -v 'grep' | awk '{print $2}'`
	if [ -z $PID ]; then
		:
	else
		echo "Kill PID[$PID]"
	  kill $PID
	fi
}

function Restart() {
	Stop
	sleep 1
	Start
}

case $1 in
	'start')
		echo "Start $PROGRAM"
		Start
		;;
	'stop')
		echo "Stop $PROGRAM"
		Stop
		;;
	'restart')
		echo "Restart $PROGRAM"
		Restart
		;;
	*)
		echo "Usage `basename $0` [start|stop|restart]"
esac
