-- 커서

-- 암시적 커서
SELECT * FROM employees;
DECLARE
    v_emp employees%rowtype;
BEGIN
    SELECT salary 
    INTO v_emp.salary
    FROM employees 
    WHERE emp_no = 115;
    
    IF SQL%found THEN
        dbms_output.put_line('검색한 데이터가 존재합니다.');
        dbms_output.put_line('검색한 데이터 수 : ' || SQL%rowcount);
        dbms_output.put_line('급여 : ' || v_emp.salary);
    ELSE
        dbms_output.put_line('검색한 데이터가 존재하지 않습니다.');
    END IF;
END;
/


-- 명시적 커서
-- FOR LOOP에 커서 활용
DECLARE
    CURSOR cur IS SELECT * FROM dept;
BEGIN
    FOR v_dept IN cur
    LOOP
        dbms_output.put_line(v_dept.dept_no || ' / ' || v_dept.dept_name || ' / ' || v_dept.loc);
    END LOOP;
END;
/

-- 일반적인 커서 사용법
-- is(선언) -> open -> fetch -> close 
SELECT * FROM dept;
SET SERVEROUTPUT ON;
DECLARE
    I NUMBER(1) := 1;
    v_dept dept%rowtype;
    CURSOR cur IS SELECT * FROM dept; -- 커서 선언
BEGIN
    OPEN cur; -- 커서 열기
    LOOP
        FETCH cur INTO v_dept.dept_no, v_dept.dept_name, v_dept.loc; -- 커서 패치(커서의 값을 가져와 변수에 넣는다.)
        dbms_output.put_line(v_dept.dept_no || ' / ' || v_dept.dept_name || ' / ' || v_dept.loc);
        i := i + 1;
        EXIT WHEN i = 5;
    END LOOP;
    CLOSE cur; -- 커서 닫기
END;
/

-- 위 코드를 FOR LOOP로.
-- FOR LOOP는 커서의 OPEN, FETCH, CLOSE가 자동으로 됨.
SELECT * FROM dept;
DECLARE
    CURSOR cur IS SELECT * FROM dept; -- 커서 선언
BEGIN
    FOR v_dept IN cur LOOP -- 패치가 됨
        dbms_output.put_line(v_dept.dept_no || ' / ' || v_dept.dept_name || ' / ' || v_dept.loc);
    END LOOP;
END;
/
