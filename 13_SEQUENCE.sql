-- ������ : ����ũ�� ���� �������ִ� ��ü, ���������� ����
-- ĳ�� �޸𸮿� �����Ͽ� ��� ����

-- ������ ����
-- CREATE SEQUENCE ��������
--      [START WITH n] : ���۰�(�⺻�� = 1)
--      [INCREMENT BY n] : n�� ����(�⺻�� = 1)
--      [MAXVLAUE n | NOMAXVALUE] : �ִ�(�⺻�� = 9999999999999999999999999999)
--      [MINVALUE n | NOMINVALUE] : �ּڰ�(�⺻�� = 1)
--      [CYCLE | NOCYCLE] : �ִ񰪿� ���޽� �ٽ� ������ ������(�⺻�� = NOCYCLE)
--      [CACHE [n] | NOCACHE] : ĳ�ÿ� ������ �� ������(�⺻�� = CACHE 20)
CREATE SEQUENCE seq_emp_no;
    
-- ������ �ѱ��
SELECT seq_emp_no.NEXTVAL FROM DUAL;  -- DUAL : ���� ���̺�
-- ������ ��ȸ
SELECT seq_emp_no.CURRVAL FROM DUAL;

-- START WITH ����
CREATE SEQUENCE seq_start
    START WITH 1000;
SELECT seq_start.NEXTVAL FROM DUAL;

-- MAXVALUE ����
CREATE SEQUENCE seq_test_max
    MAXVALUE 10;
SELECT seq_test_max.NEXTVAL FROM DUAL; -- MAXVALUE ���� �Ѿ�� ����

-- CYCLE ����
CREATE SEQUENCE seq_test_cycle
    MAXVALUE 10
    CYCLE
    NOCACHE; -- MAXVALUE���� ĳ�ð��� �۾ƾ���.
SELECT seq_test_cycle.NEXTVAL FROM DUAL;

-- ������� ������ ��ȸ
SELECT * FROM user_sequences;

-- ������ ����
-- ALTER SEQUENCE �������� �����ҿɼ�

-- ������ ����
DROP SEQUENCE seq_emp_no;
DROP SEQUENCE seq_start;
DROP SEQUENCE seq_test_cycle;
DROP SEQUENCE seq_test_max;
DROP SEQUENCE seq_test_min;


-- ������ Ȱ��
SELECT * FROM emp;
-- emp_no �߰�
ALTER TABLE emp ADD(emp_no NUMBER(20));
-- emp_no �÷��� seq_emp_no.NEXTVAL �Է�
INSERT INTO emp(emp_no, ename, ejob, dept_no, hire_date)
    VALUES(seq_emp_no.NEXTVAL, 'Jang', 'staff', '1', '18/01/10');
INSERT INTO emp(emp_no, ename, ejob, dept_no, hire_date)
    VALUES(seq_emp_no.NEXTVAL, 'Choi', 'staff', '2', '18/01/10');
