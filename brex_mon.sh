#!/bin/sh

while true
do
  ./cpu_mon_start.sh
  sleep 5
  ./cpu_mon_stop.sh
  sleep 175

done
