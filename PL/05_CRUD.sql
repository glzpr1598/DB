-- CRUD(Create, Read, Update, Delete)

-- 문제 1) emp 테이블에 ename, ejob, dept_no을 입력받아 데이터를 추가하는 프로시저 생성
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


-- 문제 2) employees 테이블에서 특정 사원의 급여를 n% 인상/인하하는 프로시저, 스크립트로 사원번호, 이름, 급여 출력
-- ex) emp_update(117, 10) -- 117번 사원의 급여 10% 인상
--     emp_update(117, -10) -- 117번 사원의 급여 10% 인하
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
        
    dbms_output.put_line('사원번호 : ' || v_emp.emp_no);
    dbms_output.put_line('이름 : ' || v_emp.family_name || v_emp.first_name);
    dbms_output.put_line('급여 : ' || v_emp.salary);
END;
/
SET SERVEROUTPUT ON;
EXECUTE emp_update(117, 10);
EXECUTE emp_update(117, -10);


-- 문제 3) 사원번호를 입력받아 employees 테이블에서 해당 사원 삭제
-- ex) emp_del(117)
SELECT * FROM employees;
CREATE OR REPLACE PROCEDURE emp_del(v_emp_no employees.emp_no%TYPE)
IS
BEGIN
    DELETE FROM employees
    WHERE emp_no = v_emp_no;
    COMMIT;
    
    dbms_output.put_line('사원번호 ' || v_emp_no || '번 삭제 완료');
END;
/
EXECUTE emp_del(116);


