-- CRUD(Create, Read, Update, Delete)

-- ���� 1) emp ���̺� ename, ejob, dept_no�� �Է¹޾� �����͸� �߰��ϴ� ���ν��� ����
-- ex) emp_insert('Go', 'manager', '3');
SELECT * FROM emp;
CREATE OR REPLACE PROCEDURE emp_insert(v_ename IN emp.ename%TYPE, v_ejob IN emp.ejob%TYPE, v_dept_no IN emp.dept_no%TYPE)
IS
BEGIN
    INSERT INTO emp(ename, ejob, dept_no) VALUES(v_ename, v_ejob, v_dept_no);
    COMMIT;
END;
/
EXECUTE emp_insert('Go', 'manager', '3');


-- ���� 2) employees ���̺��� Ư�� ����� �޿��� n% �λ�/�����ϴ� ���ν���, ��ũ��Ʈ�� �����ȣ, �̸�, �޿� ���
-- ex) emp_update(117, 10) -- 117�� ����� �޿� 10% �λ�
--     emp_update(117, -10) -- 117�� ����� �޿� 10% ����
SELECT * FROM employees;
CREATE OR REPLACE PROCEDURE emp_update(v_emp_no IN employees.emp_no%TYPE, v_rate IN NUMBER)
IS
    v_emp employees%ROWTYPE;
BEGIN
    UPDATE employees 
    SET salary = salary * (1 + (v_rate/100)) 
    WHERE emp_no = v_emp_no;
    COMMIT;
        
    SELECT family_name, first_name, salary
    INTO v_emp.family_name, v_emp.first_name, v_emp.salary
    FROM employees
    WHERE emp_no = v_emp_no;
        
    dbms_output.put_line('�����ȣ : ' || v_emp.emp_no);
    dbms_output.put_line('�̸� : ' || v_emp.family_name || v_emp.first_name);
    dbms_output.put_line('�޿� : ' || v_emp.salary);
END;
/
SET SERVEROUTPUT ON;
EXECUTE emp_update(117, 10);
EXECUTE emp_update(117, -10);


-- ���� 3) �����ȣ�� �Է¹޾� employees ���̺��� �ش� ��� ����
-- ex) emp_del(117)
SELECT * FROM employees;
CREATE OR REPLACE PROCEDURE emp_del(v_emp_no employees.emp_no%TYPE)
IS
BEGIN
    DELETE FROM employees
    WHERE emp_no = v_emp_no;
    COMMIT;
    
    dbms_output.put_line('�����ȣ ' || v_emp_no || '�� ���� �Ϸ�');
END;
/
EXECUTE emp_del(116);


