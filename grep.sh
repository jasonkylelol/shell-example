#!/bin/sh

if [ $# -ne 1 ]; then
	  echo "Usage `basename $0` rpc_type"
		echo -e "1: QueryAllGroupSpreadDiff\n2: QueryAllSecgroup\n3: QueryLoginInstrumentSpreadInfo\n4: QueryUserSpreadInfo\n"
			  exit
fi
RPCNAME=:
LOGFILE=/data/forex/2c/test/mt4_info_server/logs/fx_2c_live_mt4_info_service.WARNING
case $1 in
	1)  
		RPCNAME=QueryAllGroupSpreadDiff
	;;  
	2)  
		RPCNAME=QueryAllSecgroup
	;;  
	3)  
		RPCNAME=QueryLoginInstrumentSpreadInfo
  ;;  
	4)  
		RPCNAME=QueryUserSpreadInfo
	;;  
	*)  
		echo "Usage `basename $0` rpc_type"
	  echo -e "1: QueryAllGroupSpreadDiff\n2: QueryAllSecgroup\n3:QueryLoginInstrumentSpreadInfo\n4:QueryUserSpreadInfo\n"
	  exit
esac

grep $RPCNAME $LOGFILE | grep "^W.*" | awk -F':' '{print $5}' | awk -F'ms' \
	'BEGIN{cnt=0;val=0} {cnt+=1;val+=$1} END{if(cnt > 0) printf("cnt:%d, val:%d, avg:%f\n", cnt, val, (float)val/cnt)}'

