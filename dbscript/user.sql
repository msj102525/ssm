CREATE USER C##SSMS IDENTIFIED BY SSMS;
GRANT CONNECT, RESOURCE TO C##SSMS;
GRANT CREATE VIEW, CREATE PROCEDURE TO C##SSMS;
ALTER USER C##SSMS QUOTA 1024M ON USERS;

GRANT CREATE VIEW, CREATE SESSION, CREATE TABLE, CREATE PROCEDURE to C##SSMS;