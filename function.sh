#!/bin/sh
TESTNUM=10
TESTDIR=$PWD/rpc_test

function rpc_QueryAllGroupSpreadDiff() {
	TIMESTAMP=`date | awk '{print $4}' | sed 's/\:/-/g'`
	FILE=$TESTDIR/QueryAllGroupSpreadDiff/resp_QueryAllGroupSpreadDiff_$TIMESTAMP.txt
	$PWD/MT4InfoService-remote -h 127.0.0.1:7913 \
		-f QueryAllGroupSpreadDiff "QueryAllGroupSpreadDiffReq(client_flag='xx')" \
		> $FILE 2>&1
	echo "$TIMESTAMP rpc_QueryAllGroupSpreadDiff query ok"
}

function rpc_QueryAllSecgroup() {
	TIMESTAMP=`date | awk '{print $4}' | sed 's/\:/-/g'`
	FILE=$TESTDIR/QueryAllSecgroup/resp_QueryAllSecgroup_$TIMESTAMP.txt
	$PWD/MT4InfoService-remote -h 127.0.0.1:7913 \
		-f QueryAllSecgroup "QueryAllSecgroupReq(client_flag='xx')" \
		> $FILE 2>&1
	echo "$TIMESTAMP rpc_QueryAllSecgroup query ok"
}

function rpc_QueryLoginInstrumentSpreadInfo() {
	TIMESTAMP=`date | awk '{print $4}' | sed 's/\:/-/g'`
	FILE=$TESTDIR/QueryLoginInstrumentSpreadInfo/resp_QueryLoginInstrumentSpreadInfo_$TIMESTAMP.txt
	$PWD/MT4InfoService-remote -h 127.0.0.1:7913 \
		-f QueryLoginInstrumentSpreadInfo "QueryLoginInstrumentSpreadInfoReq( \
		mt4_logins_instruments=[LoginInstrument(mt4_login=22783781, \
		instrument=[200037, 200026])])" \
		> $FILE 2>&1
	echo "$TIMESTAMP rpc_QueryLoginInstrumentSpreadInfo query ok"
}

function rpc_QueryUserSpreadInfo() {
	TIMESTAMP=`date | awk '{print $4}' | sed 's/\:/-/g'`
	FILE=$TESTDIR/QueryUserSpreadInfo/resp_QueryUserSpreadInfo_$TIMESTAMP.txt
	$PWD/MT4InfoService-remote -h 127.0.0.1:7913 \
		-f QueryUserSpreadInfo "QueryUserSpreadInfoReq(mt4_logins=[22783781])" \
		> $FILE 2>&1
	echo "$TIMESTAMP rpc_QueryUserSpreadInfo query ok"
}

for ((i = 0; i < $TESTNUM; i++))
do
	echo "Query `expr $i + 1` times"
	rpc_QueryAllGroupSpreadDiff
	rpc_QueryAllSecgroup
	rpc_QueryLoginInstrumentSpreadInfo
	rpc_QueryUserSpreadInfo
	sleep 2

done

