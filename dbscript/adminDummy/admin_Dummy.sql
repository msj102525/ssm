delete TB_INCONVINIENCE_BOARD_REPLY;
delete tb_inconvinience_board;
-- 10���� ���� ������ ���� (�÷��� �������� �ʰ�, STATUS�� �������� 1���� 3����, WRITER�� �������� 1���� 10������ �� ����)
INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 1, '��ð� ��⿭�� ���� ����', '���� ��� �ð����� ���� ������ �����մϴ�.', SYSDATE - 10, SYSDATE, 1);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2, '���� �� û�ᵵ ����', '���� �� û�� ���°� ���ϵǾ� �־� �����մϴ�.', SYSDATE - 9, SYSDATE, 2);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 3, '��ǰ �ҷ����� ���� ��ȯ �����', '������ ��ǰ�� �ҷ��̶� ��ȯ�Ϸ��� �ϴ� ������� �ֽ��ϴ�.', SYSDATE - 8, SYSDATE, 3);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 4, '���� �� ����ǥ ��ǥ��', '��ǰ�� ����ǥ�� ��ǥ�õǾ� �־� ������ Ȯ���ϱ� ��ƽ��ϴ�.', SYSDATE - 7, SYSDATE, 1);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 5, '���� �µ� �Ҹ�', '���� ������ ���� �µ��� �Ҹ����������ϴ�.', SYSDATE - 6, SYSDATE, 2);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 6, '���� �� ��ֹ� ����', '���� �� ��ֹ��� �þ�� �̵��ϱ� ����������ϴ�.', SYSDATE - 5, SYSDATE, 3);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 7, 'ȯ�� ó�� ����', '��ǰ ȯ�� ó���� �����Ǿ� �־� �����մϴ�.', SYSDATE - 4, SYSDATE, 1);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 8, '�¶��� �ֹ� ����', '�¶��� �ֹ� �ý��ۿ��� ������ �߻��Ͽ� �ֹ��� ����������ϴ�.', SYSDATE - 3, SYSDATE, 2);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 9, '������ ȥ��', '���� �ֺ� �������� ȥ���Ͽ� �����ϱ� ��ƽ��ϴ�.', SYSDATE - 2, SYSDATE, 3);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 10, '���� �� ����', '���� ���ο��� ������ ������ ���� �����մϴ�.', SYSDATE - 1, SYSDATE, 1);

-- 10���� ���� ������ �߰�
INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 1, '���� �ý��� ���۵�', '���� �� ���� �ý����� �۵����� �ʾ� ������ ��ƽ��ϴ�.', SYSDATE - 10, SYSDATE, 2);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2, '��ǰ ó�� ����', '��ǰ ��ǰ ó���� ���� �ð��� �ɷ� �����մϴ�.', SYSDATE - 9, SYSDATE, 3);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 3, '��ǰ ��� ����', '���ͳ� �ֹ��� ��ǰ�� ����� �������� �ʾ��� �����մϴ�.', SYSDATE - 8, SYSDATE, 1);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 4, '���� �� ������ ����', '���� �ֺ� �������� �����Ͽ� �����ϱ� ��ƽ��ϴ�.', SYSDATE - 7, SYSDATE, 2);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 5, '��ǰ ���� ����', '������ ��ǰ�� ������ �����Ͽ� ������ �˱� ��ƽ��ϴ�.', SYSDATE - 6, SYSDATE, 3);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 6, '���� �� ���� �Ҹ� ŭ', '���� ������ Ʋ������ ������ �ʹ� �ò������ϴ�.', SYSDATE - 5, SYSDATE, 1);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 7, '��ٱ��� ��� ����', '�¶��� ���θ����� ��ٱ��Ͽ� ��ǰ�� ���� �� ������ �߻��մϴ�.', SYSDATE - 4, SYSDATE, 2);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 8, '��ǰ ���� ����', '������ ��ǰ�� ������ �����Ͽ� ��ǰ�� �ջ�� ����� �ֽ��ϴ�.', SYSDATE - 3, SYSDATE, 3);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 9, '���� �� �µ� ���� ����', '���� �� �µ��� �ʹ� ���Ƽ� �����մϴ�.', SYSDATE - 2, SYSDATE, 1);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 10, '���� �� ȭ��� û����� �ҷ�', '���� �� ȭ����� û������ �ʾ� ����ϱ� �����մϴ�.', SYSDATE - 1, SYSDATE, 2);

