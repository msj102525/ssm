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

