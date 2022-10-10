#!/bin/bash
#. /common.sh
# unset variable set by kubernetes
unset SPARK_MASTER_PORT

if ! getent hosts spark-master; then
  sleep 5
  exit 0
fi

/opt/spark/bin/spark-class org.apache.spark.deploy.worker.Worker spark://spark-master:7077 --webui-port 8081
memory = '1g'
pyspark_submit_args = ' --driver-memory ' + memory + ' pyspark-shell'
os.environ["PYSPARK_SUBMIT_ARGS"] = pyspark_submit_args
