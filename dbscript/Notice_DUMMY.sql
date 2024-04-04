TRUNCATE TABLE TB_NOTICE;

-- 1�� ���� ������ ����
INSERT INTO TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY)
VALUES (1, 1, '�߿� ����: �ý��� ���׷��̵� ���� �ȳ�', '�ȳ��ϼ���, ȸ�� ������! �÷����� ������ ����Ű�� ���� �ý��� ���׷��̵尡 �����Ǿ� �ֽ��ϴ�. ���׷��̵� �۾����� ���� �Ͻ������� ���� �̿��� ���ѵ� �� �ֽ��ϴ�. ���� ��Ź�帮��, �� ���� ���񽺸� �����ϱ� ���� �ּ��� ���ϰڽ��ϴ�.', SYSDATE, SYSDATE, 0, 2);

-- 2�� ���� ������ ����
INSERT INTO TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY)
VALUES (2, 2, '������ ������Ʈ ����: ���ο� é�� �߰�', '�ȳ��ϼ���, ȸ�� ������! ����� ���ο� é�͸� �߰��߽��ϴ�. �� ���� ��̷ο� �������� �����ϱ� ���� ����ϰ� �ֽ��ϴ�. �̹� é�ʹ� �������� �ǵ���� �ݿ��Ͽ� ���۵Ǿ����ϴ�. ���� ���� ��Ź�帳�ϴ�.', SYSDATE, SYSDATE, 0, 1);

-- 3�� ���� ������ ����
INSERT INTO TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY)
VALUES (3, 3, '������� ����: ���� ���� �ȳ�', '�ȳ��ϼ���, ����������Դϴ�. ���� �̿� �� ������ �߻��ϰų� �ñ��� ���� �����ø� �������� �������ּ���. ģ���ϰ� ���� �亯���� �������� ������ �ذ��ص帮�ڽ��ϴ�. �̿뿡 ������ ��� �˼��մϴ�.', SYSDATE, SYSDATE, 0, 3);

-- 4�� ���� ������ ����
INSERT INTO TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY)
VALUES (4, 4, '�̺�Ʈ ����: �߼� �̺�Ʈ ����', '�ȳ��ϼ���, ȸ�� ������! �߼��� �¾� Ư���� �̺�Ʈ�� �غ��߽��ϴ�. �پ��� ���ð� ������ �غ������� ���� ���� ��Ź�帳�ϴ�. �߼� �Ⱓ ���� �ູ�� �ð� �����ñ� �ٶ��ϴ�.', SYSDATE, SYSDATE, 0, 2);

-- 5�� ���� ������ ����
INSERT INTO TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY)
VALUES (5, 5, '��� ó�� �ȳ�', '�ȳ��ϼ���, ȸ�� ������. �ֱ� �÷��� �̿� �� ��ְ� �߻��߽��ϴ�. �츮 ���� ���� �� ������ �ذ��ϱ� ���� ��� ���Դϴ�. ������ �ذ�� ������ ���� ��Ź�帳�ϴ�.', SYSDATE, SYSDATE, 0, 1);

-- 6�� ���� ������ ����
INSERT INTO TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY)
VALUES (6, 6, '�޴��� ���� ���� �߰� �ȳ�', '�ȳ��ϼ���, ȸ�� ������! �÷����� �޴��� ���� ���񽺰� �߰��Ǿ����ϴ�. ���� �����ϰ� ���� �̿��� ���� ���� ���� ��Ź�帳�ϴ�. �����մϴ�.', SYSDATE, SYSDATE, 0, 3);

-- 7�� ���� ������ ����
INSERT INTO TB_NOTICE (NOTICE_NO, WRITER, NOTICE_TITLE, NOTICE_CONTENT, WRITE_DATE, MODIFY_DATE, READ_COUNT, IMPORTANCY)
VALUES (7, 7, '������ ������Ʈ ����: �ű� ä�� �߰�', '�ȳ��ϼ���, ȸ�� ������! ����� ���ο� ä���� �߰��߽��ϴ�. �� �پ��� �������� �����ϱ� ���� ����ϰ� �ֽ��ϴ�. �̹� ä���� ��������.', SYSDATE, SYSDATE, 0, 3);

commit;