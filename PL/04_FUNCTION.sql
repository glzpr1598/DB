-- �Լ�(FUCNTION)
-- IN �Ű������� ��� ����, �ݵ�� RETURN�� �־�� �Ѵ�.
CREATE OR REPLACE FUNCTION f_hello
RETURN VARCHAR2
IS
    msg VARCHAR2(20) := 'Hello, function';
BEGIN
    RETURN msg;
END;
/
VARIABLE message VARCHAR2(20);
-- VARIABLE ������ ���� �Ҵ��� ������ ���� �տ��� : �� �پ�� �Ѵ�.
EXECUTE :message := f_hello;
PRINT message;

-- Ư�� ����� ������ �޿��� 10% �λ��ϰ� �� ���� ��ȯ
CREATE OR REPLACE FUNCTION f_up_salary(v_emp_no IN employees.emp_no%TYPE)
RETURN NUMBER
IS
    result employees.salary%TYPE;
BEGIN
    UPDATE employees
    SET salary = salary*1.1
    WHERE emp_no = v_emp_no;
        
   SELECT salary
    INTO result
    FROM employees
    WHERE emp_no = v_emp_no;
        
    COMMIT;
        
    RETURN result;
END;
/
VARIABLE msg NUMBER;
EXECUTE :msg := f_up_salary(115);
PRINT msg;


-- �Լ� ��ȸ
SELECT * FROM USER_OBJECTS WHERE OBJECT_TYPE = 'FUNCTION';


-- �Լ� ����
DROP FUNCTION f_hello;