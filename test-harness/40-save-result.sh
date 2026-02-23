#!/bin/bash

source mysql-vars.sh

VERSION=`$MYSQL_CMD $MYSQL_ARGS -BN -e'select version()'`
echo "select * from my_tpch_result" | $MYSQL_CMD $MYSQL_ARGS dbt3s1 | tee -a tmp-mariadb/$VERSION-result.csv

