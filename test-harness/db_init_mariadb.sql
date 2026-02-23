drop table if exists my_tpch_result;

create table my_tpch_result(
  query_name varchar(64),
  query_start datetime,
  query_time_ms bigint
);

