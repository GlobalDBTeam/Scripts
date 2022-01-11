del E:\script\healthcheck\healthcheck_wfm.txt

@echo off

set hour=%time:~0,2%
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
set min=%time:~3,2%
if "%min:~0,1%" == " " set min=0%min:~1,1%
set secs=%time:~6,2%
if "%secs:~0,1%" == " " set secs=0%secs:~1,1%
set year=%date:~-4%
set month=%date:~4,2%
if "%month:~0,1%" == " " set month=0%month:~1,1%
set day=%date:~7,2%
if "%day:~0,1%" == " " set day=0%day:~1,1%
set datetime=%year%%month%%day%-%hour%%min%%secs%
set date=%year%%month%%day%

set ORACLE_SID=WFMPCDB
set ORACLE_HOME=C:\application\oracle\product\19.3.0\db_home
set PATH=%PATH%;E:\script\healthcheck\db_health_check.sql
C:\application\oracle\product\19.3.0\db_home\bin\sqlplus sys/Thqw23aC@WFMPCDB as sysdba @E:\script\healthcheck\db_health_check.sql >> E:\script\healthcheck\healthcheck_wfm.txt
copy E:\script\healthcheck\healthcheck_wfm.txt E:\logs\healthcheck\healthcheck-bkp\healthcheck_wfm-%datetime%.txt