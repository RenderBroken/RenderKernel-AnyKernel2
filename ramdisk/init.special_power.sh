#!/system/bin/sh

################################################################################
# helper functions to allow Android init like script

function write() {
    echo -n $2 > $1
}

function copy() {
    cat $1 > $2
}

# macro to write pids to system-background cpuset
function writepid_sbg() {
    if [ ! -z "$1" ]
        then
            echo -n $1 > /dev/cpuset/system-background/tasks
    fi
}

function writepid_top_app() {
    if [ ! -z "$1" ]
        then
            echo -n $1 > /dev/cpuset/top-app/tasks
    fi
}
################################################################################

sleep 10

project=`getprop ro.boot.project_name`

case "$project" in
    "15811")
		# input boost configuration
		echo "0:1132800 2:1132800" > /sys/module/cpu_boost/parameters/input_boost_freq
		echo 1500 > /sys/module/cpu_boost/parameters/input_boost_ms
    ;;
esac

case "$project" in
    "15801")
		# input boost configuration
		echo "0:1113600 2:1113600" > /sys/module/cpu_boost/parameters/input_boost_freq
		echo 1500 > /sys/module/cpu_boost/parameters/input_boost_ms
    ;;
esac

sleep 20

QSEECOMD=`pidof qseecomd`
THERMAL-ENGINE=`pidof thermal-engine`
TIME_DAEMON=`pidof time_daemon`
IMSQMIDAEMON=`pidof imsqmidaemon`
IMSDATADAEMON=`pidof imsdatadaemon`
DASHD=`pidof dashd`
CND=`pidof cnd`
DPMD=`pidof dpmd`
RMT_STORAGE=`pidof rmt_storage`
TFTP_SERVER=`pidof tftp_server`
NETMGRD=`pidof netmgrd`
IPACM=`pidof ipacm`
QTI=`pidof qti`
LOC_LAUNCHER=`pidof loc_launcher`
QSEEPROXYDAEMON=`pidof qseeproxydaemon`
IFAADAEMON=`pidof ifaadaemon`
LOGCAT=`pidof logcat`
LMKD=`pidof lmkd`

writepid_sbg $QSEECOMD
writepid_sbg $THERMAL-ENGINE
writepid_sbg $TIME_DAEMON
writepid_sbg $IMSQMIDAEMON
writepid_sbg $IMSDATADAEMON
writepid_sbg $DASHD
writepid_sbg $CND
writepid_sbg $DPMD
writepid_sbg $RMT_STORAGE
writepid_sbg $TFTP_SERVER
writepid_sbg $NETMGRD
writepid_sbg $IPACM
writepid_sbg $QTI
writepid_sbg $LOC_LAUNCHER
writepid_sbg $QSEEPROXYDAEMON
writepid_sbg $IFAADAEMON
writepid_sbg $LOGCAT
writepid_sbg $LMKD
