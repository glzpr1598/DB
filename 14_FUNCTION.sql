-- 집계 함수

-- COUNT(), SUM(), AVG(), MAX(), MIN()
SELECT COUNT(dept_no) FROM emp;
SELECT SUM(dept_no) FROM emp;
SELECT AVG(dept_no) FROM emp;
SELECT MAX(hire_date) FROM emp;
SELECT MIN(hire_date) FROM emp;


-- 숫자 함수

-- ABS(num) : 절댓값
SELECT ABS(-1.23) FROM dual;
-- CEIL(num) : 소수점 올림
SELECT CEIL(10.1) FROM dual;
-- FLOOR(num) : 소수점 내림
SELECT FLOOR(10.1) FROM dual;
-- ROUND(num, pos) : num을 소수 pos번째 자리까지 반올림
SELECT ROUND(192.153, 2) FROM dual;
-- TRUNC(num, pos) : num을 소수 pos번째 자리까지 버림
SELECT TRUNC(192.153, 2) FROM dual;
-- MOD(num1, num2) : num1을 num2로 나눈 나머지
SELECT MOD(10, 3) FROM dual;


-- 날짜 함수

-- SYSDATE : 현재 시각(초까지)
SELECT sysdate AS "현재" FROM dual; -- YY/MM/DD 형식으로 표시
SELECT to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') AS "현재" FROM dual; -- 날짜 표시 형식
SELECT to_char(sysdate - 1, 'YYYY-MM-DD HH24:MI:SS') AS "하루 전" FROM dual; -- 하루 전
SELECT to_char(sysdate - (1/24), 'YYYY-MM-DD HH24:MI:SS') AS "한 시간 전" FROM dual; -- 한 시간 전
-- SYSTIMESTAMP : 현재 시각(10억분의 1초까지)
SELECT systimestamp AS "현재" FROM dual;
SELECT to_char(systimestamp, 'YYYY-MM-DD HH24:MI:SS.FF3') AS "현재" FROM dual;  -- 소수 3째 자리까지 표시
