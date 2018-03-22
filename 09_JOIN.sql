-- JOIN : �� �̻��� ���̺��� �����Ͽ� �����͸� �˻��ϴ� ���
-- �� ���̺� ������ �÷��� �ϳ� �̻� �����ؾ��Ѵ�.
-- �Ϲ������� PK�� FK�� Ȱ��

-- <Join�� ����>
-- Cross Join : ���� �Ⱦ�
-- Equi Join : � ����, ���� ����, ���� ����
-- Non-Equi Join : ���� �Ⱦ�
-- Self Join
-- Outer Join

-- <CROSS JOIN>
-- ī�ٽþ� �� ����
SELECT emp.ename, dept.dept_name FROM emp CROSS JOIN dept;
-- �����ϰ� ','�� ǥ�� ����
SELECT emp.ename, dept.dept_name FROM emp, dept;

-- <EQUI JOIN>
-- INNER JOIN(���� ���)
-- ��� ������ �̸�(emp ���̺�), �μ���(dept ���̺�)
SELECT E.ename, D.dept_name FROM emp E, dept D WHERE E.dept_no = D.dept_no; -- ���̺�� �ڿ� ��Ī �����ϰ� ���
SELECT E.ename, D.dept_name FROM emp E INNER JOIN dept D ON E.dept_no = D.dept_no; -- INNER JOIN ���
SELECT E.ename, D.dept_name FROM emp E JOIN dept D ON E.dept_no = D.dept_no; -- INNER ����
SELECT E.ename, D.dept_name FROM emp E JOIN dept D USING(dept_no); -- USING ���(�÷����� �����ؾ���), �ַ� ���
-- NATURAL JOIN
SELECT E.ename, D.dept_name FROM emp E NATURAL JOIN dept D; -- ������ �÷��� ��� �ڵ����� �������� �Ѵ�. ������ �ʿ� ����

-- <SELF JOIN>
-- �� ���̺� ������ ī�ٽþ� �� ����
SELECT A.ename AS ename_a, B.ename AS ename_b FROM emp A, emp B;

-- <Outer Join>
-- ���� ���ΰ� �ݴ� �������� ���ʿ� ���� �����͵� �����ش�.
-- Oracle ���� ����� ANSI SQL ����� �ִ�.
-- 1) Oracle ���� ���
SELECT DISTINCT(E.dept_no), D.dept_name FROM emp E, dept D WHERE E.dept_no = D.dept_no(+); -- emp���� ������, dept���� ���� �����͵� ǥ��
SELECT DISTINCT(E.dept_no), D.dept_name FROM emp E, dept D WHERE E.dept_no(+) = D.dept_no; -- emp���� ������, dept���� �ִ� �����͵� ǥ��
-- ���ʿ� (+)�� �ٴ� ȿ���� ������ FULL OUTER JOIN ���
-- 2) ANSI SQL ���
-- FROM [���̺�1] [LEFT | RIGHT | FULL] OUTER JOIN [���̺�2]
SELECT DISTINCT(E.dept_no), D.dept_name FROM emp E LEFT OUTER JOIN dept D ON E.dept_no = D.dept_no; -- ����(emp)�� �ִ� �����ʹ� ��� ǥ��
SELECT DISTINCT(E.dept_no), D.dept_name FROM emp E RIGHT OUTER JOIN dept D ON E.dept_no = D.dept_no; -- ������(dept)�� �ִ� �����ʹ� ��� ǥ��
SELECT DISTINCT(E.dept_no), D.dept_name FROM emp E FULL OUTER JOIN dept D ON E.dept_no = D.dept_no; -- ����ʿ��� �ִ� �����ʹ� ��� ǥ��
