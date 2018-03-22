-- ���ν���(Procedure) : �Լ��� ���, �̸� o, �Ű����� o, ��ȯ�� x


-- �⺻ ����
CREATE OR REPLACE PROCEDURE hello -- �Ű������� ������ () ����
    IS -- ���ν����� ����, ���� ����
        msg VARCHAR2(20) := 'Hello, world'; -- �ʱⰪ ������ := (�Ҵ� ������)
    BEGIN -- ������ ����
        DBMS_OUTPUT.PUT_LINE(msg); -- ���
    END; -- ������ ��
/ -- ���ν����� ����

-- ���ν����� �ּ��� ����� �����ؾ� �Ѵ�.
CREATE OR REPLACE PROCEDURE hello
    IS
        msg VARCHAR2(20) := 'Hello, world';
    BEGIN
        DBMS_OUTPUT.PUT_LINE(msg);
    END;
/

SET SERVEROUTPUT ON; -- DBMS_OUTPUT.PUT_LINE() Ȱ��ȭ
EXECUTE hello; -- ����


-- IN �Ű�����
-- ���� ���ν��� ������ ����.
-- �����ȣ�� �޾� �ش� ����� �޿��� 10% �÷��ִ� ���ν���
SELECT * FROM employees;
DESC employees;
CREATE OR REPLACE PROCEDURE up_salary(eno IN NUMBER)
    IS
    BEGIN
        UPDATE employees SET salary = salary * 1.1
        WHERE emp_no = eno;
        COMMIT;
    END;
/
EXECUTE up_salary(113);


-- OUT �Ű�����
-- ���� ��ȯ�� �� ���
-- �����ȣ�� ������ ������ �޿� ��ȯ
CREATE OR REPLACE PROCEDURE find_emp(v_emp_no IN NUMBER, v_family_name OUT NVARCHAR2, v_first_name OUT NVARCHAR2, v_salary OUT NUMBER)
    IS
    BEGIN
        SELECT family_name, first_name, salary 
        INTO v_family_name, v_first_name, v_salary
        FROM employees
        WHERE emp_no = v_emp_no;
    END;
/

-- ��ȯ���� ���� ���� ����
VARIABLE family_name NVARCHAR2(10);
VARIABLE first_name NVARCHAR2(10);
VARIABLE salary NUMBER;

-- ����
EXECUTE find_emp(115, :family_name, :first_name, :salary);

-- ���� ���
PRINT family_name;
PRINT first_name;
PRINT salary;


-- IN OUT �Ű�����
-- �Է¹޾� ����� ���� ȣ���� �� ���
-- �����ȣ�� ������ �޿��� �����ش�.
CREATE OR REPLACE PROCEDURE find_sal(v_emp_no IN OUT NUMBER)
    IS
    BEGIN
        SELECT salary 
        INTO v_emp_no
        FROM employees 
        WHERE emp_no = v_emp_no;
    END;
/

-- �͸� ���ν���
DECLARE 
    v_emp_no NUMBER := 115;
    BEGIN
        dbms_output.put_line('eno = ' || v_emp_no);
        find_sal(v_emp_no);
        dbms_output.put_line('salary = ' || v_emp_no);
    END;
/


-- ���ν��� ��ȸ
SELECT * FROM USER_OBJECTS WHERE OBJECT_TYPE = 'PROCEDURE';


-- ���ν��� ����
DROP PROCEDURE hello;