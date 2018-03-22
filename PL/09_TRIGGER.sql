-- 트리거
-- 특정 상황 발생 시 작동
-- TALBE에 관해서만 정의(VIEW는 불가능)
/***************************************************
CREATE [OR REPLACE] TRIGGER 트리거명
{BEFORE | AFTER}
{INSERT | UPDATE | DELETE} ON 테이블명
[FOR EACH ROW] -- 행 트리거
PL/SQL 블록
****************************************************/

-- 테이블 생성
CREATE TABLE emp01(
    no NUMBER(4) PRIMARY KEY,
    name VARCHAR2(20),
    JOB VARCHAR2(20)
);
CREATE TABLE emp02(
    no NUMBER(4) PRIMARY KEY,
    name VARCHAR2(20),
    JOB VARCHAR2(20)
);

/********************************************************************
emp01에 데이터가 삽입되면 emp02에도 삽입하는 트리거 만들기
********************************************************************/
-- 트리거 생성
CREATE OR REPLACE TRIGGER tri_insert
AFTER
INSERT ON emp01
FOR EACH ROW
BEGIN
    INSERT INTO emp02 VALUES(:NEW.no, :NEW.name, :NEW.job); -- 이전의 데이터는 :OLD, 새로운 데이터는 :NEW
END;
/

-- 트리거 발생
INSERT INTO emp01 VALUES(1, 'Kim', 'programmer');
INSERT INTO emp01 VALUES(2, 'Lee', 'designer');
INSERT INTO emp01 VALUES(3, 'Park', 'programmer');

-- 확인
SELECT * FROM emp01;
SELECT * FROM emp02;


/**********************************************************************
emp01에 데이터가 수정되면 emp02에도 데이터가 수정되는 트리거
**********************************************************************/
-- 트리거 생성
CREATE OR REPLACE TRIGGER tri_update
AFTER
UPDATE ON emp01
FOR EACH ROW
BEGIN
    dbms_output.put_line('이전 데이터 : ' || :OLD.NO || ' / ' || :OLD.NAME || ' / ' || :OLD.JOB);
    dbms_output.put_line('새로운 데이터 : ' || :NEW.no || ' / ' || :NEW.name || ' / ' || :NEW.job);
    UPDATE emp02 SET name = :NEW.name, job = :NEW.job WHERE no = :NEW.no;
END;
/
SET SERVEROUTPUT ON;
-- 트리거 발생
UPDATE emp01 SET name = 'Yun', job = 'marketer' WHERE no = 3;

-- 확인
SELECT * FROM emp01;
SELECT * FROM emp02;


/**********************************************************************
emp01에 데이터가 삭제되면 emp02에도 데이터가 삭제되는 트리거
**********************************************************************/
-- 트리거 생성
CREATE OR REPLACE TRIGGER tri_delete
AFTER
DELETE ON emp01
FOR EACH ROW
BEGIN
    DELETE FROM emp02 WHERE no = :OLD.no;
END;
/

-- 트리거 발생
DELETE FROM emp01 WHERE no = 3;

-- 확인
SELECT * FROM emp01;
SELECT * FROM emp02;



-- 트리거 조회
SELECT * FROM user_triggers;

-- 트리거 삭제
DROP TRIGGER tri_insert;
DROP TRIGGER tri_update;
DROP TRIGGER tri_delete;
