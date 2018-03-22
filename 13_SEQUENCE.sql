-- 시퀀스 : 유니크한 값을 생성해주는 객체, 순차적으로 증가
-- 캐시 메모리에 저장하여 사용 가능

-- 시퀀스 생성
-- CREATE SEQUENCE 시퀀스명
--      [START WITH n] : 시작값(기본값 = 1)
--      [INCREMENT BY n] : n씩 증가(기본값 = 1)
--      [MAXVLAUE n | NOMAXVALUE] : 최댓값(기본값 = 9999999999999999999999999999)
--      [MINVALUE n | NOMINVALUE] : 최솟값(기본값 = 1)
--      [CYCLE | NOCYCLE] : 최댓값에 도달시 다시 시작할 것인지(기본값 = NOCYCLE)
--      [CACHE [n] | NOCACHE] : 캐시에 저장을 할 것인지(기본값 = CACHE 20)
CREATE SEQUENCE seq_emp_no;
    
-- 시퀀스 넘기기
SELECT seq_emp_no.NEXTVAL FROM DUAL;  -- DUAL : 가상 테이블
-- 시퀀스 조회
SELECT seq_emp_no.CURRVAL FROM DUAL;

-- START WITH 조건
CREATE SEQUENCE seq_start
    START WITH 1000;
SELECT seq_start.NEXTVAL FROM DUAL;

-- MAXVALUE 조건
CREATE SEQUENCE seq_test_max
    MAXVALUE 10;
SELECT seq_test_max.NEXTVAL FROM DUAL; -- MAXVALUE 값을 넘어가면 에러

-- CYCLE 조건
CREATE SEQUENCE seq_test_cycle
    MAXVALUE 10
    CYCLE
    NOCACHE; -- MAXVALUE보다 캐시값이 작아야함.
SELECT seq_test_cycle.NEXTVAL FROM DUAL;

-- 사용자의 시퀀스 조회
SELECT * FROM user_sequences;

-- 시퀀스 수정
-- ALTER SEQUENCE 시퀀스명 수정할옵션

-- 시퀀스 삭제
DROP SEQUENCE seq_emp_no;
DROP SEQUENCE seq_start;
DROP SEQUENCE seq_test_cycle;
DROP SEQUENCE seq_test_max;
DROP SEQUENCE seq_test_min;


-- 시퀀스 활용
SELECT * FROM emp;
-- emp_no 추가
ALTER TABLE emp ADD(emp_no NUMBER(20));
-- emp_no 컬럼에 seq_emp_no.NEXTVAL 입력
INSERT INTO emp(emp_no, ename, ejob, dept_no, hire_date)
    VALUES(seq_emp_no.NEXTVAL, 'Jang', 'staff', '1', '18/01/10');
INSERT INTO emp(emp_no, ename, ejob, dept_no, hire_date)
    VALUES(seq_emp_no.NEXTVAL, 'Choi', 'staff', '2', '18/01/10');