-- 10���� ���� ������ �߰�
INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 1, '��ǰ ���� �ν�', '������ ��ǰ�� ������ �ν��Ͽ� ��ǰ�� �ջ�Ǿ����ϴ�.', SYSDATE - 10, SYSDATE, 3);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 2, '������ ��� ����', '���忡�� ������ ����� �����Ǿ� �־� �����մϴ�.', SYSDATE - 9, SYSDATE, 1);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 3, '��ǰ���� ��ǥ��', '��ǰ�� ���� ������ �Һи��Ͽ� ���ÿ� ������� �ֽ��ϴ�.', SYSDATE - 8, SYSDATE, 2);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 4, '���� �� ���� �ν�', '���� �� �Ϻ� ������ ������ �ν��Ͽ� ��ӽ��ϴ�.', SYSDATE - 7, SYSDATE, 3);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 5, '���� �� ���� ����', '���� �� ��ǰ ����ǥ�� Ʋ�Ƚ��ϴ�.', SYSDATE - 6, SYSDATE, 1);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 6, '��ٱ��� ��� ���۵�', '�¶��� ���θ����� ��ٱ��Ͽ� ��ǰ�� ���� �� �����ϴ�.', SYSDATE - 5, SYSDATE, 2);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 7, '��ǰ �̸����� ��� ����', '�¶��� ���θ����� ��ǰ �̸����� ����� �۵����� �ʽ��ϴ�.', SYSDATE - 4, SYSDATE, 3);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 8, '��� ����', '���ͳ� �ֹ��� ��ǰ�� ����� �������� �ʾ��� �����մϴ�.', SYSDATE - 3, SYSDATE, 1);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 9, '���� �� ���� Ȱ�� ����', '���� �� ������ �����Ͽ� �����մϴ�.', SYSDATE - 2, SYSDATE, 2);

INSERT INTO TB_INCONVINIENCE_BOARD 
VALUES 
(INCONVINIENCE_SEQ.NEXTVAL, 10, '���� �� ���� ���ͳ� �Ҿ���', '���� �� ���� ���ͳ� ������ �Ҿ����Ͽ� ����ϱ� ��ƽ��ϴ�.', SYSDATE - 1, SYSDATE, 3);

--------------���
-- status�� 3�� �Խñۿ� ��� �ۼ�
INSERT INTO TB_INCONVINIENCE_BOARD_REPLY (BOARD_NO, WRITER, WRITE_DATE, COMMENT_CONTENT) VALUES 
(29, 1000, SYSDATE - 1, '��������� �ذ�Ǿ� ��ڰ� �����մϴ�. �����մϴ�.');
INSERT INTO TB_INCONVINIENCE_BOARD_REPLY (BOARD_NO, WRITER, WRITE_DATE, COMMENT_CONTENT) VALUES 
(11, 1001, SYSDATE - 4, '�ش� ��������� �ذ�Ǿ����ϴ�. �����մϴ�.');
INSERT INTO TB_INCONVINIENCE_BOARD_REPLY (BOARD_NO, WRITER, WRITE_DATE, COMMENT_CONTENT) VALUES 
(12, 1002, SYSDATE - 5, '�ش� ����� �ذ�Ǿ����ϴ�.');

