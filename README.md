## Run Mesos/Marathon Platform within Docker Containers

There are 3 nodes with [Docker](https://www.docker.com/) installed.

| Node   | IP           | Container   |
|:------ |:-------------| :------------|
| Master | 192.168.59.1 | zookeeper, mesos-master, marathon, marathon-lb |
| Slave  | 192.168.59.2 | mesos-slave0 |
| Slave  | 192.168.59.3 | mesos-slave1 |

#### 1. Pull docker images

#### 2. Run Mesos/Marathon Platform within Docker Containers