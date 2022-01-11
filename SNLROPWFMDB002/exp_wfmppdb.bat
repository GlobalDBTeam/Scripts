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

set ORACLE_SID=WFMPPDB
C:\application\oracle\product\19.3.0\db_home\bin\expdp system/Thqw23aC@wfmppdb full=y directory=BACKUP dumpfile=EXP_WFMPPDB-%datetime%.dmp logfile=EXP_WFMPPDB-%datetime%.log

(
echo G:\backup\exp\EXP_WFMPPDB-%datetime%.dmp 
echo G:\backup\exp\EXP_WFMPPDB-%datetime%.log
)>G:\backup\exp\List.txt 
"C:\Program Files\7-Zip\7z.exe" a "G:\backup\exp\EXP_WFMPPDB-%datetime%.zip" @G:\backup\exp\List.txt

del G:\backup\exp\EXP_WFMPPDB-%datetime%.dmp
del G:\backup\exp\List.txt
xcopy /s/y G:\backup\exp\*.* \\NFRNAX1600-1\OracleBackup\WFMPCDB\backup\exp\