-- status�� 2�� �Խñۿ� ���� "��ġ ��" ��� �ۼ�
INSERT INTO TB_INCONVINIENCE_BOARD_REPLY (BOARD_NO, WRITER, WRITE_DATE, COMMENT_CONTENT) VALUES 
(2, 1003, SYSDATE - 2, '��ġ ���Դϴ�. �ִ��� ���� �ذ��ϵ��� �ϰڽ��ϴ�.');
INSERT INTO TB_INCONVINIENCE_BOARD_REPLY (BOARD_NO, WRITER, WRITE_DATE, COMMENT_CONTENT) VALUES 
(30, 1004, SYSDATE - 3, '���� ���� ���� ��ġ�� �� �ֵ��� ����ϰڽ��ϴ�.');
INSERT INTO TB_INCONVINIENCE_BOARD_REPLY (BOARD_NO, WRITER, WRITE_DATE, COMMENT_CONTENT) VALUES 
(6, 1005, SYSDATE - 4, '��ġ ���Դϴ�. ������ ��� �˼��մϴ�.');
INSERT INTO TB_INCONVINIENCE_BOARD_REPLY (BOARD_NO, WRITER, WRITE_DATE, COMMENT_CONTENT) VALUES 
(27, 1000, SYSDATE - 1, '���� ��ġ ���Դϴ�. ������ �ϷḦ ���� ����ϰڽ��ϴ�.');
INSERT INTO TB_INCONVINIENCE_BOARD_REPLY (BOARD_NO, WRITER, WRITE_DATE, COMMENT_CONTENT) VALUES 
(28, 1001, SYSDATE - 2, '���� ���� ���� ��ġ�� �� �ֵ��� ����ϰڽ��ϴ�.');
INSERT INTO TB_INCONVINIENCE_BOARD_REPLY (BOARD_NO, WRITER, WRITE_DATE, COMMENT_CONTENT) VALUES 
(10,1002 , SYSDATE - 3, '��ġ ���̸�, ���� �ϷḦ ���� ����ϰ� �ֽ��ϴ�.');

commit;

