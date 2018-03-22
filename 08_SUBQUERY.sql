-- �������� : ���� ���� ����

-- ���̺� ����
CREATE TABLE emp(
    ename VARCHAR2(20),
    ejob VARCHAR2(50),
    dept_no VARCHAR2(10),
    hire_date DATE
);

-- ������ �Է�
INSERT INTO emp VALUES('Kim', 'manager', '1', TO_DATE('15/08/27', 'YY/MM/DD'));
INSERT INTO emp VALUES('Lee', 'staff', '3', to_date('16/01/02', 'YY/MM/DD'));
INSERT INTO emp VALUES('Park', 'assistant', '1', to_date('16/06/02', 'YY/MM/DD'));
INSERT INTO emp VALUES('Yu', 'staff', '2', to_date('17/03/03', 'YY/MM/DD'));
INSERT INTO emp VALUES('Yun', 'staff', '2', to_date('16/01/09', 'YY/MM/DD'));
INSERT INTO emp VALUES('Jo', 'assistant', '3', to_date('15/07/05', 'YY/MM/DD'));
INSERT INTO emp VALUES('Jeong', 'assistant', '1', TO_DATE('16/09/25', 'YY/MM/DD'));
INSERT INTO emp VALUES('Hong', 'staff', '3', to_date('16/10/02', 'YY/MM/DD'));
INSERT INTO emp VALUES('Gang', 'manager', '2', TO_DATE('17/08/01', 'YY/MM/DD'));
INSERT INTO emp VALUES('Park', 'assistant', '5', '18/01/02');
    
SELECT * FROM emp;

-- ���̺� ����
CREATE TABLE dept(
    dept_no VARCHAR2(10),
    dept_name VARCHAR2(20),
    loc VARCHAR2(10)
);

-- ������ �Է�
INSERT INTO dept VALUES('1', 'sales', 'New York');
INSERT INTO dept VALUES('2', 'dev', 'LA');
INSERT INTO dept VALUES('3', 'personnel', 'Boston');
INSERT INTO dept VALUES('4', 'maketing', 'New York');

SELECT * FROM dept;


-- ���� 1) Gang�� �ٹ��μ�?
SELECT dept_no FROM emp WHERE ename = 'Gang';
SELECT dept_name FROM dept WHERE dept_no = '2';
-- �������� Ȱ��
SELECT dept_name FROM dept WHERE dept_no = (SELECT dept_no FROM emp WHERE ename = 'Gang');

-- ���� 2) �μ� ��ġ�� LA �Ǵ� Boston�� �μ��� ���� ������� �̸��� ��å
SELECT dept_no FROM dept WHERE loc IN('LA', 'Boston');
SELECT ename, ejob, dept_no FROM emp WHERE dept_no IN('2', '3');
-- �������� Ȱ��(IN)
-- IN : ���Կ��� Ȯ�� ����
SELECT ename, ejob, dept_no FROM emp 
    WHERE dept_no IN(SELECT dept_no FROM dept WHERE loc IN('LA', 'Boston'));

-- ���� 3) ��å�� staff�� �����麸�� �Ի����� ���� ��� ������ ã��
SELECT * FROM emp WHERE ejob = 'staff';
SELECT * FROM emp WHERE hire_date < '16/01/02';
-- �������� Ȱ��(ALL)
-- ALL : AND ����
-- ANY : OR ����
SELECT * FROM emp WHERE hire_date < ALL(SELECT hire_date FROM emp WHERE ejob = 'staff');

-- ���� 4) �Ի����� ���� ���� manager���� �Ի����� ���� ����
SELECT hire_date FROM emp WHERE ejob = 'manager';
SELECT * FROM emp WHERE hire_date > '15/08/27';
-- �������� Ȱ��(ANY)
SELECT * FROM emp WHERE hire_date > ANY(SELECT hire_date FROM emp WHERE ejob = 'manager');

-- ���� 5) �μ��� ���� ��
SELECT COUNT(*) FROM emp WHERE dept_no = '1';
SELECT COUNT(*) FROM emp WHERE dept_no = '2';
SELECT COUNT(*) FROM emp WHERE dept_no = '3';
-- ���������� ������ ���� �ϳ��� �÷����� -> ���ϰ��� ����
SELECT dept_name, loc, dept_no, (SELECT COUNT(*) FROM emp WHERE emp.dept_no = dept.dept_no) AS cnt FROM dept;
-- ���̺� �̸��� ��� �������� ��Ī�� �� �� ����.
SELECT dept_name, loc, dept_no, (SELECT COUNT(*) FROM emp WHERE emp.dept_no = d.dept_no) AS cnt FROM dept d;

