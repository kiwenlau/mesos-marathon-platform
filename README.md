## Run Mesos/Marathon Platform within Docker Containers

3 nodes with [Docker](https://www.docker.com/) installed, are needed for running this project:

| Node    | IP           | Container                                      |
|:------- |:-------------| :----------------------------------------------|
| Master  | 192.168.59.1 | zookeeper, mesos_master, marathon, marathon-lb |
| Slave1  | 192.168.59.2 | mesos_slave1                                   |
| Slave2  | 192.168.59.3 | mesos_slave2                                   |

##### 1. Open docker daemon tcp port

On Master, Slave1 and Slave2:

```
sudo vim /etc/default/docker
```

change **DOCKER_OPTS**

```
DOCKER_OPTS="-H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock"
```

restart docker

```
sudo restart docker
```

##### 2. Pull docker images

On Master:

```
sudo docker pull kiwenlau/marathonlb:1.3.0
sudo docker pull kiwenlau/marathon:1.1.1  
sudo docker pull kiwenlau/mesos:0.26.0    
sudo docker pull kiwenlau/zookeeper:3.4.8 
```

On Slave1 and Slave2:

```
sudo docker pull kiwenlau/mesos:0.26.0
```

##### 3. Clone github repository

On Master:

```
git clone https://github.com/kiwenlau/mesos-marathon-platform
```


##### 4. Run mesos/marathon platform within docker containers

On Master:

```
cd mesos-marathon-platform
sudo ./start-containers.sh
```

- Mesos Web UI: [http://192.168.59.1:5050/](http://192.168.59.1:5050/)
- Marathon Web UI: [http://192.168.59.1:8080/](http://192.168.59.1:8080/)  

#####5. Run nginx on mesos/marathon platform:

On Slave1 and Slave2:

```
sudo docker pull nginx:1.10
```

On Master

```
sudo ./run-nginx.sh 
```

visit nginx: [http://192.168.59.1:10000/](http://192.168.59.1:10000/)