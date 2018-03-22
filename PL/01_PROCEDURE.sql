-- 프로시저(Procedure) : 함수와 비슷, 이름 o, 매개변수 o, 반환값 x


-- 기본 문법
CREATE OR REPLACE PROCEDURE hello -- 매개변수가 없으면 () 생략
    IS -- 프로시저의 시작, 변수 선언
        msg VARCHAR2(20) := 'Hello, world'; -- 초기값 설정은 := (할당 연산자)
    BEGIN -- 문장의 시작
        DBMS_OUTPUT.PUT_LINE(msg); -- 출력
    END; -- 문장의 끝
/ -- 프로시저의 종료

-- 프로시저는 주석을 지우고 실행해야 한다.
CREATE OR REPLACE PROCEDURE hello
    IS
        msg VARCHAR2(20) := 'Hello, world';
    BEGIN
        DBMS_OUTPUT.PUT_LINE(msg);
    END;
/

SET SERVEROUTPUT ON; -- DBMS_OUTPUT.PUT_LINE() 활성화
EXECUTE hello; -- 실행


-- IN 매개변수
-- 값이 프로시저 안으로 들어간다.
-- 사원번호를 받아 해당 사원의 급여를 10% 올려주는 프로시저
SELECT * FROM employees;
DESC employees;
CREATE OR REPLACE PROCEDURE up_salary(eno IN NUMBER)
    IS
    BEGIN
        UPDATE employees SET salary = salary * 1.1
        WHERE emp_no = eno;
        COMMIT;
    END;
/
EXECUTE up_salary(113);


-- OUT 매개변수
-- 값을 반환할 때 사용
-- 사원번호를 넣으면 사원명과 급여 반환
CREATE OR REPLACE PROCEDURE find_emp(v_emp_no IN NUMBER, v_family_name OUT NVARCHAR2, v_first_name OUT NVARCHAR2, v_salary OUT NUMBER)
    IS
    BEGIN
        SELECT family_name, first_name, salary 
        INTO v_family_name, v_first_name, v_salary
        FROM employees
        WHERE emp_no = v_emp_no;
    END;
/

-- 반환값을 받을 변수 선언
VARIABLE family_name NVARCHAR2(10);
VARIABLE first_name NVARCHAR2(10);
VARIABLE salary NUMBER;

-- 실행
EXECUTE find_emp(115, :family_name, :first_name, :salary);

-- 변수 출력
PRINT family_name;
PRINT first_name;
PRINT salary;


-- IN OUT 매개변수
-- 입력받아 변경된 값을 호출할 때 사용
-- 사원번호를 넣으면 급여를 보여준다.
CREATE OR REPLACE PROCEDURE find_sal(v_emp_no IN OUT NUMBER)
    IS
    BEGIN
        SELECT salary 
        INTO v_emp_no
        FROM employees 
        WHERE emp_no = v_emp_no;
    END;
/

-- 익명 프로시저
DECLARE 
    v_emp_no NUMBER := 115;
    BEGIN
        dbms_output.put_line('eno = ' || v_emp_no);
        find_sal(v_emp_no);
        dbms_output.put_line('salary = ' || v_emp_no);
    END;
/


-- 프로시저 조회
SELECT * FROM USER_OBJECTS WHERE OBJECT_TYPE = 'PROCEDURE';


-- 프로시저 삭제
DROP PROCEDURE hello;