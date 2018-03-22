-- 로우타입 : 테이블의 컬럼과 데이터타입을 모두 가져온다.
-- 변수명 테이블%ROWTYPE;
DECLARE
    v_emp employees%ROWTYPE;
    BEGIN
        SELECT first_name, family_name, salary
        INTO v_emp.first_name, v_emp.family_name, v_emp.salary
        FROM employees
        WHERE emp_no = 115;
        
        dbms_output.put_line('이름 : ' || v_emp.first_name);
        dbms_output.put_line('성 : ' || v_emp.family_name);
        dbms_output.put_line('급여 : ' || v_emp.salary);
    END;
/