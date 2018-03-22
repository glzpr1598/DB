-- 함수(FUCNTION)
-- IN 매개변수만 사용 가능, 반드시 RETURN이 있어야 한다.
CREATE OR REPLACE FUNCTION f_hello
RETURN VARCHAR2
IS
    msg VARCHAR2(20) := 'Hello, function';
BEGIN
    RETURN msg;
END;
/
VARIABLE message VARCHAR2(20);
-- VARIABLE 변수에 값을 할당할 때에는 변수 앞에도 : 을 붙어야 한다.
EXECUTE :message := f_hello;
PRINT message;

-- 특정 사번을 넣으면 급여를 10% 인상하고 그 값을 반환
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


-- 함수 조회
SELECT * FROM USER_OBJECTS WHERE OBJECT_TYPE = 'FUNCTION';


-- 함수 삭제
DROP FUNCTION f_hello;