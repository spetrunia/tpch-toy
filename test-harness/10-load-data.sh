#!/bin/bash

source mysql-vars.sh

$MYSQL_CMD $MYSQL_ARGS -e "drop database if exists dbt3s1"
$MYSQL_CMD $MYSQL_ARGS -e "create database dbt3s1"

$MYSQL_CMD $MYSQL_ARGS dbt3s1 < test-harness/load-no-indexes.sql
$MYSQL_CMD $MYSQL_ARGS dbt3s1 < test-harness/hammerdb-indexes.sql

#cat test-harness/table_list.txt | while read a ; do 
#echo "LOAD DATA INFILE '`pwd`/imdb-2014-csv-mysql/$a.csv' INTO TABLE $a FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
#done > tmp-mariadb/load-data.sql

##$MYSQL_CMD $MYSQL_ARGS imdbload < tmp-mariadb/load-data.sql
##$MYSQL_CMD $MYSQL_ARGS imdbload < test-harness/fkindexes.sql

##cat test-harness/table_list.txt | while read a ; do 
##  echo "analyze table $a;"
##done > tmp-mariadb/analyze-tables.sql

##$MYSQL_CMD $MYSQL_ARGS imdbload < tmp-mariadb/analyze-tables.sql
