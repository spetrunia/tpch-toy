
begin;
delete from my_tpch_cur_query;
insert into my_tpch_cur_query values('__QUERY_NAME__', clock_timestamp());
commit;

begin;
