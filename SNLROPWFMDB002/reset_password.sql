col pwd new_value userpwd
select dbms_random.string('A', 10) pwd from dual;
ALTER USER &&username IDENTIFIED BY &&userpwd;
select 'The new password generated for &username is ' || '&&userpwd' || '. Please take note that the password is case sensitive.' "User's New Password" from dual;
UNDEFINE username;