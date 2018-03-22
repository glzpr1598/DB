-- 뷰의 제한조건
-- NULL 값인 컬럼은 뷰에 포함되지 않는다.
-- WITH READ ONLY 옵션을 설정한 뷰는 데이터를 갱신할 수 없다.
-- WITH CHECK OPTION 을 설정한 뷰는 데이터를 삽입, 삭제, 수정할 수 있다.
-- ROWID, ROWNUM, NEXTVAL, CURRVAL 같은 가상 컬럼에 대한 참조가 있는 뷰는 데이터를 추가할 수 없다.

-- 뷰 생성
-- CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW 뷰이름 
-- AS 쿼리
-- [WHERE 조건] [WITH CHECK OPTION | WITH READ ONLY]

-- OR REPLACE : 기존에 이름이 같은 뷰가 존재할 경우 덮어쓴다.
-- FORCE : 기존 테이블 유무에 관계없이 강제로 만든다. NOFORCE 가 디폴트

CREATE OR REPLACE VIEW vw_emp 
AS SELECT emp.ename, dept.dept_name FROM emp, dept
WHERE emp.dept_no = dept.dept_no;
-- 에러 코드 : ORA-01031: insufficient privileges : 뷰 생성권한이 없음.
GRANT CREATE VIEW TO web_user; -- 뷰 생성권한을 줌

-- 뷰 활용
SELECT * FROM vw_emp;

-- 뷰 삭제
DROP VIEW vw_emp;

-- 뷰 조회
SELECT * FROM USER_VIEWS;

-- WITH CHECK OPTION : 뷰의 조건식을 만족하는 내에서 수정이 가능하도록 하는 옵션
CREATE OR REPLACE VIEW vw_chk_option
AS SELECT ename, ejob, dept_no FROM emp
WHERE dept_no = '1' WITH CHECK OPTION; -- dept_no = '1'인 조건 내에서 수정 가능

SELECT * FROM vw_chk_option;

-- 뷰 수정
UPDATE vw_chk_option SET ejob = 'manager' WHERE ename = 'Park';

UPDATE vw_chk_option SET dept_no = '2' WHERE ename = 'Park';

-- 뷰 삭제
DROP VIEW vw_chk_option;

-- WITH READ ONLY :  수정 불가능
CREATE VIEW vw_read_only
AS SELECT ename, ejob, dept_no FROM emp
WHERE dept_no = '2' WITH READ ONLY;

SELECT * FROM vw_read_only;

-- 뷰 수정
UPDATE vw_read_only SET ejob = 'assistant' WHERE ename = 'Yu'; -- 에러

-- 뷰 삭제
DROP VIEW vw_read_only;
