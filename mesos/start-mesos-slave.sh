#!/bin/bash

LOCAL_IP=`ifdata -pa $INTERFACE`

mesos-slave --ip=$LOCAL_IP \
            --master=zk://$MASTER_IP:2181/mesos \
            --log_dir=/log/mesos \
            --hostname_lookup=false \
            --containerizers=docker,mesos \
            --executor_registration_timeout=10mins

