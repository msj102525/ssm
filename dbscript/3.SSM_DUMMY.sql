INSERT INTO TB_USER
            (ID
            ,USER_ID, PASSWD
            ,EMAIL, USER_NO, PHONE
            ,ACCOUNT_NUMBER, BANK_NAME
            ,PROFILE_URL, IS_QUIT
            ,ADMIN_OK, LOGIN_OK
            ,LAST_MODIFIED
            ,SERVICE_DATE
            ,BUSINESS_NO, BUSINESS_STORE_NAME) 
    VALUES (USER_SEQ.NEXTVAL
            ,'user1', '$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.',
            'msj10252125@naver.com', '19980711', '010-1234-5366', 
            '1111', null
            ,null, 'N'
            ,'N', 'Y'
            ,default
            ,SYSDATE + 30
            ,'123456', 'ssm12');
INSERT INTO TB_USER
            (ID
            ,USER_ID, PASSWD
            ,EMAIL, USER_NO, PHONE
            ,ACCOUNT_NUMBER, BANK_NAME
            ,PROFILE_URL, IS_QUIT
            ,ADMIN_OK, LOGIN_OK
            ,LAST_MODIFIED
            ,SERVICE_DATE
            ,BUSINESS_NO, BUSINESS_STORE_NAME) 
    VALUES (USER_SEQ.NEXTVAL
            ,'user2', '$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.',
            'dfasdfadsfsad@naver.com', '19980711', '010-1234-5366', 
            '1111', null
            ,null, 'N'
            ,'N', 'Y'
            ,default
            ,SYSDATE + 30
            ,'123456', 'ssm13');
INSERT INTO TB_USER
            (ID
            ,USER_ID, PASSWD
            ,EMAIL, USER_NO, PHONE
            ,ACCOUNT_NUMBER, BANK_NAME
            ,PROFILE_URL, IS_QUIT
            ,ADMIN_OK, LOGIN_OK
            ,LAST_MODIFIED
            ,SERVICE_DATE
            ,BUSINESS_NO, BUSINESS_STORE_NAME) 
    VALUES (USER_SEQ.NEXTVAL
            ,'user3', '$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.',
            'dfasdfasdfaasdfsad@naver.com', '19980711', '010-1234-5366', 
            '1111', null
            ,null, 'N'
            ,'N', 'Y'
            ,default
            ,SYSDATE + 30
            ,'123456', 'ssm14');            
