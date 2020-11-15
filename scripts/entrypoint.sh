#!/bin/sh

#export HADOOP_HOME=/usr/local/hadoop-3.2.0
export HIVE_HOME=/usr/local/apache-hive-metastore-3.0.0-bin
export JAVA_HOME=/usr
export PATH=$PATH:$HIVE_HOME/bin

# schematool -initSchema -dbType mysql
nohup start-metastore 1> /dev/null 2>&1 &

cd /home/jovyan/work
jupyter lab --ip=0.0.0.0 --port=8888 --allow-root --no-browser

