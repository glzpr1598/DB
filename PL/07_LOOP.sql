-- 반복문

/***************************
LOOP
    실행문;
    EXIT WHEN 조건
END LOOP;
***************************/

/***************************
WHILE 조건 LOOP
    실행문;
END LOOP;
***************************/

/***************************
FOR 변수 IN 초기값..최종값 || 커서 || SELECT문
LOOP
    실행문;
END LOOP;
***************************/


-- LOOP 반복문으로 1부터 5까지 출력
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

-- LOOP 반복문으로 dept 테이블에 있는 dept_no, dept_name, loc을 모두 출력
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


-- WHILE 반복문으로 1부터 5까지 출력
DECLARE
    I NUMBER(1) := 1;
BEGIN
    WHILE I <= 5 LOOP
        dbms_output.put_line(I);
        I := I + 1;
    END LOOP;
END;
/

-- WHILE 반복문으로 dept 테이블에 있는 dept_no, dept_name, loc을 모두 출력(SELECT문 사용)
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


-- FOR 반복문으로 1부터 5까지 출력
BEGIN
    FOR I IN 1..5 LOOP
          dbms_output.put_line(I);
    END LOOP;
END;
/

-- FOR 반복문으로 emp 테이블의 정보 출력
SELECT * FROM emp ORDER BY hire_date;
BEGIN
    FOR v_emp IN (SELECT ename, ejob, dept_no, hire_date FROM emp ORDER BY hire_date)
    LOOP
        dbms_output.put_line(v_emp.ename || ' / ' || v_emp.ejob || ' / ' || v_emp.hire_date);
    END LOOP;
END;
/
