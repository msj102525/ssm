---------------------------------------------------------------------
--- 일반 사용자 정보 생성
---------------------------------------------------------------------

-- 사용자 : user1
-- 암호 : Tmdwhd0711!

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

COMMIT;

--------------------------------------------
-- 메뉴관리 메뉴 클릭시 문제시 사용
--------------------------------------------
-- INSERT INTO TB_ACCOUNT_2001
-- (ID, YEARMONTH, TITLE, PRICE)
-- VALUES(2001, '2024-04', '월세', 100);


--------------------------------------
--- 매장 메뉴 관리 사용시
--- 구독정보 UPDATE(2024.04.10)
--------------------------------------
UPDATE TB_USER
SET SERVICE_DATE=TIMESTAMP '2024-05-10 18:39:56.000000'
WHERE ID = 2001;
---------------------------------------------------------------------
--- 주석 처리(필요시 사용)
---------------------------------------------------------------------
-- 데이터 삭제
--DELETE FROM TB_NOTICE;
--DELETE FROM TB_USER;
--- -- 관리자
--- Insert into C##SSMS.TB_USER
--- (ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
--- ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
--- ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
--- SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
--- values (1001,'doorwinbell','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','msj102521235@admin.com','19980711','010-1234-5366','1111',null,null,'N','Y','Y',default,default,'123456','ssm13');
--- 
--- 
--- Insert into C##SSMS.TB_USER
--- (ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
--- ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
--- ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
--- SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
--- values (1002,'kyl1563','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','kyl156333@admin.com','19980711','010-1234-5366','1111',null,null,'N','Y','Y',default,default,'123456','ssm1');
--- 
--- Insert into C##SSMS.TB_USER
--- (ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
--- ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
--- ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
--- SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
--- values (1003,'tpals213','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','tpals21333@admin.com','19980711','010-1234-5366','2222',null,null,'N','Y','Y',default,default,'123457','ssm2');
--- 
--- Insert into C##SSMS.TB_USER
--- (ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
--- ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
--- ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
--- SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
--- values (1004,'tldhs7870','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','tldhs787033@admin.com','19980711','010-1234-5366','1002158415759',null,null,'N','Y','Y',default,default,'123458','ssm3');
--- 
--- Insert into C##SSMS.TB_USER
--- (ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
--- ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
--- ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
--- SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
--- values (1005,'smkr96','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','smkr9633@admin.com','19980711','010-1234-5366','4444',null,null,'N','Y','Y',default,default,'123456','ssm5');
--- 
--- Insert into C##SSMS.TB_USER
--- (ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
--- ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
--- ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
--- SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
--- values (1000,'tactius90','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','tactius903233@admin.com','19980711','010-1234-5366','5555',null,null,'N','Y','Y',default,default,'123323245','ssm7');
--- 
--- -- 기본 유저 
--- -- 사용자 1
--- Insert into C##SSMS.TB_USER
--- (ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
--- ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
--- ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
--- SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
--- values (USER_SEQ.NEXTVAL,'user1','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','msj10252125@naver.com','19980711','010-1234-5366','1111',null,null,'N','N','Y',default,default,'123456','ssm12');
--- 
--- -- 사용자 2
--- Insert into C##SSMS.TB_USER
--- (ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
--- ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
--- ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
--- SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
--- values (USER_SEQ.NEXTVAL,'user2','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','user2@example.com','19980711','010-1234-5366','2222',null,null,'N','N','Y',default,default,'123457','store2');
--- 
--- -- 사용자 3
--- Insert into C##SSMS.TB_USER
--- (ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
--- ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
--- ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
--- SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
--- values (USER_SEQ.NEXTVAL,'user3','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','user3@example.com','19980711','010-1234-5366','3333',null,null,'N','N','Y',default,default,'123458','store3');
--- 
--- -- 사용자 4
--- Insert into C##SSMS.TB_USER
--- (ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
--- ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
--- ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
--- SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
--- values (USER_SEQ.NEXTVAL,'user4','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','user4@example.com','19980711','010-1234-5366','4444',null,null,'N','N','Y',default,default,'123459','store4');
--- 
--- -- 사용자 5
--- Insert into C##SSMS.TB_USER
--- (ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
--- ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
--- ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
--- SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
--- values (USER_SEQ.NEXTVAL,'user5','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','user5@example.com','19980711','010-1234-5366','5555',null,null,'N','N','Y',default,default,'12345','store5');
--- 
--- -- 사용자 6
--- Insert into C##SSMS.TB_USER
--- (ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
--- ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
--- ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
--- SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
--- values (USER_SEQ.NEXTVAL,'user6','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','user6@example.com','19980711','010-1234-5366','6666',null,null,'N','N','Y',default,default,'12346','store6');
--- 
--- -- 사용자 7
--- Insert into C##SSMS.TB_USER
--- (ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
--- ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
--- ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
--- SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
--- values (USER_SEQ.NEXTVAL,'user7','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','user7@example.com','19980711','010-1234-5366','7777',null,null,'N','N','Y',default,default,'12347','store7');
--- 
--- -- 사용자 8
--- Insert into C##SSMS.TB_USER
--- (ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
--- ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
--- ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
--- SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
--- values (USER_SEQ.NEXTVAL,'user8','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','user8@example.com','19980711','010-1234-5366','8888',null,null,'N','N','Y',default,default,'12349','store8');
--- 
--- -- 사용자 9
--- Insert into C##SSMS.TB_USER
--- (ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
--- ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
--- ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
--- SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
--- values (USER_SEQ.NEXTVAL,'user9','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.','user9@example.com','19980711','010-1234-5366','9999',null,null,'N','N','Y',default,default,'12348','store8');
--- 
--- -- 사용자 10
--- Insert into C##SSMS.TB_USER
--- (ID,USER_ID,PASSWD,EMAIL,USER_NO,PHONE,
--- ACCOUNT_NUMBER,BANK_NAME,PROFILE_URL,IS_QUIT,
--- ADMIN_OK,LOGIN_OK,LAST_MODIFIED,
--- SERVICE_DATE,BUSINESS_NO,BUSINESS_STORE_NAME) 
--- values (USER_SEQ.NEXTVAL,'user10','$2a$10$Blh.zf653CzbR0Sr7jx8Dux5H52SuojDUsrznLMUFjTSgaYoZJXX.',
--- 'user10@example.com','19980711','010-1234-5366','101010',null,null,'N','N','Y',default,default,'12349','store9');
--- 
--- -- 암호 : Tmdwhd0711! 통일
--- 
--- COMMIT;