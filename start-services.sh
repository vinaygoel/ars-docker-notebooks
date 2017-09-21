#!/usr/bin/env bash

source /set-environment.sh

#run ES in the background (port 9200)
ps aux | grep -v grep | grep elasticsearch > /dev/null
if [ $? -ne 0 ]; then
   $ELASTICSEARCH_HOME/bin/elasticsearch -d
fi

#run Kibana in the background (port 5601)
ps aux | grep -v grep | grep kibana > /dev/null
if [ $? -ne 0 ]; then
   nohup $KIBANA_HOME/bin/kibana 2> /dev/null &
fi

# Run Jupyter notebook in the background (port 8888)
ps aux | grep -v grep | grep jupyter > /dev/null
if [ $? -ne 0 ]; then
   nohup jupyter notebook --ip='*' --port=8888 --no-browser --allow-root 2> /dev/null &
fi
