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
  curl -O https://download.elastic.co/kibana/kibana/kibana-4.0.2-linux-x64.tar.gz
  tar xfz kibana-4.0.2-linux-x64.tar.gz --no-same-owner
  mv kibana-4.0.2-linux-x64 kibana-4.0.2
fi

# Elasticsearch
if [ ! -d "$ELASTICSEARCH_INSTALL_DIR" ]; then
  mkdir -p $ELASTICSEARCH_INSTALL_DIR
  cd $ELASTICSEARCH_INSTALL_DIR
  curl -O https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.5.2.tar.gz
  tar xfz elasticsearch-1.5.2.tar.gz --no-same-owner
  echo "path.data: /ars-elasticsearch-index-data" >> elasticsearch-1.5.2/config/elasticsearch.yml
fi
