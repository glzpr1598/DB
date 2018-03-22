-- �Ϲ� ������ Ÿ��
-- ������ ������Ÿ�� := �ʱⰪ;
DECLARE
    var_emp_no NUMBER;
    var_emp_name VARCHAR2(20);
    var_emp_grade CHAR(2) := 'A';
    BEGIN
        var_emp_no := 123;
        var_emp_name := 'Kim';
        dbms_output.put_line('��� ��ȣ : ' || var_emp_no);
        dbms_output.put_line('��� �̸� : ' || var_emp_name);
        dbms_output.put_line('��� �� : ' || var_emp_grade);
    END;
/

-- �����ȣ 115���� ���� �̸�, ��, �޿�
DECLARE
    var_first_name VARCHAR2(20);
    var_family_name VARCHAR2(20);
    var_salary NUMBER(10);
    BEGIN
        SELECT first_name, family_name, salary
        INTO var_first_name, var_family_name, var_salary
        FROM employees
        WHERE emp_no = 115;
        
        dbms_output.put_line('�̸� : ' || var_first_name);
        dbms_output.put_line('�� : ' || var_family_name);
        dbms_output.put_line('�޿� : ' || var_salary);
    END;
/


-- ��Į�� Ÿ�� : Ư�� ���̺��� �÷� ���¸� �״�� ������
-- ������ ���̺��.�÷���%TYPE;
DECLARE
    var_first_name employees.first_name%TYPE;
    var_family_name employees.family_name%TYPE;
    var_salary employees.salary%TYPE;
    BEGIN
        SELECT first_name, family_name, salary
        INTO var_first_name, var_family_name, var_salary
        FROM employees
        WHERE emp_no = 115;
        
        dbms_output.put_line('�̸� : ' || var_first_name);
        dbms_output.put_line('�� : ' || var_family_name);
        dbms_output.put_line('�޿� : ' || var_salary);
    END;
/

-- ��� ��ȣ�� �Ű������� �޴� ���ν�����
CREATE OR REPLACE PROCEDURE find_emp2(v_emp_no IN employees.emp_no%TYPE)
    IS
        v_first_name employees.first_name%TYPE;
        v_family_name employees.family_name%TYPE;
        v_salary employees.salary%TYPE;
    BEGIN
        SELECT first_name, family_name, salary
        INTO v_first_name, v_family_name, v_salary
        FROM employees
        WHERE emp_no = v_emp_no;
        
        dbms_output.put_line('�̸� : ' || v_first_name);
        dbms_output.put_line('�� : ' || v_family_name);
        dbms_output.put_line('�޿� : ' || v_salary);
    END;
/
EXECUTE find_emp2(115);