#!/bin/bash

source mysql-vars.sh

mkdir -p tmp-mysql

cat > tmp-mysql/generate-analyze.sql <<END
-- This is a generated file
select 
  concat('analyze table ', 
         table_name, 
         ' update histogram on ',
         group_concat(column_name),
         ';') as 'select 1;' 
from 
  information_schema.columns 
where 
  table_schema=database() 
  group by table_name;
END

$MYSQL_CMD $MYSQL_ARGS dbt3s1 < tmp-mysql/generate-analyze.sql > tmp-mysql/eits-analyze.sql

$MYSQL_CMD $MYSQL_ARGS dbt3s1 < tmp-mysql/eits-analyze.sql