delete tb_notice;
-- 10���� ���� ������ ���� INSERT ��
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1001, '�������� 1', '�̹� �ֿ��� ���ο� ����� �߰��߽��ϴ�.', to_date('2024-04-08','YYYY-MM-DD'), to_date('2024-04-08','YYYY-MM-DD'), 100, '3');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1002, '�߿� ����', '���� ����ȭ �ȳ�', to_date('2024-04-07','YYYY-MM-DD'), to_date('2024-04-08','YYYY-MM-DD'), 150, '2');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1001, '����: ������Ʈ ����', '���Ϻ��� �Ͻ������� ���񽺰� �ߴܵ� �����Դϴ�.', to_date('2024-04-06','YYYY-MM-DD'), to_date('2024-04-07','YYYY-MM-DD'), 200, '1');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1004, '��� ����', '�ý��� ��ַ� ���� ���񽺰� �ߴܵ˴ϴ�. ������ �����ϰڽ��ϴ�.', to_date('2024-04-05','YYYY-MM-DD'), to_date('2024-04-06','YYYY-MM-DD'), 300, '3');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1001, '�ʵ�: ���� �̿� �ȳ�', '���ο� ���� ��å�� ����˴ϴ�. ��� Ȯ�����ּ���.', to_date('2024-04-04','YYYY-MM-DD'), to_date('2024-04-05','YYYY-MM-DD'), 250, '2');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1000, '�ָ� ���� ���� �ȳ�', '�ָ� ���� ���� ������ ����� �����Դϴ�.', to_date('2024-04-03','YYYY-MM-DD'), to_date('2024-04-04','YYYY-MM-DD'), 180, '1');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1002, '��ް���: �ý��� ���׷��̵�', '���� ���� 2�ú��� �ý��� ���׷��̵� �۾��� ����� �����Դϴ�.', to_date('2024-04-02','YYYY-MM-DD'), to_date('2024-04-03','YYYY-MM-DD'), 220, '3');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1005, '�ֿ� ������� �ȳ�', '���� �̿� ����� ����Ǿ����ϴ�. �ڼ��� ������ Ȩ�������� �������ּ���.', to_date('2024-04-01','YYYY-MM-DD'), to_date('2024-04-02','YYYY-MM-DD'), 170, '2');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1001, '���� �̿� �� ���ǻ���', '���� �̿� �� �������� ��ȣ�� �����ϼ���.', to_date('2024-03-31','YYYY-MM-DD'), to_date('2024-04-01','YYYY-MM-DD'), 190, '1');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1005, '���� ������Ʈ ����', '���� ������Ʈ�� �Ϸ��߽��ϴ�. ���ο� ����� ��ܺ�����.', to_date('2024-03-30','YYYY-MM-DD'), to_date('2024-03-31','YYYY-MM-DD'), 210, '3');
-- �߰��� 10���� ���� ������ ���� INSERT ��
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1000, '���� �̿� �ȳ�', '���� �̿� �ð��� ����Ǿ����ϴ�. ���ο� �ð��� ���� �̿����ּ���.', to_date('2024-03-29','YYYY-MM-DD'), to_date('2024-03-30','YYYY-MM-DD'), 220, '2');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1004, '���� ��� �ȳ�', '�Ͻ����� ���� ��ַ� ������ ��� �˼��մϴ�. �ִ��� ���� ���� ���� �����ϰڽ��ϴ�.', to_date('2024-03-28','YYYY-MM-DD'), to_date('2024-03-29','YYYY-MM-DD'), 180, '1');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1002, '�ָ� �޹� �ȳ�', '���� �� �ָ��� �޹��Դϴ�. �� �� �����Ͻþ� �̿� ��Ź�帳�ϴ�.', to_date('2024-03-27','YYYY-MM-DD'), to_date('2024-03-28','YYYY-MM-DD'), 250, '3');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1004, '��� ���� ���� � �ȳ�', '��� ���� ������ ��ð��� ����Ǿ����ϴ�. �ڼ��� ������ ������ �������ּ���.', to_date('2024-03-26','YYYY-MM-DD'), to_date('2024-03-27','YYYY-MM-DD'), 300, '2');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1001, '���� ���� �ȳ�', '���� �ֿ� ���� ������ �����Ǿ� �ֽ��ϴ�. �̿뿡 �����Ͻñ� �ٶ��ϴ�.', to_date('2024-03-25','YYYY-MM-DD'), to_date('2024-03-26','YYYY-MM-DD'), 210, '1');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1000, '���� �̿� ��� �ȳ�', '���ο� ��� ��� ����� ���� �ȳ��Դϴ�. �ڼ��� ������ Ȩ�������� �������ּ���.', to_date('2024-03-24','YYYY-MM-DD'), to_date('2024-03-25','YYYY-MM-DD'), 270, '3');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1002, '���ο� ��� ���', '���úη� ���ο� ����� ����߽��ϴ�. �̿��غ�����!', to_date('2024-03-23','YYYY-MM-DD'), to_date('2024-03-24','YYYY-MM-DD'), 190, '2');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1003, '���� ���׷��̵� ����', '���� �ֿ� ���� ���׷��̵� �۾��� ���� �����Դϴ�. �̿뿡 ������ ��� �˼��մϴ�.', to_date('2024-03-22','YYYY-MM-DD'), to_date('2024-03-23','YYYY-MM-DD'), 230, '1');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1001, '���� �̿� �ȳ�', '���� �̿� �� �߻��� ���� �ذ��� ���� �ȳ��Դϴ�. �ڼ��� ������ Ȩ�������� �������ּ���.', to_date('2024-03-21','YYYY-MM-DD'), to_date('2024-03-22','YYYY-MM-DD'), 240, '3');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1003, '���� �̿� �ȳ�', '���� �̿� ����� ���� �ȳ��Դϴ�. �ڼ��� ������ Ȩ�������� �������ּ���.', to_date('2024-03-20','YYYY-MM-DD'), to_date('2024-03-21','YYYY-MM-DD'), 260, '2');
-- �߰��� 10���� ���� ������ ���� INSERT ��
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1000, '���� ��� �ȳ�', '���� ���񽺿� ��ְ� �߻��Ͽ� ���� ���� ���� �ذ��ϰڽ��ϴ�. �̿뿡 ������ ��� �˼��մϴ�.', to_date('2024-03-19','YYYY-MM-DD'), to_date('2024-03-20','YYYY-MM-DD'), 180, '1');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1003, '���ο� ��� ���', '���ο� ����� ����Ͽ����ϴ�. �̿��� �����е��� ���� ���� ��Ź�帳�ϴ�.', to_date('2024-03-18','YYYY-MM-DD'), to_date('2024-03-19','YYYY-MM-DD'), 220, '2');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1002, '�ֿ� ������Ʈ ����', '���� �ֿ� �ֿ��� ������Ʈ�� �����Ǿ� �ֽ��ϴ�. ������ֽñ� �ٶ��ϴ�.', to_date('2024-03-17','YYYY-MM-DD'), to_date('2024-03-18','YYYY-MM-DD'), 250, '3');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1001, '�ý��� ���� �ȳ�', '���� �ý��� �������� ���� �Ͻ����� ������ �Ұ����� �� �ֽ��ϴ�. ���� ��Ź�帳�ϴ�.', to_date('2024-03-16','YYYY-MM-DD'), to_date('2024-03-17','YYYY-MM-DD'), 200, '1');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1000, '�̿��� ����', '�̿����� ����Ǿ����ϴ�. ����� ������ Ȯ���Ͻð� �������ּ���.', to_date('2024-03-15','YYYY-MM-DD'), to_date('2024-03-16','YYYY-MM-DD'), 240, '2');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1003, '���� ������Ʈ �ȳ�', '���ο� ����� �߰��� ������Ʈ�� �ֽ��ϴ�. �ڼ��� ������ ������ �������ּ���.', to_date('2024-03-14','YYYY-MM-DD'), to_date('2024-03-15','YYYY-MM-DD'), 280, '3');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1002, '���� �̿� �ȳ�', '���� �̿� �� �߻��� ������ �ذ��Ͽ����ϴ�. �̿뿡 ������ ��� �˼��մϴ�.', to_date('2024-03-13','YYYY-MM-DD'), to_date('2024-03-14','YYYY-MM-DD'), 260, '2');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1003, '�̿�� ���� �ȳ�', '�̿���� �����ϸ� �߰� ������ �ֽ��ϴ�. �ڼ��� ������ �̿�� �������� Ȯ�����ּ���.', to_date('2024-03-12','YYYY-MM-DD'), to_date('2024-03-13','YYYY-MM-DD'), 230, '1');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1001, '���� �̿� ��� �ȳ�', '���ο� ��� ��� ����� ���� �ȳ��Դϴ�. �ڼ��� ������ ������ �������ּ���.', to_date('2024-03-11','YYYY-MM-DD'), to_date('2024-03-12','YYYY-MM-DD'), 290, '3');
Insert into TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY) values (NOTICE_SEQ.NEXTVAL, 1000, '�������� �ȳ�', '���� �̿�� ���õ� ���������Դϴ�. �̿��� �������� ���ؿ� ������ ��Ź�帳�ϴ�.', to_date('2024-03-10','YYYY-MM-DD'), to_date('2024-03-11','YYYY-MM-DD'), 270, '2');
commit;

