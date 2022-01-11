set lines 150
select to_char(sysdate,'DD-MON-YYYY HH24:MI:SS') from dual;
column Tablespace_name format a20 heading "Tablespace Name"
column file_name format a80 heading "File Name"
column "Alloc MB" format 999,999,990.90
column "Used MB" format 999,999,990.90
column "Free MB" format 999,990.90
set pagesize 200
set feedback off
set heading on 
SET COLSEP |
break on report

compute sum of "Allocated MB" on report
compute sum of "Used MB" on report
compute sum of "Free MB" on report

select unique a.tablespace_name, a.file_name,a.autoextensible,
a.bytes/(1024*1024) "Allocated MB",
((a.bytes - nvl(sum(b.bytes),0))/(1024*1024)) "Used MB",
nvl(sum(b.bytes),0)/(1024*1024) "Free MB"
from dba_data_files a,dba_free_space b
where a.file_id = b.file_id (+)
group by a.tablespace_name, a.autoextensible, a.file_name, a.bytes/(1024*1024),
a.bytes
order by 1,2
/
select unique a.tablespace_name, a.file_name,a.autoextensible,
a.bytes/(1024*1024) "Allocated MB",
((a.bytes - nvl(sum(b.bytes),0))/(1024*1024)) "Used MB",
nvl(sum(b.bytes),0)/(1024*1024) "Free MB"
from dba_temp_files a,dba_free_space b
where a.file_id = b.file_id (+)
group by a.tablespace_name, a.autoextensible, a.file_name, a.bytes/(1024*1024),
a.bytes
order by 1,2
/

set feedback on
exit;