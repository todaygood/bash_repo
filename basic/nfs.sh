#!/bin/sh 
# 
# description: Starts the nfs server \ 
# Script by JM, based on script from \
# http://wiki.tuxbox.org/NAS:Buffalo_Linkstation_II plus \
# further hacks and fixes from linkstationwiki.net
#

PATH=/sbin:/bin:/usr/sbin:/usr/bin 

# Set the number of servers to be started. 
# For industrial strength nfs use 8 (if the LS2 can handle it) 
RPCNFSDCOUNT=3 
 
tag=linkstation 
facility=user.info 
 
# Avoid using root's TMPDIR 
unset TMPDIR 
 
# check for modules 
sunrpcok=`lsmod | grep ^sunrpc` 
lockdok=`lsmod | grep ^lockd` 
nfsdok=`lsmod | grep ^nfsd` 
nfsok=`lsmod | grep -w ^nfs` 
 
start() 
{ 
        if [ ! -r /etc/exports ] ; then 
                echo "nfs not started, nothing exported" 
                logger -t ${tag} -p ${facility} -i 'nfs not started, nothing exported' 
                exit 0 
        fi 
        # TODO: List individual services 
        echo "Start services: nfs" 
        cd /root 
 
        # 
        # nfs needs a few important status files in /var/lib/nfs. However, /var 
        # is on the ram disk of the LS2, so these files are lost after a 
        # reboot. We create empty substitutes for a start in case there 
        # are non. 
        # 
        mkdir -p /var/lib/nfs 
        mkdir -p /var/lib/nfs/sm 
        mkdir -p /var/lib/nfs/sm.bak 
        # rmtab needs to be a file, but someone sometimes creates it as a directory ... 
        [ -d /var/lib/nfs/rmtab ] && rm -rf /var/lib/nfs/rmtab 
        touch /var/lib/nfs/rmtab 
        touch /var/lib/nfs/state 
        touch /var/lib/nfs/etab 
 
        # Now insert the modules if they're not<client ip> running 
        if [ "$sunrpcok" = "" ]; then 
                /sbin/insmod /lib/modules/sunrpc.o 
        else 
                echo "nfs: sunrpc module already loaded" 
        fi 
 
        if [ "$lockdok" = "" ]; then 
                /sbin/insmod /lib/modules/lockd.o 
        else 
                echo "nfs: lockd module already loaded" 
        fi 
 
        if [ "nfsok" = "" ]; then 
                /sbin/insmod /lib/modules/nfs.o 
        else 
                echo "nfs: nfs module already loaded" 
        fi 
        if [ "$nfsdok" = "" ]; then 
                /sbin/insmod /lib/modules/nfsd.o 
        else 
                echo "nfs: nfsd module is already loaded" 
        fi 
        # 
        # Now run the daemons 
        # rpc.statd creates its own pidfile 
        # 
        /sbin/portmap 
        exportfs -r 
        start-stop-daemon --start --quiet  --exec /usr/sbin/rpc.mountd 
        start-stop-daemon --start --quiet  --exec /usr/sbin/rpc.statd 
        start-stop-daemon --start --quiet  --exec /usr/sbin/rpc.nfsd $RPCNFSDCOUNT 
 
        touch /var/lock/subsys/nfs 
        showmount -e 
        logger -t ${tag} -p ${facility} -i 'Started nfs' 
} 

stop() 
{ 
        # TODO: List individual services 
        echo "Stopping services: nfs" 
 
        exportfs -au 
        start-stop-daemon --stop --quiet  --exec /usr/sbin/rpc.mountd 
        start-stop-daemon --stop --quiet --pidfile /var/run/rpc.statd.pid 
        # nfsd needs KILL 
        start-stop-daemon --stop -s KILL -n nfsd 
        rm -f /var/lock/subsys/nfs 
        logger -t ${tag} -p ${facility} -i 'Stopped nfs' 
} 
 
case "$1" in 
start) 
        start 
;; 
stop) 
        stop 
;; 
restart) 
        echo "restarting nfs" 
        stop 
        sleep 10 
        start 
#       echo "starting rpc.mountd" 
#       start-stop-daemon --start --quiet --exec /usr/sbin/rpc.mountd 
#       echo "starting rpc.statd" 
#       start-stop-daemon --start --quiet  --exec /usr/sbin/rpc.statd 
#       echo "starting rpc.nfsd" 
#       start-stop-daemon --start --quiet  --exec /usr/sbin/rpc.nfsd $RPCNFSDCOUNT 
#       exportfs -r 
#       touch /var/lock/subsys/nfs 
#       showmount -e 
        ;; 
*) 
        echo "Usage: /etc/init.d/nfs {start|stop|restart}" >&2 
        exit 1 
        ;; 
esac 
exit 0 