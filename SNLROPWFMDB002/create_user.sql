col pwd new_value userpwd
select dbms_random.string('A', 10) pwd from dual;
CREATE USER &&username IDENTIFIED BY &&userpwd DEFAULT TABLESPACE TCS_DATA TEMPORARY TABLESPACE TEMP QUOTA UNLIMITED ON TCS_DATA;
GRANT CREATE SESSION TO &&username;
GRANT TCS_CLIENT TO &&username;
select 'The password generated for &username is ' || '&&userpwd' || '. Please take note that the password is case sensitive.' "User Password" from dual;
UNDEFINE username;