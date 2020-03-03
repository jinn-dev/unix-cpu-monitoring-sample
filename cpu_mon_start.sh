#!/bin/sh
MON_LOG_HOME=./log2/
DATE=`date "+%y%m%d%H%M%S"`

SYNTAX_FILE=monitor_cpu.adv
cat << __END__ > ${SYNTAX_FILE}

PRINT "======================================================================="
PRINT "DATE / TIME: ", GBL_STATDATE, " - ", GBL_STATTIME, " TOT_CPU_USE: ",GBL_CPU_TOTAL_UTIL
PRINT "======================================================================="
PRINT "PROCESS name |PROCESS id| CPU Usage"
PRINT "======================================================================="
PROCESS LOOP {
 if PROC_CPU_TOTAL_UTIL > 15 then {
  PRINT PROC_PROC_NAME|24, PROC_PROC_ID|10," ", PROC_CPU_TOTAL_UTIL|12
 }
}

print " "
__END__

nohup glance -j 60 -adviser_only -syntax ./monitor_cpu.adv 1>> $MON_LOG_HOME/log.$DATE 2>/dev/nu
ll &