COMMIT;
--관리자
Insert into C##SSMS.TB_USER
(ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
values (1001,'doorwinbell','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','msj102521235@admin.com','19980711','010-1234-5366','1111',null,null,'N','Y','Y',default,default,'123456','ssm13');
 
 
Insert into C##SSMS.TB_USER
(ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
values (1002,'kyl1563','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','kyl156333@admin.com','19980711','010-1234-5366','1111',null,null,'N','Y','Y',default,default,'123456','ssm1');
 
Insert into C##SSMS.TB_USER
(ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
values (1003,'tpals213','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','tpals21333@admin.com','19980711','010-1234-5366','2222',null,null,'N','Y','Y',default,default,'123457','ssm2');
 
Insert into C##SSMS.TB_USER
(ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
values (1004,'tldhs7870','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','tldhs787033@admin.com','19980711','010-1234-5366','1002158415759',null,null,'N','Y','Y',default,default,'123458','ssm3');
 
Insert into C##SSMS.TB_USER
(ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
values (1005,'smkr96','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','smkr9633@admin.com','19980711','010-1234-5366','4444',null,null,'N','Y','Y',default,default,'123456','ssm5');

---------------------------------------------
-- 직원정보 더미(2024.04.10)
---------------------------------------------
DELETE FROM TB_EMPLOYEE_2001;

INSERT INTO TB_EMPLOYEE_2001 (EMP_ID, EMP_NAME, POSITION, EMP_HIREDATE, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_BIRTHDATE, EMP_GENDER)
VALUES  (1 ,'홍길동', '대리', '1979-08-05',' 010-1234-5678','hong@example.com', '서울시 강남구','1990-05-05', 'M');
INSERT INTO TB_EMPLOYEE_2001 (EMP_ID, EMP_NAME, POSITION, EMP_HIREDATE, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_BIRTHDATE, EMP_GENDER)
VALUES  (2 ,'이몽룡', '주임', '1982-03-15',' 010-2345-6789','lee@example.com', '서울시 강서구','1989-02-10', 'M');
  INSERT INTO TB_EMPLOYEE_2001 (EMP_ID, EMP_NAME, POSITION, EMP_HIREDATE, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_BIRTHDATE, EMP_GENDER)
VALUES  (3 ,'성춘향', '사원', '1985-11-20',' 010-3456-7890','seong@example.com', '서울시 송파구','1992-07-15', 'F');
 INSERT INTO TB_EMPLOYEE_2001 (EMP_ID, EMP_NAME, POSITION, EMP_HIREDATE, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_BIRTHDATE, EMP_GENDER)
VALUES   (4 ,'임꺽정', '대리', '1988-09-10',' 010-4567-8901','im@example.com', '서울시 마포구','1991-10-20', 'M');
  INSERT INTO TB_EMPLOYEE_2001 (EMP_ID, EMP_NAME, POSITION, EMP_HIREDATE, EMP_PHONE, EMP_EMAIL, EMP_ADDRESS, EMP_BIRTHDATE, EMP_GENDER)
VALUES  (5 ,'강감찬', '주임', '1991-06-25',' 010-5678-9012','kang@example.com', '서울시 중랑구','1988-11-30', 'M');

DELETE FROM TB_COMMUTE_INFO_2001;

INSERT INTO TB_COMMUTE_INFO_2001 (EMP_ID, START_TIME, WORK_DAY, END_TIME, WORKING_HOURS, LATE_FLAG, LEAVE_EARLY, ABSENTEEISM)
VALUES (1, TO_DATE('2024-04-08 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-08', 'YYYY-MM-DD'), TO_DATE('2024-04-08 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), '540minute', 'N', 'N', 'N');

INSERT INTO TB_COMMUTE_INFO_2001 (EMP_ID, START_TIME, WORK_DAY, END_TIME, WORKING_HOURS, LATE_FLAG, LEAVE_EARLY, ABSENTEEISM)
VALUES (2, TO_DATE('2024-04-08 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-08', 'YYYY-MM-DD'), TO_DATE('2024-04-08 18:15:00', 'YYYY-MM-DD HH24:MI:SS'), '540minute', 'Y', 'N', 'N');

INSERT INTO TB_COMMUTE_INFO_2001 (EMP_ID, START_TIME, WORK_DAY, END_TIME, WORKING_HOURS, LATE_FLAG, LEAVE_EARLY, ABSENTEEISM)
VALUES (3, TO_DATE('2024-04-08 08:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-08', 'YYYY-MM-DD'), TO_DATE('2024-04-08 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), '540minute', 'N', 'Y', 'N');

INSERT INTO TB_COMMUTE_INFO_2001 (EMP_ID, START_TIME, WORK_DAY, END_TIME, WORKING_HOURS, LATE_FLAG, LEAVE_EARLY, ABSENTEEISM)
VALUES (4, TO_DATE('2024-04-08 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-08', 'YYYY-MM-DD'), TO_DATE('2024-04-08 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), '540minute', 'N', 'N', 'N');

INSERT INTO TB_COMMUTE_INFO_2001 (EMP_ID, START_TIME, WORK_DAY, END_TIME, WORKING_HOURS, LATE_FLAG, LEAVE_EARLY, ABSENTEEISM)
VALUES (5, TO_DATE('2024-04-08 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-08', 'YYYY-MM-DD'), TO_DATE('2024-04-08 18:10:00', 'YYYY-MM-DD HH24:MI:SS'), '540minute', 'N', 'N', 'N');


DELETE FROM TB_SALARY_INFO_2001;

INSERT INTO TB_SALARY_INFO_2001 (EMP_ID, BANK_NAME, BANK_ACCOUNT_NO, ACCOUNT_HOLDER, PREMIUM, TAX)
VALUES (1, '국민은행', '123456-01-789012', '홍길동', '1000000', '100000');

INSERT INTO TB_SALARY_INFO_2001 (EMP_ID, BANK_NAME, BANK_ACCOUNT_NO, ACCOUNT_HOLDER, PREMIUM, TAX)
VALUES (2, '신한은행', '234567-02-890123', '이몽룡', '1200000', '120000');

INSERT INTO TB_SALARY_INFO_2001 (EMP_ID, BANK_NAME, BANK_ACCOUNT_NO, ACCOUNT_HOLDER, PREMIUM, TAX)
VALUES (3, '우리은행', '345678-03-901234', '성춘향', '900000', '90000');

INSERT INTO TB_SALARY_INFO_2001 (EMP_ID, BANK_NAME, BANK_ACCOUNT_NO, ACCOUNT_HOLDER, PREMIUM, TAX)
VALUES (4, '하나은행', '456789-04-012345', '임꺽정', '1100000', '110000');

INSERT INTO TB_SALARY_INFO_2001 (EMP_ID, BANK_NAME, BANK_ACCOUNT_NO, ACCOUNT_HOLDER, PREMIUM, TAX)
VALUES (5, 'KB국민은행', '567890-05-123456', '강감찬', '950000', '95000');


DROP SEQUENCE TB_EMPLOYEE_2001_EMP_ID_SEQ;

CREATE SEQUENCE TB_EMPLOYEE_2001_EMP_ID_SEQ
       START WITH 6
       INCREMENT BY 1;

-------------------------------------------------
--- 예약관리 더미 자료(2024.04.10)
-------------------------------------------------
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) values (1,'20240404','1120','홍길동','010-1234-5678',1,'모임계획1','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (2,'20240404','1120','홍길동','010-1234-5678',1,'모임계획2','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (3,'20240404','1120','홍길동','010-1234-5678',1,'모임계획3','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (4,'20240404','1120','홍길동','010-1234-5678',1,'모임계획4','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (5,'20240404','1120','홍길동','010-1234-5678',1,'모임계획5','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (6,'20240404','1120','홍길동','010-1234-5678',1,'모임계획6','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (7,'20240404','1120','홍길동','010-1234-5678',1,'모임계획7','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (8,'20240404','1120','홍길동','010-1234-5678',1,'모임계획8','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (9,'20240404','1120','홍길동','010-1234-5678',1,'모임계획9','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (10,'20240404','1120','홍길동','010-1234-5678',1,'모임계획10','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (11,'20240404','1120','홍길동','010-1234-5678',1,'모임계획11','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (12,'20240404','1120','홍길동','010-1234-5678',1,'모임계획12','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (13,'20240404','1120','홍길동','010-1234-5678',1,'모임계획13','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (14,'20240404','1120','홍길동','010-1234-5678',1,'모임계획14','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (15,'20240404','1120','홍길동','010-1234-5678',1,'모임계획15','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (21,'20240405','1120','홍길동','010-1234-5678',1,'모임계획','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (22,'20240405','1120','홍길동','010-1234-5678',1,'모임계획','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (23,'20240405','1120','홍길동','010-1234-5678',1,'모임계획','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (24,'20240405','1120','홍길동','010-1234-5678',1,'모임계획','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (25,'20240405','1120','홍길동','010-1234-5678',1,'모임계획','3명 같이 모임',200,to_date('24/04/04','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (26,'20240405','1120','홍길동','010-1234-5678',1,'모임계획5','3명 같이 모임',0,to_date('24/04/05','RR/MM/DD'));
INSERT INTO TB_RESERVATION_2001 (RSRV_NUM,RSRV_DATE,RSRV_TIME,RSRV_NAME,RSRV_TELNO,RSRV_INWON,RSRV_SUBJECT,RSRV_MEMO,WRITER,WRITE_DATE) VALUES (27,'20240411','1','홍길동','010-2345-7895',1,'1','1',0,to_date('24/04/05','RR/MM/DD'));

DROP SEQUENCE TB_RESERVATION_2001_RSRV_NUM_SEQ;

CREATE SEQUENCE TB_RESERVATION_2001_RSRV_NUM_SEQ
       START WITH 28
       INCREMENT BY 1;
-- 첫 번째 세트
INSERT INTO TB_GOODS_2001 (ID, GOODS_NO, GOODS_NAME)
VALUES (1, 1, '사과');

INSERT INTO TB_INVENTORY_2001 (GOODS_NO, PD_QUANTITY)
VALUES (1, 3);

INSERT INTO TB_PRODUCE_2001 (PD_NO, GOODS_NO, PD_NAME)
VALUES (101, 1, '형제청과');

-- 두 번째 세트
INSERT INTO TB_GOODS_2001 (ID, GOODS_NO, GOODS_NAME)
VALUES (1, 2, '감자');

INSERT INTO TB_INVENTORY_2001 (GOODS_NO, PD_QUANTITY)
VALUES (2, 5);

INSERT INTO TB_PRODUCE_2001 (PD_NO, GOODS_NO, PD_NAME)
VALUES (102, 2, '우리채소');

-- 세 번째 세트
INSERT INTO TB_GOODS_2001 (ID, GOODS_NO, GOODS_NAME)
VALUES (1, 3, '고추장');

INSERT INTO TB_INVENTORY_2001 (GOODS_NO, PD_QUANTITY)
VALUES (3, 5);

INSERT INTO TB_PRODUCE_2001 (PD_NO, GOODS_NO, PD_NAME)
VALUES (103, 3, '순창');

-- 네 번째 세트
INSERT INTO TB_GOODS_2001 (ID, GOODS_NO, GOODS_NAME)
VALUES (1, 4, '오이');

INSERT INTO TB_INVENTORY_2001 (GOODS_NO, PD_QUANTITY)
VALUES (4, 2);

INSERT INTO TB_PRODUCE_2001 (PD_NO, GOODS_NO, PD_NAME)
VALUES (104, 4, '강원도농산물');

-- 다섯 번째 세트
INSERT INTO TB_GOODS_2001 (ID, GOODS_NO, GOODS_NAME)
VALUES (1, 5, '당근');

INSERT INTO TB_INVENTORY_2001 (GOODS_NO, PD_QUANTITY)
VALUES (5, 4);

INSERT INTO TB_PRODUCE_2001 (PD_NO, GOODS_NO, PD_NAME)
VALUES (105, 5, '경상도농산물');

DROP SEQUENCE TB_GOODS_2001_GOODS_NO_SEQ;

CREATE SEQUENCE TB_GOODS_2001_GOODS_NO_SEQ
       START WITH 4
       INCREMENT BY 1;

commit;

delete TB_INCONVINIENCE_BOARD_REPLY;
delete tb_inconvinience_board;
-- 10개의 더미 데이터 삽입 (컬럼을 지정하지 않고, STATUS에 랜덤으로 1부터 3까지, WRITER에 랜덤으로 1부터 10까지의 값 삽입)
INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2001, '장시간 대기열로 인한 불편', '오랜 대기 시간으로 인한 불편을 공유합니다.', SYSDATE - 10, SYSDATE, 1);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2001, '매장 내 청결도 저하', '매장 내 청결 상태가 저하되어 있어 불편합니다.', SYSDATE - 9, SYSDATE, 2);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2001, '제품 불량으로 인한 교환 어려움', '구매한 제품이 불량이라 교환하려고 하니 어려움이 있습니다.', SYSDATE - 8, SYSDATE, 3);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2001, '매장 내 가격표 미표시', '상품의 가격표가 미표시되어 있어 가격을 확인하기 어렵습니다.', SYSDATE - 7, SYSDATE, 1);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2001, '서비스 태도 불만', '매장 직원의 서비스 태도가 불만족스럽습니다.', SYSDATE - 6, SYSDATE, 2);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2001, '매장 내 장애물 증가', '매장 내 장애물이 늘어나서 이동하기 어려워졌습니다.', SYSDATE - 5, SYSDATE, 3);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2002, '환불 처리 지연', '상품 환불 처리가 지연되어 있어 불편합니다.', SYSDATE - 4, SYSDATE, 1);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2001, '온라인 주문 오류', '온라인 주문 시스템에서 오류가 발생하여 주문이 어려워졌습니다.', SYSDATE - 3, SYSDATE, 2);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2003, '주차장 혼잡', '매장 주변 주차장이 혼잡하여 주차하기 어렵습니다.', SYSDATE - 2, SYSDATE, 3);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2002, '매장 내 냄새', '매장 내부에서 불쾌한 냄새가 나서 불편합니다.', SYSDATE - 1, SYSDATE, 1);

-- 10개의 더미 데이터 추가
INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2001, '결제 시스템 오작동', '매장 내 결제 시스템이 작동하지 않아 결제가 어렵습니다.', SYSDATE - 10, SYSDATE, 2);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2001, '반품 처리 지연', '상품 반품 처리가 오랜 시간이 걸려 불편합니다.', SYSDATE - 9, SYSDATE, 3);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2002, '상품 배송 지연', '인터넷 주문한 상품의 배송이 예정보다 늦어져 불편합니다.', SYSDATE - 8, SYSDATE, 1);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2003, '매장 내 주차장 부족', '매장 주변 주차장이 부족하여 주차하기 어렵습니다.', SYSDATE - 7, SYSDATE, 2);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2001, '제품 설명 미흡', '구매한 제품의 설명이 부족하여 사용법을 알기 어렵습니다.', SYSDATE - 6, SYSDATE, 3);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2001, '매장 내 음악 소리 큼', '매장 내에서 틀어지는 음악이 너무 시끄럽습니다.', SYSDATE - 5, SYSDATE, 1);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2001, '장바구니 기능 오류', '온라인 쇼핑몰에서 장바구니에 상품을 담을 때 오류가 발생합니다.', SYSDATE - 4, SYSDATE, 2);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2001, '상품 포장 미흡', '구매한 상품의 포장이 미흡하여 상품이 손상될 우려가 있습니다.', SYSDATE - 3, SYSDATE, 3);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2001, '매장 내 온도 조절 미흡', '매장 내 온도가 너무 높아서 불편합니다.', SYSDATE - 2, SYSDATE, 1);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2001, '매장 내 화장실 청결상태 불량', '매장 내 화장실이 청결하지 않아 사용하기 불편합니다.', SYSDATE - 1, SYSDATE, 2);


