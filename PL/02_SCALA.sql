-- 일반 데이터 타입
-- 변수명 데이터타입 := 초기값;
DECLARE
    var_emp_no NUMBER;
    var_emp_name VARCHAR2(20);
    var_emp_grade CHAR(2) := 'A';
    BEGIN
        var_emp_no := 123;
        var_emp_name := 'Kim';
        dbms_output.put_line('사원 번호 : ' || var_emp_no);
        dbms_output.put_line('사원 이름 : ' || var_emp_name);
        dbms_output.put_line('사원 평가 : ' || var_emp_grade);
    END;
/

-- 사원번호 115번에 대한 이름, 성, 급여
DECLARE
    var_first_name VARCHAR2(20);
    var_family_name VARCHAR2(20);
    var_salary NUMBER(10);
    BEGIN
        SELECT first_name, family_name, salary
        INTO var_first_name, var_family_name, var_salary
        FROM employees
        WHERE emp_no = 115;
        
        dbms_output.put_line('이름 : ' || var_first_name);
        dbms_output.put_line('성 : ' || var_family_name);
        dbms_output.put_line('급여 : ' || var_salary);
    END;
/


-- 스칼라 타입 : 특정 테이블의 컬럼 형태를 그대로 가져옴
-- 변수명 테이블명.컬럼명%TYPE;
DECLARE
    var_first_name employees.first_name%TYPE;
    var_family_name employees.family_name%TYPE;
    var_salary employees.salary%TYPE;
    BEGIN
        SELECT first_name, family_name, salary
        INTO var_first_name, var_family_name, var_salary
        FROM employees
        WHERE emp_no = 115;
        
        dbms_output.put_line('이름 : ' || var_first_name);
        dbms_output.put_line('성 : ' || var_family_name);
        dbms_output.put_line('급여 : ' || var_salary);
    END;
/

-- 사원 번호를 매개변수로 받는 프로시저로
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
        
        dbms_output.put_line('이름 : ' || v_first_name);
        dbms_output.put_line('성 : ' || v_family_name);
        dbms_output.put_line('급여 : ' || v_salary);
    END;
/
EXECUTE find_emp2(115);