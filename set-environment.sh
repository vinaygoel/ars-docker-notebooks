#!/usr/env/bin bash
export ARS_INSTALL_DIR=/ars-install
export JAVA_HOME=/usr

export KIBANA_VERSION=4.0.2
export ELASTICSEARCH_VERSION=1.5.2

export KIBANA_PORT=5061
export ELASTICSEARCH_PORT=9200

# installation directories
export HADOOP_PIG_LOCAL_INSTALL_DIR=$ARS_INSTALL_DIR/ars-hadoop-pig-local-install
export ELASTICSEARCH_INSTALL_DIR=$ARS_INSTALL_DIR/ars-elasticsearch-install
export ELASTICSEARCH_HOME=$ELASTICSEARCH_INSTALL_DIR/elasticsearch-${ELASTICSEARCH_VERSION}
export KIBANA_INSTALL_DIR=$ARS_INSTALL_DIR/ars-kibana-install
export KIBANA_HOME=$KIBANA_INSTALL_DIR/kibana-${KIBANA_VERSION}

# setting env variables
export HADOOP_INSTALL_DIR=$HADOOP_PIG_LOCAL_INSTALL_DIR/hadoop-2-local-mode
export HADOOP_HOME=$HADOOP_INSTALL_DIR/hadoop
export HADOOP_COMMON_HOME=$HADOOP_INSTALL_DIR/hadoop
export HADOOP_LIBEXEC_DIR=$HADOOP_COMMON_HOME/libexec
export HADOOP_YARN_HOME=$HADOOP_INSTALL_DIR/hadoop-yarn
export HADOOP_MAPRED_HOME=$HADOOP_INSTALL_DIR/hadoop-mapreduce
export HADOOP_BIN=$HADOOP_COMMON_HOME/bin/hadoop
export PIG_HOME=$HADOOP_INSTALL_DIR/pig
export YARN_COMMON_HOME=$HADOOP_YARN_HOME
export YARN_HOME=$HADOOP_YARN_HOME
if [ -z "$BASH_PROFILE_PATH" ]; then
    export BASH_PROFILE_PATH=$PATH
else
    export PATH=$BASH_PROFILE_PATH
fi
export PATH=$HADOOP_COMMON_HOME/bin:$HADOOP_YARN_HOME/bin:$HADOOP_INSTALL_DIR/pig/bin:$BASH_PROFILE_PATH