--------------댓글
-- status가 3인 게시글에 댓글 작성
INSERT INTO TB_INCONVINIENCE_BOARD_REPLY (BOARD_NO, WRITER, WRITE_DATE, COMMENT_CONTENT) VALUES 
(10, 1002, SYSDATE - 1, '불편사항이 해결되어 기쁘게 생각합니다. 감사합니다.');
INSERT INTO TB_INCONVINIENCE_BOARD_REPLY (BOARD_NO, WRITER, WRITE_DATE, COMMENT_CONTENT) VALUES 
(11, 1001, SYSDATE - 4, '해당 불편사항이 해결되었습니다. 감사합니다.');
INSERT INTO TB_INCONVINIENCE_BOARD_REPLY (BOARD_NO, WRITER, WRITE_DATE, COMMENT_CONTENT) VALUES 
(12, 1002, SYSDATE - 5, '해당 사안은 해결되었습니다.');

-- status가 2인 게시글에 대해 "조치 중" 댓글 작성
INSERT INTO TB_INCONVINIENCE_BOARD_REPLY (BOARD_NO, WRITER, WRITE_DATE, COMMENT_CONTENT) VALUES 
(13, 1003, SYSDATE - 2, '조치 중입니다. 최대한 빨리 해결하도록 하겠습니다.');
INSERT INTO TB_INCONVINIENCE_BOARD_REPLY (BOARD_NO, WRITER, WRITE_DATE, COMMENT_CONTENT) VALUES 
(14, 1004, SYSDATE - 3, '빠른 시일 내에 조치할 수 있도록 노력하겠습니다.');
INSERT INTO TB_INCONVINIENCE_BOARD_REPLY (BOARD_NO, WRITER, WRITE_DATE, COMMENT_CONTENT) VALUES 
(1, 1005, SYSDATE - 4, '조치 중입니다. 불편을 드려 죄송합니다.');
INSERT INTO TB_INCONVINIENCE_BOARD_REPLY (BOARD_NO, WRITER, WRITE_DATE, COMMENT_CONTENT) VALUES 
(2, 1003, SYSDATE - 1, '현재 조치 중입니다. 조속한 완료를 위해 노력하겠습니다.');
INSERT INTO TB_INCONVINIENCE_BOARD_REPLY (BOARD_NO, WRITER, WRITE_DATE, COMMENT_CONTENT) VALUES 
(3, 1001, SYSDATE - 2, '빠른 시일 내에 조치될 수 있도록 노력하겠습니다.');
INSERT INTO TB_INCONVINIENCE_BOARD_REPLY (BOARD_NO, WRITER, WRITE_DATE, COMMENT_CONTENT) VALUES 
(4,1002 , SYSDATE - 3, '조치 중이며, 빠른 완료를 위해 노력하고 있습니다.');

