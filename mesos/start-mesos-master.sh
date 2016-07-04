#!/bin/bash

LOCAL_IP=`ifdata -pa $INTERFACE`

mesos-master --ip=$LOCAL_IP \
             --zk=zk://$LOCAL_IP:2181/mesos \
             --quorum=1 \
             --work_dir=/var/lib/mesos \
             --log_dir=/log/mesos \
             --hostname_lookup=false

