-- �ݺ���

/***************************
LOOP
    ���๮;
    EXIT WHEN ����
END LOOP;
***************************/

/***************************
WHILE ���� LOOP
    ���๮;
END LOOP;
***************************/

/***************************
FOR ���� IN �ʱⰪ..������ || Ŀ�� || SELECT��
LOOP
    ���๮;
END LOOP;
***************************/


-- LOOP �ݺ������� 1���� 5���� ���
DECLARE 
    i NUMBER(2) := 1;
BEGIN
    LOOP
        i := i + 1;
        dbms_output.put_line(i);
        EXIT WHEN I >= 5;
    END LOOP;
END;
/

-- LOOP �ݺ������� dept ���̺� �ִ� dept_no, dept_name, loc�� ��� ���
SELECT * FROM dept;
DECLARE
    NUM NUMBER(2) := 1;
    v_dept dept%ROWTYPE;
BEGIN
    LOOP 
        SELECT dept_no, dept_name, loc
        INTO v_dept.dept_no, v_dept.dept_name, v_dept.loc
        FROM dept
        WHERE dept_no = NUM;
        
        dbms_output.put_line(v_dept.dept_no || ' / ' || v_dept.dept_name || ' / ' || v_dept.loc);
        
        NUM := NUM + 1;
        
        EXIT WHEN NUM = 5;
    END LOOP;
END;
/


-- WHILE �ݺ������� 1���� 5���� ���
DECLARE
    I NUMBER(1) := 1;
BEGIN
    WHILE I <= 5 LOOP
        dbms_output.put_line(I);
        I := I + 1;
    END LOOP;
END;
/

-- WHILE �ݺ������� dept ���̺� �ִ� dept_no, dept_name, loc�� ��� ���(SELECT�� ���)
DECLARE
    NUM NUMBER(1) := 1;
    v_dept dept%ROWTYPE;
BEGIN
    WHILE NUM <= 4 LOOP
        SELECT dept_no, dept_name, loc
        INTO v_dept.dept_no, v_dept.dept_name, v_dept.loc
        FROM dept
        WHERE dept_no = NUM;
        
        dbms_output.put_line(v_dept.dept_no || ' / ' || v_dept.dept_name || ' / ' || v_dept.loc);
        
        NUM := NUM + 1;
    END LOOP;
END;
/


-- FOR �ݺ������� 1���� 5���� ���
BEGIN
    FOR I IN 1..5 LOOP
          dbms_output.put_line(I);
    END LOOP;
END;
/

-- FOR �ݺ������� emp ���̺��� ���� ���
SELECT * FROM emp ORDER BY hire_date;
BEGIN
    FOR v_emp IN (SELECT ename, ejob, dept_no, hire_date FROM emp ORDER BY hire_date)
    LOOP
        dbms_output.put_line(v_emp.ename || ' / ' || v_emp.ejob || ' / ' || v_emp.hire_date);
    END LOOP;
END;
/