commit;

delete tb_notice;
-- 10개의 더미 데이터 생성 INSERT 문
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1001, '공지사항 1', '이번 주에는 새로운 기능을 추가했습니다.', to_date('2024-04-08','YYYY-MM-DD'), to_date('2024-04-08','YYYY-MM-DD'), 100, '3');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1002, '중요 공지', '서비스 정상화 안내', to_date('2024-04-07','YYYY-MM-DD'), to_date('2024-04-08','YYYY-MM-DD'), 150, '2');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1001, '주의: 업데이트 예정', '내일부터 일시적으로 서비스가 중단될 예정입니다.', to_date('2024-04-06','YYYY-MM-DD'), to_date('2024-04-07','YYYY-MM-DD'), 200, '1');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1004, '긴급 공지', '시스템 장애로 인해 서비스가 중단됩니다. 조속히 복구하겠습니다.', to_date('2024-04-05','YYYY-MM-DD'), to_date('2024-04-06','YYYY-MM-DD'), 300, '3');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1001, '필독: 서비스 이용 안내', '새로운 서비스 정책이 시행됩니다. 모두 확인해주세요.', to_date('2024-04-04','YYYY-MM-DD'), to_date('2024-04-05','YYYY-MM-DD'), 250, '2');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1003, '주말 서비스 점검 안내', '주말 동안 서비스 점검이 진행될 예정입니다.', to_date('2024-04-03','YYYY-MM-DD'), to_date('2024-04-04','YYYY-MM-DD'), 180, '1');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1002, '긴급공지: 시스템 업그레이드', '내일 새벽 2시부터 시스템 업그레이드 작업이 진행될 예정입니다.', to_date('2024-04-02','YYYY-MM-DD'), to_date('2024-04-03','YYYY-MM-DD'), 220, '3');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1005, '주요 변경사항 안내', '서비스 이용 방법이 변경되었습니다. 자세한 내용은 홈페이지를 참조해주세요.', to_date('2024-04-01','YYYY-MM-DD'), to_date('2024-04-02','YYYY-MM-DD'), 170, '2');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1001, '서비스 이용 시 유의사항', '서비스 이용 시 개인정보 보호에 유의하세요.', to_date('2024-03-31','YYYY-MM-DD'), to_date('2024-04-01','YYYY-MM-DD'), 190, '1');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1005, '서비스 업데이트 공지', '서비스 업데이트를 완료했습니다. 새로운 기능을 즐겨보세요.', to_date('2024-03-30','YYYY-MM-DD'), to_date('2024-03-31','YYYY-MM-DD'), 210, '3');
-- 추가로 10개의 더미 데이터 생성 INSERT 문
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1002, '서비스 이용 안내', '서비스 이용 시간이 변경되었습니다. 새로운 시간에 맞춰 이용해주세요.', to_date('2024-03-29','YYYY-MM-DD'), to_date('2024-03-30','YYYY-MM-DD'), 220, '2');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1004, '서비스 장애 안내', '일시적인 서비스 장애로 불편을 드려 죄송합니다. 최대한 빠른 시일 내에 복구하겠습니다.', to_date('2024-03-28','YYYY-MM-DD'), to_date('2024-03-29','YYYY-MM-DD'), 180, '1');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1002, '주말 휴무 안내', '다음 주 주말은 휴무입니다. 이 점 참고하시어 이용 부탁드립니다.', to_date('2024-03-27','YYYY-MM-DD'), to_date('2024-03-28','YYYY-MM-DD'), 250, '3');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1004, '기술 지원 센터 운영 안내', '기술 지원 센터의 운영시간이 변경되었습니다. 자세한 내용은 공지를 참고해주세요.', to_date('2024-03-26','YYYY-MM-DD'), to_date('2024-03-27','YYYY-MM-DD'), 300, '2');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1001, '정기 점검 안내', '다음 주에 정기 점검이 예정되어 있습니다. 이용에 참고하시기 바랍니다.', to_date('2024-03-25','YYYY-MM-DD'), to_date('2024-03-26','YYYY-MM-DD'), 210, '1');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1004, '서비스 이용 방법 안내', '새로운 기능 사용 방법에 대한 안내입니다. 자세한 내용은 홈페이지를 참조해주세요.', to_date('2024-03-24','YYYY-MM-DD'), to_date('2024-03-25','YYYY-MM-DD'), 270, '3');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1002, '새로운 기능 출시', '오늘부로 새로운 기능을 출시했습니다. 이용해보세요!', to_date('2024-03-23','YYYY-MM-DD'), to_date('2024-03-24','YYYY-MM-DD'), 190, '2');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1003, '서비스 업그레이드 예정', '다음 주에 서비스 업그레이드 작업이 있을 예정입니다. 이용에 불편을 드려 죄송합니다.', to_date('2024-03-22','YYYY-MM-DD'), to_date('2024-03-23','YYYY-MM-DD'), 230, '1');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1001, '서비스 이용 안내', '서비스 이용 중 발생한 문제 해결을 위한 안내입니다. 자세한 내용은 홈페이지를 참조해주세요.', to_date('2024-03-21','YYYY-MM-DD'), to_date('2024-03-22','YYYY-MM-DD'), 240, '3');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1003, '서비스 이용 안내', '서비스 이용 방법에 대한 안내입니다. 자세한 내용은 홈페이지를 참조해주세요.', to_date('2024-03-20','YYYY-MM-DD'), to_date('2024-03-21','YYYY-MM-DD'), 260, '2');
-- 추가로 10개의 더미 데이터 생성 INSERT 문
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1005, '서비스 장애 안내', '현재 서비스에 장애가 발생하여 빠른 시일 내에 해결하겠습니다. 이용에 불편을 드려 죄송합니다.', to_date('2024-03-19','YYYY-MM-DD'), to_date('2024-03-20','YYYY-MM-DD'), 180, '1');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1003, '새로운 기능 출시', '새로운 기능을 출시하였습니다. 이용자 여러분들의 많은 관심 부탁드립니다.', to_date('2024-03-18','YYYY-MM-DD'), to_date('2024-03-19','YYYY-MM-DD'), 220, '2');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1002, '주요 업데이트 예고', '다음 주에 주요한 업데이트가 예정되어 있습니다. 기대해주시기 바랍니다.', to_date('2024-03-17','YYYY-MM-DD'), to_date('2024-03-18','YYYY-MM-DD'), 250, '3');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1001, '시스템 점검 안내', '서비스 시스템 점검으로 인해 일시적인 접속이 불가능할 수 있습니다. 양해 부탁드립니다.', to_date('2024-03-16','YYYY-MM-DD'), to_date('2024-03-17','YYYY-MM-DD'), 200, '1');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1005, '이용약관 변경', '이용약관이 변경되었습니다. 변경된 내용을 확인하시고 동의해주세요.', to_date('2024-03-15','YYYY-MM-DD'), to_date('2024-03-16','YYYY-MM-DD'), 240, '2');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1003, '서비스 업데이트 안내', '새로운 기능을 추가한 업데이트가 있습니다. 자세한 내용은 공지를 참고해주세요.', to_date('2024-03-14','YYYY-MM-DD'), to_date('2024-03-15','YYYY-MM-DD'), 280, '3');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1002, '서비스 이용 안내', '서비스 이용 중 발생한 문제를 해결하였습니다. 이용에 불편을 드려 죄송합니다.', to_date('2024-03-13','YYYY-MM-DD'), to_date('2024-03-14','YYYY-MM-DD'), 260, '2');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1003, '이용권 구매 안내', '이용권을 구매하면 추가 혜택이 있습니다. 자세한 내용은 이용권 페이지를 확인해주세요.', to_date('2024-03-12','YYYY-MM-DD'), to_date('2024-03-13','YYYY-MM-DD'), 230, '1');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1001, '서비스 이용 방법 안내', '새로운 기능 사용 방법에 대한 안내입니다. 자세한 내용은 공지를 참고해주세요.', to_date('2024-03-11','YYYY-MM-DD'), to_date('2024-03-12','YYYY-MM-DD'), 290, '3');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1005, '공지사항 안내', '서비스 이용과 관련된 공지사항입니다. 이용자 여러분의 이해와 협조를 부탁드립니다.', to_date('2024-03-10','YYYY-MM-DD'), to_date('2024-03-11','YYYY-MM-DD'), 270, '2');
commit;

