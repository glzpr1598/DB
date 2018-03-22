-- 제어문 IF
/********************
IF 조건 THEN
    실행문;
[ELSIF 조건 THEN
    실행문;]
...
[ELSE THEN
    실행문;]
END IF;
********************/

-- IF문 사용하여 부서 번호를 넣으면 부서명과 부서 위치를 알려주는 프로시저
SELECT * FROM dept;

CREATE OR REPLACE PROCEDURE dept_find(v_dept_no dept.dept_no%TYPE)
IS
BEGIN
    IF v_dept_no = 1 THEN
        dbms_output.put_line('부서명 : sales');
        dbms_output.put_line('부서 위치 : New York');
    ELSIF v_dept_no = 2 THEN
        dbms_output.put_line('부서명 : dev');
        dbms_output.put_line('부서 위치 : LA');
    ELSIF v_dept_no = 3 THEN
        dbms_output.put_line('부서명 : personnel');
        dbms_output.put_line('부서 위치 : Boston');
    ELSIF v_dept_no = 4 THEN
        dbms_output.put_line('부서명 : delivery');
        dbms_output.put_line('부서 위치 : New York');
    ELSE
        dbms_output.put_line('존재하지 않는 부서 번호입니다.');
    END IF;
END;
/
EXECUTE dept_find(1);

