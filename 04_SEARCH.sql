-- SELECT : 특정 컬럼 조회
-- SELECT [컬럼, ...] FROM [테이블명];
SELECT emp_no, family_name, first_name, salary/10000 FROM employees;
SELECT * FROM employees;

-- AS : 별칭
SELECT emp_no, salary/10000 AS 월급, salary*12/10000 AS 연봉 FROM employees;

-- || : 문자열 합치기
SELECT emp_no, family_name||' '||first_name AS 이름, salary/10000||'만원' AS 월급 FROM employees;

-- WHERE : 특정 조건으로 조회
SELECT * FROM employees WHERE family_name = '김';
SELECT * FROM employees WHERE salary > 5000000;

-- AND, OR : 조건
SELECT * FROM employees WHERE salary < 5000000 AND salary > 5000000;
SELECT * FROM employees WHERE salary >= 5000000 OR family_name = '김';

-- BETWEEN A AND B : A와 B 사이
SELECT * FROM employees WHERE salary BETWEEN 5000000 AND 6000000;

-- DISTINCT : 중복제거
-- SELECT DISTINCT [컬럼] FROM [테이블];
SELECT DISTINCT salary FROM EMPLOYEES;

-- IN : 여러개의 조건 표현 시, 간단하고 속도가 빠름
-- family_name이 김, 나, 박인 모든 데이터 가져오기
SELECT * FROM employees WHERE family_name = '김' OR family_name = '나' OR family_name = '박';
SELECT * FROM employees WHERE family_name IN('김', '나', '박'); -- 간단하고 빠르다.

-- IS NULL / IS NOT NULL : NULL 인지/아닌지 조건
SELECT * FROM employees WHERE commission IS NULL;
SELECT * FROM employees WHERE commission IS NOT NULL;

-- LIKE : 비슷한 내용을 검색
-- 첫글자가 ab로 시작하는 데이터 검색 : ab%
-- 마지막 글자가 ab로 끝나는 데이터 검색 : %ab
-- ab를 포함하는 데이터 검색 : %ab%
SELECT * FROM employees WHERE email LIKE 'K%';
SELECT * FROM employees WHERE email LIKE '%l%@%';

-- ORDER BY : 정렬(ASC, DESC), 문자도 가능
SELECT * FROM employees 
    ORDER BY FAMILY_NAME ASC;
SELECT * FROM employees 
    ORDER BY FAMILY_NAME; -- ASC가 기본값, 생략가능
-- 연봉을 기준으로 내림차순
SELECT family_name, first_name, salary, salary*12 AS annsal 
    FROM employees 
    ORDER BY annsal DESC;

-- GROUP BY : 그룹핑
-- 부서별 급여 합산
SELECT * FROM employees;
SELECT depart_no, SUM(salary) AS SUM 
    FROM employees
    GROUP BY depart_no ORDER BY SUM DESC;
-- 부서별 급여, 인센티브 합산
SELECT depart_no, SUM(salary) AS SUM, SUM(commission) 
    FROM employees
    GROUP BY depart_no ORDER BY SUM DESC;

-- HAVING : GROUP BY의 조건
SELECT depart_no, SUM(salary) AS SUM FROM employees
    GROUP BY depart_no
    HAVING SUM(salary) > 5000000
    ORDER BY SUM DESC;
