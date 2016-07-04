#!/bin/bash

echo -e "\nbuild docker zookeeper image\n"
sudo docker build -f zookeeper/Dockerfile -t kiwenlau/zookeeper:3.4.8 ./zookeeper

echo -e "\nbuild docker mesos image\n"
sudo docker build -f mesos/Dockerfile -t kiwenlau/mesos:0.26.0 ./mesos

echo -e "\nbuild docker marathon image\n"
sudo docker build -f marathon/Dockerfile -t kiwenlau/marathon:1.1.1 ./marathon

echo -e "\nbuild docker marathon-lb image\n"
sudo docker build -f marathon-lb/Dockerfile -t kiwenlau/marathon-lb:1.3.0 ./marathon-lb

echo ""