delete tb_subscribe;
delete tb_subscribe_payment;
-- 더미 데이터 생성 INSERT 문 (숫자만)
Insert into TB_SUBSCRIBE (SUBSCRIBE_NO, SUBSCRIBE_NAME, PRICE, SUBSCRIBE_DATE) values (SUBSCRIBE_SEQ.NEXTVAL, 'Basic Plan', 10000, 3);
Insert into TB_SUBSCRIBE (SUBSCRIBE_NO, SUBSCRIBE_NAME, PRICE, SUBSCRIBE_DATE) values (SUBSCRIBE_SEQ.NEXTVAL, 'Standard Plan', 20000, 6);
Insert into TB_SUBSCRIBE (SUBSCRIBE_NO, SUBSCRIBE_NAME, PRICE, SUBSCRIBE_DATE) values (SUBSCRIBE_SEQ.NEXTVAL, 'Premium Plan', 30000, 12);
Insert into TB_SUBSCRIBE (SUBSCRIBE_NO, SUBSCRIBE_NAME, PRICE, SUBSCRIBE_DATE) values (SUBSCRIBE_SEQ.NEXTVAL, 'Gold Plan', 40000, 24);
Insert into TB_SUBSCRIBE (SUBSCRIBE_NO, SUBSCRIBE_NAME, PRICE, SUBSCRIBE_DATE) values (SUBSCRIBE_SEQ.NEXTVAL, 'Platinum Plan', 50000, 36);
Insert into TB_SUBSCRIBE (SUBSCRIBE_NO, SUBSCRIBE_NAME, PRICE, SUBSCRIBE_DATE) values (SUBSCRIBE_SEQ.NEXTVAL, 'Trial Plan', 5000, 1);
Insert into TB_SUBSCRIBE (SUBSCRIBE_NO, SUBSCRIBE_NAME, PRICE, SUBSCRIBE_DATE) values (SUBSCRIBE_SEQ.NEXTVAL, 'Family Plan', 60000, 12);
Insert into TB_SUBSCRIBE (SUBSCRIBE_NO, SUBSCRIBE_NAME, PRICE, SUBSCRIBE_DATE) values (SUBSCRIBE_SEQ.NEXTVAL, 'Student Plan', 8000, 6);
Insert into TB_SUBSCRIBE (SUBSCRIBE_NO, SUBSCRIBE_NAME, PRICE, SUBSCRIBE_DATE) values (SUBSCRIBE_SEQ.NEXTVAL, 'Corporate Plan', 100000, 24);
Insert into TB_SUBSCRIBE (SUBSCRIBE_NO, SUBSCRIBE_NAME, PRICE, SUBSCRIBE_DATE) values (SUBSCRIBE_SEQ.NEXTVAL, 'VIP Plan', 120000, 12);
-- 더미 데이터 생성 INSERT 문
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'Basic Plan', 10000, 2001, 'Credit Card', SYSDATE);
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'Standard Plan', 20000, 2003, 'PayPal', SYSDATE);
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'Premium Plan', 30000, 2001, 'Credit Card', SYSDATE);
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'Gold Plan', 40000, 2002, 'Bank Transfer', SYSDATE);
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'Platinum Plan', 50000, 2001, 'Credit Card', SYSDATE);
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'Trial Plan', 5000, 2002, 'Free Trial', SYSDATE);
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'Family Plan', 60000, 2001, 'Credit Card', SYSDATE);
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'Student Plan', 8000, 2003, 'PayPal', SYSDATE);
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'Corporate Plan', 100000, 2001, 'Credit Card', SYSDATE);
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'VIP Plan', 120000, 2003, 'Credit Card', SYSDATE);

