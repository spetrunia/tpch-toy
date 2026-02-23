drop table if exists my_tpch_result;

create table my_tpch_result (
  query_name varchar(64),
  query_start timestamp,
  query_time_ms bigint,
  query_rows_read bigint
);

drop table if exists my_tpch_cur_query;

create table my_tpch_cur_query (
  query_name varchar(64),
  query_start_time timestamp,
  query_rows_read bigint
);

