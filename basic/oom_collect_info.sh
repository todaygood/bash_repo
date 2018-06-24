#!/bin/sh

INTERVAL_MIN=120
 

LOG_FILE=/root/collect_info.txt

supportconfig 

while true;do
{
	date                >> ${LOG_FILE}
	
	echo "# /usr/bin/free -k"   >> ${LOG_FILE}
	free -k                     >> ${LOG_FILE}
	echo "-------"       >> ${LOG_FILE}	
	
	echo "# /proc/meminfo"  >> ${LOG_FILE}
	cat /proc/meminfo       >> ${LOG_FILE}
	echo "-------"       >> ${LOG_FILE}	
	
	echo "# /proc/vmstat"   >> ${LOG_FILE}
	cat /proc/vmstat        >> ${LOG_FILE}
	echo "-------"       >> ${LOG_FILE}	
	
	echo "# /proc/buddyinfo"    >> ${LOG_FILE}
	cat /proc/buddyinfo         >> ${LOG_FILE}
	echo "-------"              >> ${LOG_FILE}	
	
	echo "# /proc/slabinfo"     >> ${LOG_FILE}
	cat /proc/slabinfo          >> ${LOG_FILE}
	echo "-------"              >> ${LOG_FILE}	
	
	echo "# top -b -d 2 -n 1"      >> ${LOG_FILE}
	top -b -d 2 -n 1             >> ${LOG_FILE}
	echo "-------"               >> ${LOG_FILE}	

    echo "# vmstat 1 4 "           >> ${LOG_FILE}
	vmstat 1 4                   >> ${LOG_FILE}
	echo "-------"               >> ${LOG_FILE}	
	
	
	
	echo "# ps -elf"              >> ${LOG_FILE}
	ps -elf                     >> ${LOG_FILE}	
	echo "-------"              >> ${LOG_FILE}	
	
	echo "# sar -rR 1 4"          >> ${LOG_FILE}
	sar -rR 1 4                 >> ${LOG_FILE}
	
	echo "++++++++++++++"       >> ${LOG_FILE}	

	sleep $INTERVAL_MIN
	
}
done


