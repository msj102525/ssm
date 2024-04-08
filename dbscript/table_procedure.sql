DROP TABLE TB_EMPLOYEE CASCADE CONSTRAINTS;

CREATE TABLE TB_EMPLOYEE (
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(30) NOT NULL,
    POSITION VARCHAR2(20) NOT NULL,
    EMP_HIREDATE DATE NOT NULL,
    EMP_PHONE VARCHAR2(15) NOT NULL,
    EMP_EMAIL VARCHAR2(30) NOT NULL,
    EMP_ADDRESS VARCHAR2(50) NOT NULL,
    EMP_BIRTHDATE DATE NOT NULL,
    EMP_GENDER VARCHAR2(1) CHECK (EMP_GENDER IN ('M', 'F')) NOT NULL,
    PRIMARY KEY(EMP_ID) 
);

COMMENT ON TABLE TB_EMPLOYEE IS '직원정보';
COMMENT ON COLUMN TB_EMPLOYEE.EMP_ID IS '직원번호';
COMMENT ON COLUMN TB_EMPLOYEE.EMP_NAME IS '직원이름';
COMMENT ON COLUMN TB_EMPLOYEE.POSITION IS '직급';
COMMENT ON COLUMN TB_EMPLOYEE.EMP_HIREDATE IS '입사날짜';
COMMENT ON COLUMN TB_EMPLOYEE.EMP_PHONE IS '전화번호';
COMMENT ON COLUMN TB_EMPLOYEE.EMP_EMAIL IS '이메일';
COMMENT ON COLUMN TB_EMPLOYEE.EMP_ADDRESS IS '주소';
COMMENT ON COLUMN TB_EMPLOYEE.EMP_BIRTHDATE IS '생년월일';
COMMENT ON COLUMN TB_EMPLOYEE.EMP_GENDER IS '성별';


DROP TABLE TB_COMMUTE_INFO CONSTRAINTS;
CREATE TABLE TB_COMMUTE_INFO (
EMP_ID NUMBER NOT NULL,
START_TIME DATE,
WORK_DAY DATE,
END_TIME DATE,
WORKING_HOURS VARCHAR2(30),
LATE_FLAG VARCHAR2(1) CHECK (LATE_FLAG IN ('N', 'Y')),
LEAVE_EARLY VARCHAR2(1) CHECK (LEAVE_EARLY IN ('N', 'Y')),
ABSENTEEISM VARCHAR2(1) CHECK (ABSENTEEISM IN ('N', 'Y')),
FOREIGN KEY (EMP_ID) REFERENCES TB_EMPLOYEE(EMP_ID)
);

COMMENT ON TABLE TB_COMMUTE_INFO IS '근태정보';
COMMENT ON COLUMN TB_COMMUTE_INFO.EMP_ID IS '직원번호';
COMMENT ON COLUMN TB_COMMUTE_INFO.START_TIME IS '출근시간';
COMMENT ON COLUMN TB_COMMUTE_INFO.WORK_DAY IS '근무일';
COMMENT ON COLUMN TB_COMMUTE_INFO.END_TIME IS '퇴근시간';
COMMENT ON COLUMN TB_COMMUTE_INFO.WORKING_HOURS IS '근무시간';
COMMENT ON COLUMN TB_COMMUTE_INFO.LATE_FLAG IS '지각여부';
COMMENT ON COLUMN TB_COMMUTE_INFO.LEAVE_EARLY IS '조퇴여부';
COMMENT ON COLUMN TB_COMMUTE_INFO.ABSENTEEISM IS '결근여부';

COMMIT;

DROP TABLE TB_CALENDAR CONSTRAINTS;
CREATE TABLE TB_CALENDAR (
EMP_ID NUMBER NOT NULL,
REMARKS VARCHAR2(3000),
FOREIGN KEY (EMP_ID) REFERENCES TB_EMPLOYEE(EMP_ID)
);

COMMENT ON TABLE TB_CALENDAR IS '직원 스케줄';
COMMENT ON COLUMN TB_CALENDAR.EMP_ID IS '직원번호';
COMMENT ON COLUMN TB_CALENDAR.REMARKS IS '특이사항';


DROP TABLE TB_SALARY_INFO  CONSTRAINTS;
CREATE TABLE TB_SALARY_INFO (
EMP_ID NUMBER NOT NULL,
BANK_NAME VARCHAR2(30) NOT NULL,
BANK_ACCOUNT_NO VARCHAR2(20) NOT NULL,
ACCOUNT_HOLDER VARCHAR2(30) NOT NULL, --보류
PREMIUM VARCHAR2(15),
TAX VARCHAR2(15),
FOREIGN KEY (EMP_ID) REFERENCES TB_EMPLOYEE(EMP_ID)
);

