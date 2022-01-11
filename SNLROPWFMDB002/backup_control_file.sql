col filedate new_value fdate
col filename new_value fname
select to_char(sysdate,'MMDDYYYY') as filedate from dual;
select 'E:\script\backup_controlfile\control_file_' || &&fdate || '.bkp' as filename from dual;
ALTER DATABASE BACKUP CONTROLFILE TO TRACE AS '&&fname';
exit;