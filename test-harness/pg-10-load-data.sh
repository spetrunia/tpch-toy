#!/bin/bash

source psql-vars.sh
mkdir -p tmp-postgresql

cat test-harness/table_list.txt | while read a ; do 
  fname=`echo "$a" | awk '{print tolower($0)}'`
  echo "\\copy $a from './dbt3s1-pg/dbt3s1/$fname.tbl' delimiter '|' ;"
done > tmp-postgresql/load-data.sql

$PSQL test < test-harness/create-table-pg.sql
$PSQL test < tmp-postgresql/load-data.sql 
#$PSQL test < test-harness/fkindexes.sql
#echo "ANALYZE" | $PSQL test

