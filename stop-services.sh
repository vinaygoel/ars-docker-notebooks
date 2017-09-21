#!/usr/bin/env bash

ps -aef | grep "jupyter" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL
ps -aef | grep "kibana" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL
ps -aef | grep "elasticsearch" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL
