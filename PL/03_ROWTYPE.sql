-- �ο�Ÿ�� : ���̺��� �÷��� ������Ÿ���� ��� �����´�.
-- ������ ���̺�%ROWTYPE;
DECLARE
    v_emp employees%ROWTYPE;
    BEGIN
        SELECT first_name, family_name, salary
        INTO v_emp.first_name, v_emp.family_name, v_emp.salary
        FROM employees
        WHERE emp_no = 115;
        
        dbms_output.put_line('�̸� : ' || v_emp.first_name);
        dbms_output.put_line('�� : ' || v_emp.family_name);
        dbms_output.put_line('�޿� : ' || v_emp.salary);
    END;
/