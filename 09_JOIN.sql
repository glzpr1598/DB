-- JOIN : 둘 이상의 테이블을 연결하여 데이터를 검색하는 방법
-- 각 테이블에 동일한 컬럼이 하나 이상 존재해야한다.
-- 일반적으로 PK와 FK를 활용

-- <Join의 종류>
-- Cross Join : 거의 안씀
-- Equi Join : 등가 조인, 내부 조인, 내츄럴 조인
-- Non-Equi Join : 거의 안씀
-- Self Join
-- Outer Join

-- <CROSS JOIN>
-- 카다시안 곱 수행
SELECT emp.ename, dept.dept_name FROM emp CROSS JOIN dept;
-- 간단하게 ','로 표현 가능
SELECT emp.ename, dept.dept_name FROM emp, dept;

-- <EQUI JOIN>
-- INNER JOIN(많이 사용)
-- 모든 직원의 이름(emp 테이블), 부서명(dept 테이블)
SELECT E.ename, D.dept_name FROM emp E, dept D WHERE E.dept_no = D.dept_no; -- 테이블명 뒤에 별칭 정의하고 사용
SELECT E.ename, D.dept_name FROM emp E INNER JOIN dept D ON E.dept_no = D.dept_no; -- INNER JOIN 사용
SELECT E.ename, D.dept_name FROM emp E JOIN dept D ON E.dept_no = D.dept_no; -- INNER 생략
SELECT E.ename, D.dept_name FROM emp E JOIN dept D USING(dept_no); -- USING 사용(컬럼명이 동일해야함), 주로 사용
-- NATURAL JOIN
SELECT E.ename, D.dept_name FROM emp E NATURAL JOIN dept D; -- 동일한 컬럼을 모두 자동으로 내부조인 한다. 조건이 필요 없음

-- <SELF JOIN>
-- 한 테이블 내에서 카다시안 곱 수행
SELECT A.ename AS ename_a, B.ename AS ename_b FROM emp A, emp B;

-- <Outer Join>
-- 내부 조인과 반대 개념으로 한쪽에 없는 데이터도 보여준다.
-- Oracle 전용 방법과 ANSI SQL 방법이 있다.
-- 1) Oracle 전용 방법
SELECT DISTINCT(E.dept_no), D.dept_name FROM emp E, dept D WHERE E.dept_no = D.dept_no(+); -- emp에는 있지만, dept에는 없는 데이터도 표시
SELECT DISTINCT(E.dept_no), D.dept_name FROM emp E, dept D WHERE E.dept_no(+) = D.dept_no; -- emp에는 없지만, dept에는 있는 데이터도 표시
-- 양쪽에 (+)가 붙는 효과를 내려면 FULL OUTER JOIN 사용
-- 2) ANSI SQL 방법
-- FROM [테이블1] [LEFT | RIGHT | FULL] OUTER JOIN [테이블2]
SELECT DISTINCT(E.dept_no), D.dept_name FROM emp E LEFT OUTER JOIN dept D ON E.dept_no = D.dept_no; -- 왼쪽(emp)에 있는 데이터는 모두 표시
SELECT DISTINCT(E.dept_no), D.dept_name FROM emp E RIGHT OUTER JOIN dept D ON E.dept_no = D.dept_no; -- 오른쪽(dept)에 있는 데이터는 모두 표시
SELECT DISTINCT(E.dept_no), D.dept_name FROM emp E FULL OUTER JOIN dept D ON E.dept_no = D.dept_no; -- 어느쪽에라도 있는 데이터는 모두 표시
