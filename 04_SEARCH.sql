-- SELECT : Ư�� �÷� ��ȸ
-- SELECT [�÷�, ...] FROM [���̺��];
SELECT emp_no, family_name, first_name, salary/10000 FROM employees;
SELECT * FROM employees;

-- AS : ��Ī
SELECT emp_no, salary/10000 AS ����, salary*12/10000 AS ���� FROM employees;

-- || : ���ڿ� ��ġ��
SELECT emp_no, family_name||' '||first_name AS �̸�, salary/10000||'����' AS ���� FROM employees;

-- WHERE : Ư�� �������� ��ȸ
SELECT * FROM employees WHERE family_name = '��';
SELECT * FROM employees WHERE salary > 5000000;

-- AND, OR : ����
SELECT * FROM employees WHERE salary < 5000000 AND salary > 5000000;
SELECT * FROM employees WHERE salary >= 5000000 OR family_name = '��';

-- BETWEEN A AND B : A�� B ����
SELECT * FROM employees WHERE salary BETWEEN 5000000 AND 6000000;

-- DISTINCT : �ߺ�����
-- SELECT DISTINCT [�÷�] FROM [���̺�];
SELECT DISTINCT salary FROM EMPLOYEES;

-- IN : �������� ���� ǥ�� ��, �����ϰ� �ӵ��� ����
-- family_name�� ��, ��, ���� ��� ������ ��������
SELECT * FROM employees WHERE family_name = '��' OR family_name = '��' OR family_name = '��';
SELECT * FROM employees WHERE family_name IN('��', '��', '��'); -- �����ϰ� ������.

-- IS NULL / IS NOT NULL : NULL ����/�ƴ��� ����
SELECT * FROM employees WHERE commission IS NULL;
SELECT * FROM employees WHERE commission IS NOT NULL;

-- LIKE : ����� ������ �˻�
-- ù���ڰ� ab�� �����ϴ� ������ �˻� : ab%
-- ������ ���ڰ� ab�� ������ ������ �˻� : %ab
-- ab�� �����ϴ� ������ �˻� : %ab%
SELECT * FROM employees WHERE email LIKE 'K%';
SELECT * FROM employees WHERE email LIKE '%l%@%';

-- ORDER BY : ����(ASC, DESC), ���ڵ� ����
SELECT * FROM employees 
    ORDER BY FAMILY_NAME ASC;
SELECT * FROM employees 
    ORDER BY FAMILY_NAME; -- ASC�� �⺻��, ��������
-- ������ �������� ��������
SELECT family_name, first_name, salary, salary*12 AS annsal 
    FROM employees 
    ORDER BY annsal DESC;

-- GROUP BY : �׷���
-- �μ��� �޿� �ջ�
SELECT * FROM employees;
SELECT depart_no, SUM(salary) AS SUM 
    FROM employees
    GROUP BY depart_no ORDER BY SUM DESC;
-- �μ��� �޿�, �μ�Ƽ�� �ջ�
SELECT depart_no, SUM(salary) AS SUM, SUM(commission) 
    FROM employees
    GROUP BY depart_no ORDER BY SUM DESC;

-- HAVING : GROUP BY�� ����
SELECT depart_no, SUM(salary) AS SUM FROM employees
    GROUP BY depart_no
    HAVING SUM(salary) > 5000000
    ORDER BY SUM DESC;