COMMENT ON TABLE TB_SALARY_INFO IS '급여 정보';
COMMENT ON COLUMN TB_SALARY_INFO.EMP_ID IS '직원번호';
COMMENT ON COLUMN TB_SALARY_INFO.BANK_NAME IS '은행이름';
COMMENT ON COLUMN TB_SALARY_INFO.BANK_ACCOUNT_NO IS '계좌번호';
COMMENT ON COLUMN TB_SALARY_INFO.ACCOUNT_HOLDER IS '예금주';
COMMENT ON COLUMN TB_SALARY_INFO.PREMIUM IS '보험료';
COMMENT ON COLUMN TB_SALARY_INFO.TAX IS '세금';
COMMIT;

DROP SEQUENCE EMP_ID_SEQ;

CREATE SEQUENCE EMP_ID_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

DROP SEQUENCE USER_SEQ;
DROP TABLE TB_STORE CASCADE CONSTRAINTS;
DROP TABLE TB_USER CASCADE CONSTRAINTS;
DROP TABLE TB_USER_FINKOUT CASCADE CONSTRAINTS;

CREATE SEQUENCE USER_SEQ
NOCYCLE
NOCACHE;


CREATE TABLE TB_USER (
    ID int PRIMARY KEY,
    USER_ID VARCHAR2(50) NOT NULL,
    PASSWD VARCHAR2(50) NOT NULL,
    EMAIL VARCHAR2(50) NOT NULL UNIQUE,
    USER_NO VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(20) NOT NULL,
    ACCOUNT_NUMBER VARCHAR2(20) NOT NULL,
    BANK_NAME VARCHAR2(20) NOT NULL,
    PROFILE_URL VARCHAR2(200) NULL,
    IS_QUIT CHAR DEFAULT 'N',
    ADMIN_OK CHAR DEFAULT 'N',
    LOGIN_OK CHAR DEFAULT 'Y',
    LAST_MODIFIED DATE DEFAULT SYSDATE,
    SERVICE_DATE DATE DEFAULT SYSDATE,
    BUSINESS_NO VARCHAR2(50),
    BUSINESS_STORE_NAME VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN TB_USER.ID IS '유저번호';
COMMENT ON COLUMN TB_USER.USER_ID IS '아이디';
COMMENT ON COLUMN TB_USER.PASSWD IS '비밀번호';
COMMENT ON COLUMN TB_USER.EMAIL IS '이메일';
COMMENT ON COLUMN TB_USER.USER_NO IS '주민번호';
COMMENT ON COLUMN TB_USER.PHONE IS '전화번호';
COMMENT ON COLUMN TB_USER.ACCOUNT_NUMBER IS '계좌번호';
COMMENT ON COLUMN TB_USER.BANK_NAME IS '은행명';
COMMENT ON COLUMN TB_USER.PROFILE_URL IS '프로필사진URL';
COMMENT ON COLUMN TB_USER.IS_QUIT IS '탈퇴여부';
COMMENT ON COLUMN TB_USER.LOGIN_OK IS '로그인가능여부';
COMMENT ON COLUMN TB_USER.LAST_MODIFIED IS '마지막수정일';
COMMENT ON COLUMN TB_USER.BUSINESS_NO IS '사업자번호';
COMMENT ON COLUMN TB_USER.BUSINESS_STORE_NAME IS '사업장명';

ALTER TABLE TB_USER
MODIFY (ACCOUNT_NUMBER VARCHAR2(20) null);

ALTER TABLE TB_USER
MODIFY (BANK_NAME VARCHAR2(20) NULL);

ALTER TABLE TB_USER
MODIFY (PASSWD VARCHAR2(100));

COMMIT;

CREATE TABLE TB_USER_FINKOUT (
    FINKOUT_NO INT,
    USER_ID VARCHAR2(50),
    EMAIL VARCHAR2(50),
    FINKOUT_DATE DATE DEFAULT SYSDATE,
    FOREIGN KEY (FINKOUT_NO) REFERENCES TB_USER (ID)
);

COMMENT ON COLUMN TB_USER_FINKOUT.FINKOUT_NO IS '탈퇴유저번호';
COMMENT ON COLUMN TB_USER_FINKOUT.USER_ID IS '탈퇴유저아이디';
COMMENT ON COLUMN TB_USER_FINKOUT.EMAIL IS '탈퇴유저이메일';
COMMENT ON COLUMN TB_USER_FINKOUT.FINKOUT_DATE IS '탈퇴일자';

COMMIT;



--DROP INDEX PK_TB_SUBSCRIBE;
DROP TABLE TB_SUBSCRIBE CASCADE CONSTRAINTS;
	
CREATE TABLE TB_SUBSCRIBE (
	SUBSCRIBE_NO NUMBER NOT NULL,
	SUBSCRIBE_NAME VARCHAR2(200) NOT NULL,
	PRICE NUMBER NOT NULL,
	SUBSCRIBE_DATE VARCHAR2(10)
);

COMMENT ON TABLE TB_SUBSCRIBE IS '구독상품';

COMMENT ON COLUMN TB_SUBSCRIBE.SUBSCRIBE_NO IS '상품번호';

COMMENT ON COLUMN TB_SUBSCRIBE.SUBSCRIBE_NAME IS '상품명';

COMMENT ON COLUMN TB_SUBSCRIBE.PRICE IS '가격';

COMMENT ON COLUMN TB_SUBSCRIBE.SUBSCRIBE_DATE IS '몇개월인지';

CREATE UNIQUE INDEX PK_TB_SUBSCRIBE
	ON TB_SUBSCRIBE (
		SUBSCRIBE_NO ASC
	);

ALTER TABLE TB_SUBSCRIBE
	ADD
		CONSTRAINT PK_TB_SUBSCRIBE
		PRIMARY KEY (
			SUBSCRIBE_NO
		);

ALTER TABLE TB_SUBSCRIBE_PAYMENT DROP CONSTRAINT PK_TB_SUBSCRIBE_PAYMENT;

--DROP INDEX PK_TB_SUBSCRIBE_PAYMENT;

DROP TABLE TB_SUBSCRIBE_PAYMENT 
	CASCADE CONSTRAINTS;

CREATE TABLE TB_SUBSCRIBE_PAYMENT (
	PAY_NO NUMBER NOT NULL,
	SUBSCRIBE_NAME VARCHAR2(100) NOT NULL,
	AMOUNT NUMBER,
	USER_ID NUMBER,
	PAY_METHOD VARCHAR2(50) NOT NULL,
	PAY_DATE DATE DEFAULT SYSDATE NOT NULL
);

COMMENT ON TABLE TB_SUBSCRIBE_PAYMENT IS '구독결제';

COMMENT ON COLUMN TB_SUBSCRIBE_PAYMENT.PAY_NO IS '결제번호';

COMMENT ON COLUMN TB_SUBSCRIBE_PAYMENT.USER_ID IS '결제 유저';

COMMENT ON COLUMN TB_SUBSCRIBE_PAYMENT.PAY_METHOD IS '결제수단';

COMMENT ON COLUMN TB_SUBSCRIBE_PAYMENT.PAY_DATE IS '결제일시';

CREATE UNIQUE INDEX PK_TB_SUBSCRIBE_PAYMENT
	ON TB_SUBSCRIBE_PAYMENT (
		PAY_NO ASC
	);

ALTER TABLE TB_SUBSCRIBE_PAYMENT
	ADD
		CONSTRAINT PK_TB_SUBSCRIBE_PAYMENT
		PRIMARY KEY (
			PAY_NO
		);

ALTER TABLE TB_SUBSCRIBE_PAYMENT
ADD CONSTRAINT FK_TB_USER_TO_TB_SUBSCRIBE_PAYMENT
FOREIGN KEY (USER_ID)
REFERENCES TB_USER (ID)
ON DELETE SET NULL;




ALTER TABLE TB_NOTICE DROP CONSTRAINT PK_TB_NOTICE;
--DROP INDEX PK_TB_NOTICE;
DROP TABLE TB_NOTICE 
	CASCADE CONSTRAINTS;

CREATE TABLE TB_NOTICE (
	NOTICE_NO NUMBER NOT NULL,
	WRITER NUMBER,
	NOTICE_TITLE VARCHAR2(300) NOT NULL,
	NOTICE_CONTENT VARCHAR2(3000) NOT NULL,
	WRITE_DATE DATE DEFAULT SYSDATE NOT NULL,
	MODIFY_DATE DATE DEFAULT SYSDATE NOT NULL,
	READ_COUNT NUMBER NOT NULL,
	IMPORTANCY VARCHAR2(1) DEFAULT '1' NOT NULL
);

COMMENT ON TABLE TB_NOTICE IS '공지사항';

COMMENT ON COLUMN TB_NOTICE.NOTICE_NO IS '공지번호';

COMMENT ON COLUMN TB_NOTICE.NOTICE_TITLE IS '제목';

COMMENT ON COLUMN TB_NOTICE.NOTICE_CONTENT IS '내용';

COMMENT ON COLUMN TB_NOTICE.WRITE_DATE IS '작성일';

COMMENT ON COLUMN TB_NOTICE.MODIFY_DATE IS '수정날짜';

COMMENT ON COLUMN TB_NOTICE.READ_COUNT IS '조회수';

COMMENT ON COLUMN TB_NOTICE.IMPORTANCY IS '중요도';

CREATE UNIQUE INDEX PK_TB_NOTICE
	ON TB_NOTICE (
		NOTICE_NO ASC
	);

ALTER TABLE TB_NOTICE
	ADD
		CONSTRAINT PK_TB_NOTICE
		PRIMARY KEY (
			NOTICE_NO
		);

ALTER TABLE TB_NOTICE
	ADD CONSTRAINT FK_TB_USER_TO_TB_NOTICE
	FOREIGN KEY (WRITER)
	REFERENCES TB_USER (ID)
	ON DELETE SET NULL;




--DROP INDEX PK_TB_INCONVINIENCE;

DROP TABLE TB_INCONVINIENCE_BOARD CASCADE CONSTRAINTS;

CREATE TABLE TB_INCONVINIENCE_BOARD (
	BOARD_NO NUMBER NOT NULL,
	WRITER NUMBER NOT NULL,
	BOARD_TITLE VARCHAR2(300) NOT NULL,
	BOARD_CONTENT VARCHAR2(3000) NOT NULL,
	WRITE_DATE DATE DEFAULT SYSDATE NOT NULL,
	MODIFY_DATE DATE DEFAULT SYSDATE NOT NULL,
	STATUS VARCHAR2(1) NOT NULL
);

COMMENT ON TABLE TB_INCONVINIENCE_BOARD IS '불편사항게시판';

COMMENT ON COLUMN TB_INCONVINIENCE_BOARD.BOARD_NO IS '게시글번호';

COMMENT ON COLUMN TB_INCONVINIENCE_BOARD.WRITER IS '작성자';

COMMENT ON COLUMN TB_INCONVINIENCE_BOARD.BOARD_TITLE IS '제목';

COMMENT ON COLUMN TB_INCONVINIENCE_BOARD.BOARD_CONTENT IS '내용';

COMMENT ON COLUMN TB_INCONVINIENCE_BOARD.WRITE_DATE IS '작성일';

COMMENT ON COLUMN TB_INCONVINIENCE_BOARD.MODIFY_DATE IS '수정날짜';

COMMENT ON COLUMN TB_INCONVINIENCE_BOARD.STATUS IS '조치상태';

CREATE UNIQUE INDEX PK_TB_INCONVINIENCE
	ON TB_INCONVINIENCE_BOARD (
		BOARD_NO ASC
	);

ALTER TABLE TB_INCONVINIENCE_BOARD
	ADD
		CONSTRAINT PK_TB_INCONVINIENCE
		PRIMARY KEY (
			BOARD_NO
		);

ALTER TABLE TB_INCONVINIENCE_BOARD
	ADD CONSTRAINT FK_TB_USER_TO_TB_INCONVINIENCE_BOARD
	FOREIGN KEY (WRITER)
	REFERENCES TB_USER (ID)
	ON DELETE SET NULL;


ALTER TABLE TB_INCONVINIENCE_BOARD_REPLY DROP CONSTRAINT PK_TB_INCONVINIENCE_REPLY;

--DROP INDEX PK_TB_INCONVINIENCE_REPLY;

DROP TABLE TB_INCONVINIENCE_BOARD_REPLY 
	CASCADE CONSTRAINTS;

CREATE TABLE TB_INCONVINIENCE_BOARD_REPLY (
	BOARD_NO NUMBER NOT NULL,
	WRITER NUMBER,
	WRITE_DATE DATE DEFAULT SYSDATE NOT NULL,
	COMMENT_CONTENT VARCHAR2(500) NOT NULL
);

COMMENT ON TABLE TB_INCONVINIENCE_BOARD_REPLY IS '불편사항게시판댓글';

COMMENT ON COLUMN TB_INCONVINIENCE_BOARD_REPLY.BOARD_NO IS '원글번호';

COMMENT ON COLUMN TB_INCONVINIENCE_BOARD_REPLY.WRITER IS '작성자';

COMMENT ON COLUMN TB_INCONVINIENCE_BOARD_REPLY.WRITE_DATE IS '작성날짜';

COMMENT ON COLUMN TB_INCONVINIENCE_BOARD_REPLY.COMMENT_CONTENT IS '댓글내용';

CREATE UNIQUE INDEX PK_TB_INCONVINIENCE_REPLY
	ON TB_INCONVINIENCE_BOARD_REPLY (
		BOARD_NO ASC
	);

ALTER TABLE TB_INCONVINIENCE_BOARD_REPLY
	ADD
		CONSTRAINT PK_TB_INCONVINIENCE_REPLY
		PRIMARY KEY (
			BOARD_NO
		);

ALTER TABLE TB_INCONVINIENCE_BOARD_REPLY
	ADD CONSTRAINT FK_TB_INCONVINIENCE_BOARD_TO_TB_INCONVINIENCE_BOARD_REPLY
	FOREIGN KEY (BOARD_NO)
	REFERENCES TB_INCONVINIENCE_BOARD (BOARD_NO)
	ON DELETE SET NULL;

ALTER TABLE TB_INCONVINIENCE_BOARD_REPLY
	ADD CONSTRAINT FK_TB_USER_TO_TB_INCONVINIENCE_BOARD_REPLY
	FOREIGN KEY (WRITER)
	REFERENCES TB_USER (ID)
	ON DELETE SET NULL;



ALTER TABLE TB_USER_SUSPENSION DROP CONSTRAINT PK_TB_USER_SUSPENSION;

--DROP INDEX PK_TB_USER_SUSPENSION;

DROP TABLE TB_USER_SUSPENSION 
	CASCADE CONSTRAINTS;

CREATE TABLE TB_USER_SUSPENSION (
	SUSPENSION_NO NUMBER NOT NULL,
	TARGET_ACCOUNT NUMBER,
	SUSPENSION_START DATE DEFAULT SYSDATE NOT NULL,
	SUSPENSION_END DATE DEFAULT SYSDATE,
	SUSPENSION_TITLE VARCHAR2(100) NOT NULL,
	SUSPENSION_CONTENT VARCHAR2(600)
);

COMMENT ON TABLE TB_USER_SUSPENSION IS '정지내역';

COMMENT ON COLUMN TB_USER_SUSPENSION.SUSPENSION_NO IS '정지번호';

COMMENT ON COLUMN TB_USER_SUSPENSION.TARGET_ACCOUNT IS '정지 유저';

COMMENT ON COLUMN TB_USER_SUSPENSION.SUSPENSION_START IS '정지시작날짜';

COMMENT ON COLUMN TB_USER_SUSPENSION.SUSPENSION_END IS '정지해제날짜';

COMMENT ON COLUMN TB_USER_SUSPENSION.SUSPENSION_TITLE IS '정지사유';

COMMENT ON COLUMN TB_USER_SUSPENSION.SUSPENSION_CONTENT IS '정지상세';

CREATE UNIQUE INDEX PK_TB_USER_SUSPENSION
	ON TB_USER_SUSPENSION (
		SUSPENSION_NO ASC
	);

ALTER TABLE TB_USER_SUSPENSION
	ADD
		CONSTRAINT PK_TB_USER_SUSPENSION
		PRIMARY KEY (
			SUSPENSION_NO
		);

ALTER TABLE TB_USER_SUSPENSION
	ADD CONSTRAINT FK_TB_USER_TO_TB_USER_SUSPENSION
	FOREIGN KEY (TARGET_ACCOUNT)
	REFERENCES TB_USER (ID)
	ON DELETE SET NULL;





-- TB_EMPLOYEE 테이블 생성 프로시저
CREATE OR REPLACE PROCEDURE CREATE_TB_EMPLOYEE (p_user_id IN NUMBER) IS
BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE TB_EMPLOYEE_' || p_user_id || ' (
        EMP_ID NUMBER,
        EMP_NAME VARCHAR2(30) NOT NULL,
        POSITION VARCHAR2(20) NOT NULL,
        EMP_HIREDATE DATE NOT NULL,
        EMP_PHONE VARCHAR2(15) NOT NULL,
        EMP_EMAIL VARCHAR2(30) NOT NULL,
        EMP_ADDRESS VARCHAR2(50) NOT NULL,
        EMP_BIRTHDATE DATE NOT NULL,
        EMP_GENDER VARCHAR2(1) CHECK (EMP_GENDER IN (''M'', ''F'')) NOT NULL,
        PRIMARY KEY(EMP_ID)
    )';
END;
/

-- TB_COMMUTE_INFO 테이블 생성 프로시저
CREATE OR REPLACE PROCEDURE CREATE_TB_COMMUTE_INFO (p_user_id IN NUMBER) IS
BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE TB_COMMUTE_INFO_' || p_user_id || ' (
        EMP_ID NUMBER NOT NULL,
        START_TIME DATE,
        WORK_DAY DATE,
        END_TIME DATE,
        WORKING_HOURS VARCHAR2(30),
        LATE_FLAG VARCHAR2(1) CHECK (LATE_FLAG IN (''N'', ''Y'')),
        LEAVE_EARLY VARCHAR2(1) CHECK (LEAVE_EARLY IN (''N'', ''Y'')),
        ABSENTEEISM VARCHAR2(1) CHECK (ABSENTEEISM IN (''N'', ''Y'')),
        FOREIGN KEY (EMP_ID) REFERENCES TB_EMPLOYEE_' || p_user_id || '(EMP_ID)
    )';
END;
/

-- TB_CALENDAR 테이블 생성 프로시저
CREATE OR REPLACE PROCEDURE CREATE_TB_CALENDAR (p_user_id IN NUMBER) IS
BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE TB_CALENDAR_' || p_user_id || ' (
        EMP_ID NUMBER NOT NULL,
        REMARKS VARCHAR2(3000),
        FOREIGN KEY (EMP_ID) REFERENCES TB_EMPLOYEE_' || p_user_id || '(EMP_ID)
    )';
END;
/

-- TB_SALARY_INFO 테이블 생성 프로시저
CREATE OR REPLACE PROCEDURE CREATE_TB_SALARY_INFO (p_user_id IN NUMBER) IS
BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE TB_SALARY_INFO_' || p_user_id || ' (
        EMP_ID NUMBER NOT NULL,
        BANK_NAME VARCHAR2(30) NOT NULL,
        BANK_ACCOUNT_NO VARCHAR2(20) NOT NULL,
        ACCOUNT_HOLDER VARCHAR2(30) NOT NULL,
        PREMIUM VARCHAR2(15),
        TAX VARCHAR2(15),
        FOREIGN KEY (EMP_ID) REFERENCES TB_EMPLOYEE_' || p_user_id || '(EMP_ID)
    )';
END;
/
CREATE OR REPLACE PROCEDURE CREATE_TB_POS (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    v_table_name := 'TB_POS_' || p_user_id;
    BEGIN
        EXECUTE IMMEDIATE 'CREATE TABLE ' || v_table_name || '(
                            POS_NO NUMBER PRIMARY KEY
                            )';
    END;
END;
/

CREATE OR REPLACE PROCEDURE CREATE_TB_TABLE (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    v_table_name := 'TB_TABLE_' || p_user_id;
    BEGIN
        EXECUTE IMMEDIATE 'CREATE TABLE ' || v_table_name || '(
                            TABLE_NO NUMBER PRIMARY KEY, 
                            TABLE_NAME VARCHAR2(60) NOT NULL,
                            TABLE_X NUMBER NOT NULL,
                            TABLE_Y NUMBER NOT NULL
                            )';
    END;
END;
/
CREATE OR REPLACE PROCEDURE CREATE_TB_MENU (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    v_table_name := 'TB_MENU_' || p_user_id;
    BEGIN
        EXECUTE IMMEDIATE 'CREATE TABLE ' || v_table_name || '(
                            MENU_NO NUMBER PRIMARY KEY,
                            MENU_NAME VARCHAR2(60) NOT NULL,
                            PRICE NUMBER NOT NULL
                            )';
    END;
END;
/
-------------------------------------
-- 예약관리 TABLE 생성
-------------------------------------
CREATE OR REPLACE PROCEDURE PR_CREATE_TB_RESERVATION_TABLE (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(200);
    v_str VARCHAR2(2000);
BEGIN
   -- 유저 아이디를 이용하여 테이블 이름 생성
   v_table_name := 'TB_RESERVATION_' || RTRIM(LTRIM(TO_CHAR(p_user_id)));
   dbms_output.put_line(v_table_name);
   
   BEGIN
      v_str := 'CREATE TABLE ' || v_table_name || '(' ||
               '   RSRV_NUM NUMBER NOT NULL ' ||
               ' ,RSRV_DATE VARCHAR2(8) ' ||
               ' ,RSRV_TIME VARCHAR2(6) ' ||
               ' ,RSRV_NAME VARCHAR2(50) ' ||
               ' ,RSRV_TELNO VARCHAR2(20) ' ||
               ' ,RSRV_INWON NUMBER DEFAULT 1 ' ||
               ' ,RSRV_SUBJECT VARCHAR2(50) ' ||
               ' ,RSRV_MEMO VARCHAR2(200) ' ||
               ' ,WRITER NUMBER ' ||
               ' ,WRITE_DATE DATE DEFAULT SYSDATE ' ||
               ' )';

      --dbms_output.put_line(v_str);
	  
      EXECUTE IMMEDIATE v_str;

      EXECUTE IMMEDIATE ' ALTER TABLE ' || v_table_name || 
                        ' ADD CONSTRAINT PK_' || v_table_name ||
                        '   PRIMARY KEY (RSRV_NUM)';

      EXECUTE IMMEDIATE 'COMMENT ON TABLE ' || v_table_name || ' IS ''예약관리''';
      EXECUTE IMMEDIATE 'COMMENT ON COLUMN ' || v_table_name || '.RSRV_NUM IS ''예약번호''';
      EXECUTE IMMEDIATE 'COMMENT ON COLUMN ' || v_table_name || '.RSRV_DATE IS ''예약일자''';
      EXECUTE IMMEDIATE 'COMMENT ON COLUMN ' || v_table_name || '.RSRV_TIME IS ''예약시간''';
      EXECUTE IMMEDIATE 'COMMENT ON COLUMN ' || v_table_name || '.RSRV_NAME IS ''예약자명''';
      EXECUTE IMMEDIATE 'COMMENT ON COLUMN ' || v_table_name || '.RSRV_TELNO IS ''예약전화번호''';
      EXECUTE IMMEDIATE 'COMMENT ON COLUMN ' || v_table_name || '.RSRV_INWON IS ''인원''';
      EXECUTE IMMEDIATE 'COMMENT ON COLUMN ' || v_table_name || '.RSRV_SUBJECT IS ''제목''';
      EXECUTE IMMEDIATE 'COMMENT ON COLUMN ' || v_table_name || '.RSRV_MEMO IS ''메모''';
      EXECUTE IMMEDIATE 'COMMENT ON COLUMN ' || v_table_name || '.WRITER IS ''작성일자''';
      EXECUTE IMMEDIATE 'COMMENT ON COLUMN ' || v_table_name || '.WRITE_DATE IS ''작성일자''';
	  
      --------------------------------------------
      --- SEQUENSE 추가(2024.04.07)
      --------------------------------------------
      EXECUTE IMMEDIATE 'CREATE SEQUENCE ' || v_table_name || '_SEQ '
                       || ' INCREMENT BY 1 ' 
					   || ' START WITH 1 ';
					   
   EXCEPTION
      WHEN OTHERS THEN
      dbms_output.put_line(sqlerrm); 
   END;
END;
/


CREATE SEQUENCE ingno
MINVALUE 1;

CREATE SEQUENCE inpno
MINVALUE 1;


-------------- 상품 테이블 --------------- 
CREATE OR REPLACE PROCEDURE create_goods_table (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    -- 유저 아이디를 이용하여 테이블 이름 생성
    v_table_name := 'TB_GOODS_' || p_user_id;

    -- 테이블 생성
    EXECUTE IMMEDIATE 'CREATE TABLE ' || v_table_name || '(
        ID NUMBER,
        GOODS_NO NUMBER NOT NULL PRIMARY KEY,
        GOODS_NAME VARCHAR2(300) NOT NULL,
        GOODS_UNIT VARCHAR2(30),
        GOODS_PRICE NUMBER,
        NATION VARCHAR2(30) DEFAULT NULL
    )';
EXCEPTION
    WHEN OTHERS THEN
        NULL; 
END;

/
-- 재고 테이블
CREATE OR REPLACE PROCEDURE create_inventory_table (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    -- 유저 아이디를 이용하여 테이블 이름 생성
    v_table_name := 'TB_INVENTORY_' || p_user_id;

    -- 동적 SQL 실행
    EXECUTE IMMEDIATE 'CREATE TABLE ' || v_table_name || '(
                        GOODS_NO NUMBER PRIMARY KEY,
                        PD_QUANTITY NUMBER NOT NULL,
                        MIN_ALARM_QUANTITY NUMBER,
                        MIN_ORDER_QUANTITY NUMBER,
                        FOREIGN KEY (GOODS_NO) REFERENCES TB_GOODS_' || p_user_id || '(GOODS_NO) ON DELETE CASCADE
                    )';
EXCEPTION
    WHEN OTHERS THEN
        NULL; 
END;

/

-- 발주처 테이블
CREATE OR REPLACE PROCEDURE create_produce_table (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    -- 유저 아이디를 이용하여 테이블 이름 생성
    v_table_name := 'TB_PRODUCE_' || p_user_id;

    -- 동적 SQL 실행
    EXECUTE IMMEDIATE 'CREATE TABLE ' || v_table_name || '(
            GOODS_NO NUMBER PRIMARY KEY,
            PD_NO NUMBER,
            PD_NAME VARCHAR2(300) NOT NULL,
            PRODUCER VARCHAR2(20),
            PD_PHONE VARCHAR2(30),
            PD_ADDRESS VARCHAR2(255),
            FOREIGN KEY (GOODS_NO) REFERENCES TB_GOODS_' || p_user_id || '(GOODS_NO) ON DELETE CASCADE
        )';
END;


/

-- 명세서 테이블
CREATE OR REPLACE PROCEDURE create_specify_table (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    -- 유저 아이디를 이용하여 테이블 이름 생성
    v_table_name := 'TB_SPECIFY_' || p_user_id;

    -- 동적 SQL 실행하여 테이블 생성
    EXECUTE IMMEDIATE '
        CREATE TABLE ' || v_table_name || '(
            ID NUMBER,
            PD_DATE VARCHAR2(10),
            PD_PRICE NUMBER,
            PD_MONTH VARCHAR2(10)
        )';

    -- 트리거 생성을 위한 동적 SQL 실행
    EXECUTE IMMEDIATE '
        CREATE OR REPLACE TRIGGER ' || v_table_name || '_update_pd_month_trigger
        BEFORE INSERT OR UPDATE ON ' || v_table_name || '
        FOR EACH ROW
        BEGIN
            IF :NEW.PD_DATE IS NOT NULL THEN
                :NEW.PD_MONTH := SUBSTR(:NEW.PD_DATE, 1, LENGTH(:NEW.PD_DATE) - 3);
            END IF;
        END;';
END;
/



CREATE OR REPLACE PROCEDURE create_sales_table (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    v_table_name := 'TB_SALES_' || p_user_id;

    EXECUTE IMMEDIATE '
        CREATE TABLE ' || v_table_name || '(
            SALE_ID NUMBER CONSTRAINT PK_' || v_table_name || ' PRIMARY KEY,
            EMP_ID NUMBER NOT NULL,
            SALE_DATE DATE DEFAULT SYSDATE,
            AMOUNT NUMBER,
            CONSTRAINT FK_' || v_table_name || '_EMP FOREIGN KEY (EMP_ID) REFERENCES TB_EMPLOYEE_' || p_user_id || ' (EMP_ID)
        )';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

CREATE OR REPLACE PROCEDURE create_salaryinfo_table (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    v_table_name := 'TB_SALARYINFO_' || p_user_id;

    EXECUTE IMMEDIATE '
        CREATE TABLE ' || v_table_name || '(
            SALARY_ID NUMBER CONSTRAINT PK_' || v_table_name || ' PRIMARY KEY,
            EMP_ID NUMBER NOT NULL,
            PAY_DATE DATE DEFAULT SYSDATE,
            SALARY_AMOUNT NUMBER,
            CONSTRAINT FK_' || v_table_name || '_EMP FOREIGN KEY (EMP_ID) REFERENCES TB_EMPLOYEE_' || p_user_id || ' (EMP_ID)
        )';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

CREATE OR REPLACE PROCEDURE create_additionalwages_table (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    v_table_name := 'TB_ADDITIONALWAGES_' || p_user_id;

    EXECUTE IMMEDIATE '
        CREATE TABLE ' || v_table_name || '(
            WAGE_ID NUMBER CONSTRAINT PK_' || v_table_name || ' PRIMARY KEY,
            EMP_ID NUMBER NOT NULL,
            WAGE_DATE DATE DEFAULT SYSDATE,
            WAGE_AMOUNT NUMBER,
            CONSTRAINT FK_' || v_table_name || '_EMP FOREIGN KEY (EMP_ID) REFERENCES TB_EMPLOYEE_' || p_user_id || ' (EMP_ID)
        )';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

CREATE OR REPLACE PROCEDURE DROP_TB_MENU (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    v_table_name := 'TB_MENU_' || p_user_id;
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE ' || v_table_name || '
                                    CASCADE CONSTRAINTS';
    END;
END;
/

CREATE OR REPLACE PROCEDURE DROP_TB_POS (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    v_table_name := 'TB_POS_' || p_user_id;
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE ' || v_table_name || '
                                    CASCADE CONSTRAINTS';
    END;
END;
/


CREATE OR REPLACE PROCEDURE DROP_TB_TABLE (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    v_table_name := 'TB_TABLE_' || p_user_id;
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE ' || v_table_name || '
                                    CASCADE CONSTRAINTS';
    END;
END;
/
-- 드랍 프로시져 -------------------------------
CREATE OR REPLACE PROCEDURE DROP_TB_INVENTORY (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    v_table_name := 'TB_INVENTORY_' || p_user_id;
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE ' || v_table_name || '
                                    CASCADE CONSTRAINTS';
    END;
END;
/


CREATE OR REPLACE PROCEDURE DROP_TB_PRODUCE (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    v_table_name := 'TB_PRODUCE_' || p_user_id;
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE ' || v_table_name || '
                                    CASCADE CONSTRAINTS';
    END;
END;
/


CREATE OR REPLACE PROCEDURE DROP_TB_SPECIFY (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    v_table_name := 'TB_SPECIFY_' || p_user_id;
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE ' || v_table_name || '
                                    CASCADE CONSTRAINTS';
    END;
END;
/

CREATE OR REPLACE PROCEDURE DROP_TB_GOODS (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    v_table_name := 'TB_GOODS_' || p_user_id;
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE ' || v_table_name || '
                                    CASCADE CONSTRAINTS';
    END;
END;
/
CREATE OR REPLACE PROCEDURE PR_DROP_TB_RESERVATION_TABLE (
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(200);
    v_str1 VARCHAR2(1000);
    v_str2 VARCHAR2(1000);
BEGIN
   -- 유저 아이디를 이용하여 테이블 이름 생성
   v_table_name := 'TB_RESERVATION_' || RTRIM(LTRIM(TO_CHAR(p_user_id)));
   dbms_output.put_line(v_table_name);
   
   BEGIN
      v_str1 := 'DROP TABLE ' || v_table_name || ' CASCADE CONSTRAINTS';
      EXECUTE IMMEDIATE v_str1;
      --dbms_output.put_line(v_str1);
	  
	  --- 2024.04.07 추가
      v_str2 := 'DROP SEQUENCE ' || v_table_name || '_SEQ ';
      EXECUTE IMMEDIATE v_str2;
      --dbms_output.put_line(v_str2);

   EXCEPTION
      WHEN OTHERS THEN
         dbms_output.put_line(sqlerrm); 
   END;
END;
/
-- TB_EMPLOYEE 테이블 삭제 프로시저
CREATE OR REPLACE PROCEDURE DROP_TB_EMPLOYEE(
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    v_table_name := 'TB_EMPLOYEE_' || p_user_id;
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE ' || v_table_name || '
                                    CASCADE CONSTRAINTS';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN -- 테이블이 존재하지 않을 때의 예외는 무시
                RAISE;
            END IF;
    END;
END;
/

-- TB_COMMUTE_INFO 테이블 삭제 프로시저
CREATE OR REPLACE PROCEDURE DROP_TB_COMMUTE_INFO(
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    v_table_name := 'TB_COMMUTE_INFO_' || p_user_id;
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE ' || v_table_name || '
                                    CASCADE CONSTRAINTS';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN
                RAISE;
            END IF;
    END;
END;
/

-- TB_CALENDAR 테이블 삭제 프로시저
CREATE OR REPLACE PROCEDURE DROP_TB_CALENDAR(
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    v_table_name := 'TB_CALENDAR_' || p_user_id;
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE ' || v_table_name || '
                                    CASCADE CONSTRAINTS';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN
                RAISE;
            END IF;
    END;
END;
/

-- TB_SALARY_INFO 테이블 삭제 프로시저
CREATE OR REPLACE PROCEDURE DROP_TB_SALARY_INFO(
    p_user_id IN NUMBER
)
IS
    v_table_name VARCHAR2(100);
BEGIN
    v_table_name := 'TB_SALARY_INFO_' || p_user_id;
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE ' || v_table_name || '
                                    CASCADE CONSTRAINTS';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN
                RAISE;
            END IF;
    END;
END;
/

CREATE OR REPLACE PROCEDURE drop_user_tables (
    p_user_id IN NUMBER
)
IS
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE TB_ADDITIONALWAGES_' || TO_CHAR(p_user_id,99999) || ' CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE TB_SALARYINFO_' || TO_CHAR(p_user_id,99999) || ' CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE TB_SALES_' || TO_CHAR(p_user_id,99999) || ' CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
