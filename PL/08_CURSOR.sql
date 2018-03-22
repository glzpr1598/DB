-- Ŀ��

-- �Ͻ��� Ŀ��
SELECT * FROM employees;
DECLARE
    v_emp employees%rowtype;
BEGIN
    SELECT salary 
    INTO v_emp.salary
    FROM employees 
    WHERE emp_no = 115;
    
    IF SQL%found THEN
        dbms_output.put_line('�˻��� �����Ͱ� �����մϴ�.');
        dbms_output.put_line('�˻��� ������ �� : ' || SQL%rowcount);
        dbms_output.put_line('�޿� : ' || v_emp.salary);
    ELSE
        dbms_output.put_line('�˻��� �����Ͱ� �������� �ʽ��ϴ�.');
    END IF;
END;
/


-- ����� Ŀ��
-- FOR LOOP�� Ŀ�� Ȱ��
DECLARE
    CURSOR cur IS SELECT * FROM dept;
BEGIN
    FOR v_dept IN cur
    LOOP
        dbms_output.put_line(v_dept.dept_no || ' / ' || v_dept.dept_name || ' / ' || v_dept.loc);
    END LOOP;
END;
/

-- �Ϲ����� Ŀ�� ����
-- is(����) -> open -> fetch -> close 
SELECT * FROM dept;
SET SERVEROUTPUT ON;
DECLARE
    I NUMBER(1) := 1;
    v_dept dept%rowtype;
    CURSOR cur IS SELECT * FROM dept; -- Ŀ�� ����
BEGIN
    OPEN cur; -- Ŀ�� ����
    LOOP
        FETCH cur INTO v_dept.dept_no, v_dept.dept_name, v_dept.loc; -- Ŀ�� ��ġ(Ŀ���� ���� ������ ������ �ִ´�.)
        dbms_output.put_line(v_dept.dept_no || ' / ' || v_dept.dept_name || ' / ' || v_dept.loc);
        i := i + 1;
        EXIT WHEN i = 5;
    END LOOP;
    CLOSE cur; -- Ŀ�� �ݱ�
END;
/

-- �� �ڵ带 FOR LOOP��.
-- FOR LOOP�� Ŀ���� OPEN, FETCH, CLOSE�� �ڵ����� ��.
SELECT * FROM dept;
DECLARE
    CURSOR cur IS SELECT * FROM dept; -- Ŀ�� ����
BEGIN
    FOR v_dept IN cur LOOP -- ��ġ�� ��
        dbms_output.put_line(v_dept.dept_no || ' / ' || v_dept.dept_name || ' / ' || v_dept.loc);
    END LOOP;
END;
/
