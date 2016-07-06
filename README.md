## Run Mesos/Marathon Platform within Docker Containers

3 nodes with [Docker](https://www.docker.com/) installed, are needed for running this project:

| Node    | IP           | Container                                      |
|:------- |:-------------| :----------------------------------------------|
| Master  | 192.168.59.1 | zookeeper, mesos_master, marathon, marathon-lb |
| Slave1  | 192.168.59.2 | mesos_slave1                                   |
| Slave2  | 192.168.59.3 | mesos_slave2                                   |

#### 1. Pull docker images

**Master:**

```
sudo docker pull kiwenlau/marathonlb:1.3.0
sudo docker pull kiwenlau/marathon:1.1.1  
sudo docker pull kiwenlau/mesos:0.26.0    
sudo docker pull kiwenlau/zookeeper:3.4.8 
```

**Slave1 and Slave2:**

```
sudo docker pull kiwenlau/mesos:0.26.0
```

#### 2. Clone GitHub Repository

```
git clone https://github.com/kiwenlau/mesos-marathon-platform
```

#### 3. Run Mesos/Marathon Platform within Docker Containers

```
cd mesos-marathon-platform
sudo ./start-containers.sh
```