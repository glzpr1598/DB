-- ��� IF
/********************
IF ���� THEN
    ���๮;
[ELSIF ���� THEN
    ���๮;]
...
[ELSE THEN
    ���๮;]
END IF;
********************/

-- IF�� ����Ͽ� �μ� ��ȣ�� ������ �μ���� �μ� ��ġ�� �˷��ִ� ���ν���
SELECT * FROM dept;

CREATE OR REPLACE PROCEDURE dept_find(v_dept_no dept.dept_no%TYPE)
IS
BEGIN
    IF v_dept_no = 1 THEN
        dbms_output.put_line('�μ��� : sales');
        dbms_output.put_line('�μ� ��ġ : New York');
    ELSIF v_dept_no = 2 THEN
        dbms_output.put_line('�μ��� : dev');
        dbms_output.put_line('�μ� ��ġ : LA');
    ELSIF v_dept_no = 3 THEN
        dbms_output.put_line('�μ��� : personnel');
        dbms_output.put_line('�μ� ��ġ : Boston');
    ELSIF v_dept_no = 4 THEN
        dbms_output.put_line('�μ��� : delivery');
        dbms_output.put_line('�μ� ��ġ : New York');
    ELSE
        dbms_output.put_line('�������� �ʴ� �μ� ��ȣ�Դϴ�.');
    END IF;
END;
/
EXECUTE dept_find(1);

