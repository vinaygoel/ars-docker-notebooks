#!/usr/bin/env bash

source /set-environment.sh

# Pig
if [ ! -d "$HADOOP_PIG_LOCAL_INSTALL_DIR" ]; then
  mkdir -p $HADOOP_PIG_LOCAL_INSTALL_DIR
  cd $HADOOP_PIG_LOCAL_INSTALL_DIR
  curl -O http://archive.org/~vinay/archive-analysis/hadoop-2-local-mode.tar.gz
  tar xfz hadoop-2-local-mode.tar.gz --no-same-owner
fi

# Kibana
if [ ! -d "$KIBANA_INSTALL_DIR" ]; then
  mkdir -p $KIBANA_INSTALL_DIR
  cd $KIBANA_INSTALL_DIR
  curl -O https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz
  tar xfz kibana-${KIBANA_VERSION}-linux-x64.tar.gz --no-same-owner
  mv kibana-${KIBANA_VERSION}-linux-x64 kibana-${KIBANA_VERSION}
  echo "server.port: ${KIBANA_PORT}" >> kibana-${KIBANA_VERSION}/config/kibana.yml
  echo "elasticsearch.url: \"http://localhost:${ELASTICSEARCH_PORT}\"" >> kibana-${KIBANA_VERSION}/config/kibana.yml
fi

# Elasticsearch
if [ ! -d "$ELASTICSEARCH_INSTALL_DIR" ]; then
  mkdir -p $ELASTICSEARCH_INSTALL_DIR
  cd $ELASTICSEARCH_INSTALL_DIR
  curl -O https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz
  tar xfz elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz --no-same-owner
  echo "path.data: /ars-elasticsearch-index-data" >> elasticsearch-${ELASTICSEARCH_VERSION}/config/elasticsearch.yml
  echo "http.port: ${ELASTICSEARCH_PORT}" >> elasticsearch-${ELASTICSEARCH_VERSION}/config/elasticsearch.yml
fi
