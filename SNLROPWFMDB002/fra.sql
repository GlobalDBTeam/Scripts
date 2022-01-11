set lines 150
col name format a80
set head on 
set feed on
select name from v$database;
select to_char(sysdate,'DD-MON-YYYY HH24:MI:SS') from dual;
SELECT NAME, ROUND(SPACE_LIMIT / 1048576) SPACE_LIMIT_MB, ROUND(SPACE_USED / 1048576) SPACE_USED_MB,
ROUND(((SPACE_USED / 1048576) * 100) / (SPACE_LIMIT / 1048576), 2) PRC_USED FROM V$RECOVERY_FILE_DEST;
exit;