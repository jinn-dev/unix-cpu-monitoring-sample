kill -9 $(ps -ef |grep adviser_only | grep monitor_cpu.adv|awk '{print $2}')
