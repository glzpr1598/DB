-- 트랜잭션 : 데이터베이스에서 사용되는 쪼갤 수 없는 업무처리 단위

-- COMMIT : 실행한 쿼리를 완전히 적용
COMMIT;
-- SHOW AUTOCOMMIT : 기본적인 AUTO COMMIT 확인
SHOW AUTOCOMMIT;
SET AUTOCOMMIT ON; -- 즉시 적용. 쓰지않는 것이 좋음.
SET AUTOCOMMIT OFF;
-- DDL(데이터 정의 언어)문은 자동 커밋됨.(CREATE, ALTER, DROP, RENAME, TRANCATE)

-- ROLLBACK : 실행한 쿼리(INSERT, UPDATE, DELETE)를 취소
SELECT * FROM employees;
DELETE FROM employees;
ROLLBACK;
SELECT * FROM employees;

-- SAVEPOINT [포인트이름] : 롤백 포인트 지정
SELECT * FROM employees;
SAVEPOINT pointa;
DELETE FROM employees WHERE emp_no BETWEEN 113 AND 115;
SAVEPOINT pointb;
DELETE FROM employees WHERE emp_no BETWEEN 116 AND 117;
SAVEPOINT pointc;

-- ROLLBACK TO [포인트이름] : 해당 포인트로 롤백
ROLLBACK TO pointc;
SELECT * FROM employees;
ROLLBACK TO pointb;
SELECT * FROM employees;
ROLLBACK TO pointa;
SELECT * FROM employees;
