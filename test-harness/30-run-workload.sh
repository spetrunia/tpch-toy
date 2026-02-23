#!/bin/bash

source mysql-vars.sh

$MYSQL_CMD $MYSQL_ARGS dbt3s1 < tmp-mariadb/run-queries.sql | tee tmp-mariadb/log.txt

