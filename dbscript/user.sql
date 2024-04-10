---------------------------------------
--- ORACLE USER 생성
---------------------------------------
DROP USER C##SSMS CASCADE;

CREATE USER C##SSMS IDENTIFIED BY SSMS;
GRANT CONNECT, RESOURCE TO C##SSMS;
GRANT CREATE VIEW, CREATE PROCEDURE, CREATE SEQUENCE TO C##SSMS;
GRANT CREATE VIEW, CREATE SESSION, CREATE TABLE, CREATE TRIGGER, CREATE PROCEDURE to C##SSMS;

ALTER USER C##SSMS QUOTA 1024M ON USERS;

