TRUNCATE TABLE TB_NOTICE;

-- 1번 더미 데이터 삽입
INSERT INTO TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY)
VALUES (1, 1, '중요 공지: 시스템 업그레이드 예정 안내', '안녕하세요, 회원 여러분! 플랫폼의 성능을 향상시키기 위한 시스템 업그레이드가 예정되어 있습니다. 업그레이드 작업으로 인해 일시적으로 서비스 이용이 제한될 수 있습니다. 양해 부탁드리며, 더 나은 서비스를 제공하기 위해 최선을 다하겠습니다.', SYSDATE, SYSDATE, 0, 2);

-- 2번 더미 데이터 삽입
INSERT INTO TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY)
VALUES (2, 2, '콘텐츠 업데이트 공지: 새로운 챕터 추가', '안녕하세요, 회원 여러분! 저희는 새로운 챕터를 추가했습니다. 더 많은 흥미로운 콘텐츠를 제공하기 위해 노력하고 있습니다. 이번 챕터는 여러분의 피드백을 반영하여 제작되었습니다. 많은 관심 부탁드립니다.', SYSDATE, SYSDATE, 0, 1);

-- 3번 더미 데이터 삽입
INSERT INTO TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY)
VALUES (3, 3, '기술지원 공지: 서비스 문의 안내', '안녕하세요, 기술지원팀입니다. 서비스 이용 중 문제가 발생하거나 궁금한 점이 있으시면 언제든지 문의해주세요. 친절하고 빠른 답변으로 여러분의 문제를 해결해드리겠습니다. 이용에 불편을 드려 죄송합니다.', SYSDATE, SYSDATE, 0, 3);

-- 4번 더미 데이터 삽입
INSERT INTO TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY)
VALUES (4, 4, '이벤트 공지: 추석 이벤트 개최', '안녕하세요, 회원 여러분! 추석을 맞아 특별한 이벤트를 준비했습니다. 다양한 혜택과 선물을 준비했으니 많은 참여 부탁드립니다. 추석 기간 동안 행복한 시간 보내시길 바랍니다.', SYSDATE, SYSDATE, 0, 2);

-- 5번 더미 데이터 삽입
INSERT INTO TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY)
VALUES (5, 5, '장애 처리 안내', '안녕하세요, 회원 여러분. 최근 플랫폼 이용 중 장애가 발생했습니다. 우리 팀은 현재 이 문제를 해결하기 위해 노력 중입니다. 문제가 해결될 때까지 양해 부탁드립니다.', SYSDATE, SYSDATE, 0, 1);

-- 6번 더미 데이터 삽입
INSERT INTO TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY)
VALUES (6, 6, '휴대폰 인증 서비스 추가 안내', '안녕하세요, 회원 여러분! 플랫폼에 휴대폰 인증 서비스가 추가되었습니다. 보다 안전하고 편리한 이용을 위해 많은 관심 부탁드립니다. 감사합니다.', SYSDATE, SYSDATE, 0, 3);

-- 7번 더미 데이터 삽입
INSERT INTO TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY)
VALUES (7, 7, '콘텐츠 업데이트 공지: 신규 채널 추가', '안녕하세요, 회원 여러분! 저희는 새로운 채널을 추가했습니다. 더 다양한 콘텐츠를 제공하기 위해 노력하고 있습니다. 이번 채널은 여러분의.', SYSDATE, SYSDATE, 0, 3);

commit;