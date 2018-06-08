
#!/bin/sh
OLD_QueryAllGroupSpreadDiff_FILES=`ls ./rpc_test/QueryAllGroupSpreadDiff/*`
OLD_QueryAllSecgroup_FILES=`ls ./rpc_test/QueryAllSecgroup/*`
OLD_QueryLoginInstrumentSpreadInfo_FILES=`ls ./rpc_test/QueryLoginInstrumentSpreadInfo/*`
OLD_QueryUserSpreadInfo_FILES=`ls ./rpc_test/QueryUserSpreadInfo/*`
NEW_QueryAllGroupSpreadDiff_FILES=`ls ./rpc_test_pipeline/QueryAllGroupSpreadDiff/*`
NEW_QueryAllSecgroup_FILES=`ls ./rpc_test_pipeline/QueryAllSecgroup/*`
NEW_QueryLoginInstrumentSpreadInfo_FILES=`ls ./rpc_test_pipeline/QueryLoginInstrumentSpreadInfo/*`
NEW_QueryUserSpreadInfo_FILES=`ls ./rpc_test_pipeline/QueryUserSpreadInfo/*`
#echo $OLD_QueryAllGroupSpreadDiff_FILES
for OLDFILE in $OLD_QueryAllGroupSpreadDiff_FILES; do
  for NEWFILE in $NEW_QueryAllGroupSpreadDiff_FILES; do
	  RET=`diff --brief $OLDFILE $NEWFILE`
		if [ -z $RET ]; then
		  :
      #echo "$OLDFILE is same with $NEWFILE"
	  else
			echo "$OLDFILE is different with $NEWFILE"
	  fi  
	done
done

