/* 
�빮�� : ��ɾ�
�ҹ��� : ������ �� �ִ� ��
��ü ���� : F5
���� ���� ���� : Ctrl + enter
*/

-- ���� ����
-- CREATE USER [������] IDENTIFIED BY [��й�ȣ];
CREATE USER web_user IDENTIFIED BY pass;
CREATE USER dba_user IDENTIFIED BY pass;
CREATE USER user02 IDENTIFIED BY pass3;

-- ���� ��й�ȣ ����
-- ALTER USER [������] IDENTIFIED BY [��й�ȣ];
ALTER USER user02 IDENTIFIED BY pass;

-- ���� ��ȸ
SELECT * FROM DBA_USERS;

-- ���� ����
-- DROP USER [������];
-- ���̺��� �����ϴ� ������ ���, �ڿ� CASCADE ��ɾ� ����
DROP USER user02;
DROP USER dba_user;

-- ���� �ο�
-- GRANT [���� | ��] TO [������];
-- ���� ���ѵ��� ������� ��
-- CONNECT �� : �����ͺ��̽� ����. ����, ���̺�, ��� ���� ��ü ����
-- RESOURCE �� : ����ڿ��� �ڽ��� ���̺�, ������, ���ν���, Ʈ���ſ� ���� ��ü�� ������ �� �ִ� ������ �ο��� ��.
-- DBA �� : ������
GRANT CONNECT, RESOURCE TO web_user; -- CONNECT, RESOURCE ���� �ο�
GRANT DBA TO web_user;

-- ���� ȸ��
-- REVOKE [����] FROM [������];
REVOKE DBA FROM web_user;

