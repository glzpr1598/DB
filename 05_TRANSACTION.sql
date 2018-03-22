-- Ʈ����� : �����ͺ��̽����� ���Ǵ� �ɰ� �� ���� ����ó�� ����

-- COMMIT : ������ ������ ������ ����
COMMIT;
-- SHOW AUTOCOMMIT : �⺻���� AUTO COMMIT Ȯ��
SHOW AUTOCOMMIT;
SET AUTOCOMMIT ON; -- ��� ����. �����ʴ� ���� ����.
SET AUTOCOMMIT OFF;
-- DDL(������ ���� ���)���� �ڵ� Ŀ�Ե�.(CREATE, ALTER, DROP, RENAME, TRANCATE)

-- ROLLBACK : ������ ����(INSERT, UPDATE, DELETE)�� ���
SELECT * FROM employees;
DELETE FROM employees;
ROLLBACK;
SELECT * FROM employees;

-- SAVEPOINT [����Ʈ�̸�] : �ѹ� ����Ʈ ����
SELECT * FROM employees;
SAVEPOINT pointa;
DELETE FROM employees WHERE emp_no BETWEEN 113 AND 115;
SAVEPOINT pointb;
DELETE FROM employees WHERE emp_no BETWEEN 116 AND 117;
SAVEPOINT pointc;

-- ROLLBACK TO [����Ʈ�̸�] : �ش� ����Ʈ�� �ѹ�
ROLLBACK TO pointc;
SELECT * FROM employees;
ROLLBACK TO pointb;
SELECT * FROM employees;
ROLLBACK TO pointa;
SELECT * FROM employees;