commit;
delete tb_user_suspension;
-- 더미 데이터 생성 INSERT 문
Insert into TB_USER_SUSPENSION (SUSPENSION_NO, TARGET_ACCOUNT, SUSPENSION_START, SUSPENSION_END, SUSPENSION_TITLE, SUSPENSION_CONTENT) values (SUSPENSION_SEQ.NEXTVAL, 2001, to_date('2024-04-01', 'YYYY-MM-DD'), to_date('2024-04-10', 'YYYY-MM-DD'), '부적절한 홍보', '부적절한 홍보로 인한 계정 정지 조치');
Insert into TB_USER_SUSPENSION (SUSPENSION_NO, TARGET_ACCOUNT, SUSPENSION_START, SUSPENSION_END, SUSPENSION_TITLE, SUSPENSION_CONTENT) values (SUSPENSION_SEQ.NEXTVAL, 2002, to_date('2024-03-15', 'YYYY-MM-DD'), to_date('2024-03-20', 'YYYY-MM-DD'), '욕설 사용', '욕설 사용으로 인한 계정 정지 조치');
Insert into TB_USER_SUSPENSION (SUSPENSION_NO, TARGET_ACCOUNT, SUSPENSION_START, SUSPENSION_END, SUSPENSION_TITLE, SUSPENSION_CONTENT) values (SUSPENSION_SEQ.NEXTVAL, 2003, to_date('2024-02-10', 'YYYY-MM-DD'), to_date('2024-02-20', 'YYYY-MM-DD'), '불법 콘텐츠 게시', '불법 콘텐츠 게시로 인한 계정 정지 조치');
commit;

