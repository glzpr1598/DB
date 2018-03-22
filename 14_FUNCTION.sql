-- ���� �Լ�

-- COUNT(), SUM(), AVG(), MAX(), MIN()
SELECT COUNT(dept_no) FROM emp;
SELECT SUM(dept_no) FROM emp;
SELECT AVG(dept_no) FROM emp;
SELECT MAX(hire_date) FROM emp;
SELECT MIN(hire_date) FROM emp;


-- ���� �Լ�

-- ABS(num) : ����
SELECT ABS(-1.23) FROM dual;
-- CEIL(num) : �Ҽ��� �ø�
SELECT CEIL(10.1) FROM dual;
-- FLOOR(num) : �Ҽ��� ����
SELECT FLOOR(10.1) FROM dual;
-- ROUND(num, pos) : num�� �Ҽ� pos��° �ڸ����� �ݿø�
SELECT ROUND(192.153, 2) FROM dual;
-- TRUNC(num, pos) : num�� �Ҽ� pos��° �ڸ����� ����
SELECT TRUNC(192.153, 2) FROM dual;
-- MOD(num1, num2) : num1�� num2�� ���� ������
SELECT MOD(10, 3) FROM dual;


-- ��¥ �Լ�

-- SYSDATE : ���� �ð�(�ʱ���)
SELECT sysdate AS "����" FROM dual; -- YY/MM/DD �������� ǥ��
SELECT to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') AS "����" FROM dual; -- ��¥ ǥ�� ����
SELECT to_char(sysdate - 1, 'YYYY-MM-DD HH24:MI:SS') AS "�Ϸ� ��" FROM dual; -- �Ϸ� ��
SELECT to_char(sysdate - (1/24), 'YYYY-MM-DD HH24:MI:SS') AS "�� �ð� ��" FROM dual; -- �� �ð� ��
-- SYSTIMESTAMP : ���� �ð�(10����� 1�ʱ���)
SELECT systimestamp AS "����" FROM dual;
SELECT to_char(systimestamp, 'YYYY-MM-DD HH24:MI:SS.FF3') AS "����" FROM dual;  -- �Ҽ� 3° �ڸ����� ǥ��
