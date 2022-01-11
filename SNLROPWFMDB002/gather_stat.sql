set lines 150
set head on 
set echo on
set feed on
select name from v$database;
select to_char(sysdate,'DD-MON-YYYY HH24:MI:SS') from dual;
exec dbms_stats.gather_schema_stats(ownname=>'TWW_USR',estimate_percent=>dbms_stats.auto_sample_size,cascade=>TRUE,degree=>2,method_opt=>'for all columns size repeat');
exec dbms_stats.gather_schema_stats(ownname=>'TCSDBOWNER',estimate_percent=>dbms_stats.auto_sample_size,cascade=>TRUE,degree=>2,method_opt=>'for all columns size repeat');
exec dbms_stats.gather_schema_stats(ownname=>'TCSDBOWNER_TRAINING',estimate_percent=>dbms_stats.auto_sample_size,cascade=>TRUE,degree=>2,method_opt=>'for all columns size repeat');
select to_char(sysdate,'DD-MON-YYYY HH24:MI:SS') from dual;
exit;