delete tb_subscribe;
delete tb_subscribe_payment;
-- ���� ������ ���� INSERT �� (���ڸ�)
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
-- ���� ������ ���� INSERT ��
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'Basic Plan', 10000, 1, 'Credit Card', SYSDATE);
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'Standard Plan', 20000, 2, 'PayPal', SYSDATE);
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'Premium Plan', 30000, 3, 'Credit Card', SYSDATE);
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'Gold Plan', 40000, 4, 'Bank Transfer', SYSDATE);
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'Platinum Plan', 50000, 5, 'Credit Card', SYSDATE);
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'Trial Plan', 0, 6, 'Free Trial', SYSDATE);
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'Family Plan', 60000, 7, 'Credit Card', SYSDATE);
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'Student Plan', 8000, 8, 'PayPal', SYSDATE);
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'Corporate Plan', 100000, 9, 'Credit Card', SYSDATE);
Insert into TB_SUBSCRIBE_PAYMENT (PAY_NO, SUBSCRIBE_NAME, AMOUNT, USER_ID, PAY_METHOD, PAY_DATE) values (SUBSCRIBE_PAYMENT_SEQ.NEXTVAL, 'VIP Plan', 120000, 10, 'Credit Card', SYSDATE);

commit;
delete tb_user_suspension;
-- ���� ������ ���� INSERT ��
Insert into TB_USER_SUSPENSION (SUSPENSION_NO, TARGET_ACCOUNT, SUSPENSION_START, SUSPENSION_END, SUSPENSION_TITLE, SUSPENSION_CONTENT) values (SUSPENSION_SEQ.NEXTVAL, 1, to_date('2024-04-01', 'YYYY-MM-DD'), to_date('2024-04-10', 'YYYY-MM-DD'), '�������� ȫ��', '�������� ȫ���� ���� ���� ���� ��ġ');
Insert into TB_USER_SUSPENSION (SUSPENSION_NO, TARGET_ACCOUNT, SUSPENSION_START, SUSPENSION_END, SUSPENSION_TITLE, SUSPENSION_CONTENT) values (SUSPENSION_SEQ.NEXTVAL, 2, to_date('2024-03-15', 'YYYY-MM-DD'), to_date('2024-03-20', 'YYYY-MM-DD'), '�弳 ���', '�弳 ������� ���� ���� ���� ��ġ');
Insert into TB_USER_SUSPENSION (SUSPENSION_NO, TARGET_ACCOUNT, SUSPENSION_START, SUSPENSION_END, SUSPENSION_TITLE, SUSPENSION_CONTENT) values (SUSPENSION_SEQ.NEXTVAL, 3, to_date('2024-02-10', 'YYYY-MM-DD'), to_date('2024-02-20', 'YYYY-MM-DD'), '�ҹ� ������ �Խ�', '�ҹ� ������ �Խ÷� ���� ���� ���� ��ġ');
Insert into TB_USER_SUSPENSION (SUSPENSION_NO, TARGET_ACCOUNT, SUSPENSION_START, SUSPENSION_END, SUSPENSION_TITLE, SUSPENSION_CONTENT) values (SUSPENSION_SEQ.NEXTVAL, 4, to_date('2024-01-05', 'YYYY-MM-DD'), to_date('2024-01-15', 'YYYY-MM-DD'), '���� ����', '���� �������� ���� ���� ���� ��ġ');
Insert into TB_USER_SUSPENSION (SUSPENSION_NO, TARGET_ACCOUNT, SUSPENSION_START, SUSPENSION_END, SUSPENSION_TITLE, SUSPENSION_CONTENT) values (SUSPENSION_SEQ.NEXTVAL, 5, to_date('2023-12-20', 'YYYY-MM-DD'), to_date('2023-12-25', 'YYYY-MM-DD'), '�Ǽ� �ڵ� �Խ�', '�Ǽ� �ڵ� �Խ÷� ���� ���� ���� ��ġ');
Insert into TB_USER_SUSPENSION (SUSPENSION_NO, TARGET_ACCOUNT, SUSPENSION_START, SUSPENSION_END, SUSPENSION_TITLE, SUSPENSION_CONTENT) values (SUSPENSION_SEQ.NEXTVAL, 6, to_date('2023-11-15', 'YYYY-MM-DD'), to_date('2023-11-30', 'YYYY-MM-DD'), '����� �㰡 ���� ��������', '����� �㰡 ���� ������������ ���� ���� ���� ��ġ');
Insert into TB_USER_SUSPENSION (SUSPENSION_NO, TARGET_ACCOUNT, SUSPENSION_START, SUSPENSION_END, SUSPENSION_TITLE, SUSPENSION_CONTENT) values (SUSPENSION_SEQ.NEXTVAL, 7, to_date('2023-10-10', 'YYYY-MM-DD'), to_date('2023-10-20', 'YYYY-MM-DD'), '�弳 ���', '�弳 ������� ���� ���� ���� ��ġ');
Insert into TB_USER_SUSPENSION (SUSPENSION_NO, TARGET_ACCOUNT, SUSPENSION_START, SUSPENSION_END, SUSPENSION_TITLE, SUSPENSION_CONTENT) values (SUSPENSION_SEQ.NEXTVAL, 8, to_date('2023-09-05', 'YYYY-MM-DD'), to_date('2023-09-15', 'YYYY-MM-DD'), '�������� ����', '�������� ����� ���� ���� ���� ��ġ');
Insert into TB_USER_SUSPENSION (SUSPENSION_NO, TARGET_ACCOUNT, SUSPENSION_START, SUSPENSION_END, SUSPENSION_TITLE, SUSPENSION_CONTENT) values (SUSPENSION_SEQ.NEXTVAL, 9, to_date('2023-08-01', 'YYYY-MM-DD'), to_date('2023-08-10', 'YYYY-MM-DD'), '�弳 ���', '�弳 ������� ���� ���� ���� ��ġ');
Insert into TB_USER_SUSPENSION (SUSPENSION_NO, TARGET_ACCOUNT, SUSPENSION_START, SUSPENSION_END, SUSPENSION_TITLE, SUSPENSION_CONTENT) values (SUSPENSION_SEQ.NEXTVAL, 10, to_date('2023-07-20', 'YYYY-MM-DD'), to_date('2023-07-25', 'YYYY-MM-DD'), '�������� ȫ��', '�������� ȫ���� ���� ���� ���� ��ġ');
commit;

