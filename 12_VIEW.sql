-- ���� ��������
-- NULL ���� �÷��� �信 ���Ե��� �ʴ´�.
-- WITH READ ONLY �ɼ��� ������ ��� �����͸� ������ �� ����.
-- WITH CHECK OPTION �� ������ ��� �����͸� ����, ����, ������ �� �ִ�.
-- ROWID, ROWNUM, NEXTVAL, CURRVAL ���� ���� �÷��� ���� ������ �ִ� ��� �����͸� �߰��� �� ����.

-- �� ����
-- CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW ���̸� 
-- AS ����
-- [WHERE ����] [WITH CHECK OPTION | WITH READ ONLY]

-- OR REPLACE : ������ �̸��� ���� �䰡 ������ ��� �����.
-- FORCE : ���� ���̺� ������ ������� ������ �����. NOFORCE �� ����Ʈ

CREATE OR REPLACE VIEW vw_emp 
AS SELECT emp.ename, dept.dept_name FROM emp, dept
WHERE emp.dept_no = dept.dept_no;
-- ���� �ڵ� : ORA-01031: insufficient privileges : �� ���������� ����.
GRANT CREATE VIEW TO web_user; -- �� ���������� ��

-- �� Ȱ��
SELECT * FROM vw_emp;

-- �� ����
DROP VIEW vw_emp;

-- �� ��ȸ
SELECT * FROM USER_VIEWS;

-- WITH CHECK OPTION : ���� ���ǽ��� �����ϴ� ������ ������ �����ϵ��� �ϴ� �ɼ�
CREATE OR REPLACE VIEW vw_chk_option
AS SELECT ename, ejob, dept_no FROM emp
WHERE dept_no = '1' WITH CHECK OPTION; -- dept_no = '1'�� ���� ������ ���� ����

SELECT * FROM vw_chk_option;

-- �� ����
UPDATE vw_chk_option SET ejob = 'manager' WHERE ename = 'Park';

UPDATE vw_chk_option SET dept_no = '2' WHERE ename = 'Park';

-- �� ����
DROP VIEW vw_chk_option;

-- WITH READ ONLY :  ���� �Ұ���
CREATE VIEW vw_read_only
AS SELECT ename, ejob, dept_no FROM emp
WHERE dept_no = '2' WITH READ ONLY;

SELECT * FROM vw_read_only;

-- �� ����
UPDATE vw_read_only SET ejob = 'assistant' WHERE ename = 'Yu'; -- ����

-- �� ����
DROP VIEW vw_read_only;
