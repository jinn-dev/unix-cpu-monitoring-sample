kill -9 $(ps -ef |grep brex_mon.sh |awk '{print $2}')
