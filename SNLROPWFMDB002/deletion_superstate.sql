set lines 150
spool E:\logs\deletion_superstate\deletion_superstate.txt
set head on 
set echo on
set feed on
select name from v$database;
select to_char(sysdate,'DD-MON-YYYY HH24:MI:SS') from dual;
select count(*) from SPRSTATE_HRS where SPRSTATE_SK = ' -989945659829';
call D_SPRSTATE_HRS_BATCH2 (-989945659829, 50000);
select to_char(sysdate,'DD-MON-YYYY HH24:MI:SS') from dual;
select count(*) from SPRSTATE_HRS where SPRSTATE_SK = ' -989945659829';
call D_SPRSTATE_HRS_BATCH2 (-989945659829, 50000);
select to_char(sysdate,'DD-MON-YYYY HH24:MI:SS') from dual;
select count(*) from SPRSTATE_HRS where SPRSTATE_SK = ' -989945659829';
call D_SPRSTATE_HRS_BATCH2 (-989945659829, 50000);
select to_char(sysdate,'DD-MON-YYYY HH24:MI:SS') from dual;
select count(*) from SPRSTATE_HRS where SPRSTATE_SK = ' -989945659829';
spool off
exit;