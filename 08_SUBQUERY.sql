-- 서브쿼리 : 쿼리 안의 쿼리

-- 테이블 생성
CREATE TABLE emp(
    ename VARCHAR2(20),
    ejob VARCHAR2(50),
    dept_no VARCHAR2(10),
    hire_date DATE
);

-- 데이터 입력
INSERT INTO emp VALUES('Kim', 'manager', '1', TO_DATE('15/08/27', 'YY/MM/DD'));
INSERT INTO emp VALUES('Lee', 'staff', '3', to_date('16/01/02', 'YY/MM/DD'));
INSERT INTO emp VALUES('Park', 'assistant', '1', to_date('16/06/02', 'YY/MM/DD'));
INSERT INTO emp VALUES('Yu', 'staff', '2', to_date('17/03/03', 'YY/MM/DD'));
INSERT INTO emp VALUES('Yun', 'staff', '2', to_date('16/01/09', 'YY/MM/DD'));
INSERT INTO emp VALUES('Jo', 'assistant', '3', to_date('15/07/05', 'YY/MM/DD'));
INSERT INTO emp VALUES('Jeong', 'assistant', '1', TO_DATE('16/09/25', 'YY/MM/DD'));
INSERT INTO emp VALUES('Hong', 'staff', '3', to_date('16/10/02', 'YY/MM/DD'));
INSERT INTO emp VALUES('Gang', 'manager', '2', TO_DATE('17/08/01', 'YY/MM/DD'));
INSERT INTO emp VALUES('Park', 'assistant', '5', '18/01/02');
    
SELECT * FROM emp;

-- 테이블 생성
CREATE TABLE dept(
    dept_no VARCHAR2(10),
    dept_name VARCHAR2(20),
    loc VARCHAR2(10)
);

-- 데이터 입력
INSERT INTO dept VALUES('1', 'sales', 'New York');
INSERT INTO dept VALUES('2', 'dev', 'LA');
INSERT INTO dept VALUES('3', 'personnel', 'Boston');
INSERT INTO dept VALUES('4', 'maketing', 'New York');

SELECT * FROM dept;


-- 문제 1) Gang의 근무부서?
SELECT dept_no FROM emp WHERE ename = 'Gang';
SELECT dept_name FROM dept WHERE dept_no = '2';
-- 서브쿼리 활용
SELECT dept_name FROM dept WHERE dept_no = (SELECT dept_no FROM emp WHERE ename = 'Gang');

-- 문제 2) 부서 위치가 LA 또는 Boston인 부서에 속한 사람들의 이름과 직책
SELECT dept_no FROM dept WHERE loc IN('LA', 'Boston');
SELECT ename, ejob, dept_no FROM emp WHERE dept_no IN('2', '3');
-- 서브쿼리 활용(IN)
-- IN : 포함여부 확인 가능
SELECT ename, ejob, dept_no FROM emp 
    WHERE dept_no IN(SELECT dept_no FROM dept WHERE loc IN('LA', 'Boston'));

-- 문제 3) 직책이 staff인 직원들보다 입사일이 빠른 사원 데이터 찾기
SELECT * FROM emp WHERE ejob = 'staff';
SELECT * FROM emp WHERE hire_date < '16/01/02';
-- 서브쿼리 활용(ALL)
-- ALL : AND 조건
-- ANY : OR 조건
SELECT * FROM emp WHERE hire_date < ALL(SELECT hire_date FROM emp WHERE ejob = 'staff');

-- 문제 4) 입사일이 가장 빠른 manager보다 입사일이 늦은 직원
SELECT hire_date FROM emp WHERE ejob = 'manager';
SELECT * FROM emp WHERE hire_date > '15/08/27';
-- 서브쿼리 활용(ANY)
SELECT * FROM emp WHERE hire_date > ANY(SELECT hire_date FROM emp WHERE ejob = 'manager');

-- 문제 5) 부서별 직원 수
SELECT COUNT(*) FROM emp WHERE dept_no = '1';
SELECT COUNT(*) FROM emp WHERE dept_no = '2';
SELECT COUNT(*) FROM emp WHERE dept_no = '3';
-- 서브쿼리로 추출한 값을 하나의 컬럼으로 -> 상하관계 쿼리
SELECT dept_name, loc, dept_no, (SELECT COUNT(*) FROM emp WHERE emp.dept_no = dept.dept_no) AS cnt FROM dept;
-- 테이블 이름이 길면 마지막에 별칭을 줄 수 있음.
SELECT dept_name, loc, dept_no, (SELECT COUNT(*) FROM emp WHERE emp.dept_no = d.dept_no) AS cnt FROM dept d;

