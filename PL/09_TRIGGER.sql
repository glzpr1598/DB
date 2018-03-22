-- Ʈ����
-- Ư�� ��Ȳ �߻� �� �۵�
-- TALBE�� ���ؼ��� ����(VIEW�� �Ұ���)
/***************************************************
CREATE [OR REPLACE] TRIGGER Ʈ���Ÿ�
{BEFORE | AFTER}
{INSERT | UPDATE | DELETE} ON ���̺��
[FOR EACH ROW] -- �� Ʈ����
PL/SQL ���
****************************************************/

-- ���̺� ����
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
emp01�� �����Ͱ� ���ԵǸ� emp02���� �����ϴ� Ʈ���� �����
********************************************************************/
-- Ʈ���� ����
CREATE OR REPLACE TRIGGER tri_insert
AFTER
INSERT ON emp01
FOR EACH ROW
BEGIN
    INSERT INTO emp02 VALUES(:NEW.no, :NEW.name, :NEW.job); -- ������ �����ʹ� :OLD, ���ο� �����ʹ� :NEW
END;
/

-- Ʈ���� �߻�
INSERT INTO emp01 VALUES(1, 'Kim', 'programmer');
INSERT INTO emp01 VALUES(2, 'Lee', 'designer');
INSERT INTO emp01 VALUES(3, 'Park', 'programmer');

-- Ȯ��
SELECT * FROM emp01;
SELECT * FROM emp02;


/**********************************************************************
emp01�� �����Ͱ� �����Ǹ� emp02���� �����Ͱ� �����Ǵ� Ʈ����
**********************************************************************/
-- Ʈ���� ����
CREATE OR REPLACE TRIGGER tri_update
AFTER
UPDATE ON emp01
FOR EACH ROW
BEGIN
    dbms_output.put_line('���� ������ : ' || :OLD.NO || ' / ' || :OLD.NAME || ' / ' || :OLD.JOB);
    dbms_output.put_line('���ο� ������ : ' || :NEW.no || ' / ' || :NEW.name || ' / ' || :NEW.job);
    UPDATE emp02 SET name = :NEW.name, job = :NEW.job WHERE no = :NEW.no;
END;
/
SET SERVEROUTPUT ON;
-- Ʈ���� �߻�
UPDATE emp01 SET name = 'Yun', job = 'marketer' WHERE no = 3;

-- Ȯ��
SELECT * FROM emp01;
SELECT * FROM emp02;


/**********************************************************************
emp01�� �����Ͱ� �����Ǹ� emp02���� �����Ͱ� �����Ǵ� Ʈ����
**********************************************************************/
-- Ʈ���� ����
CREATE OR REPLACE TRIGGER tri_delete
AFTER
DELETE ON emp01
FOR EACH ROW
BEGIN
    DELETE FROM emp02 WHERE no = :OLD.no;
END;
/

-- Ʈ���� �߻�
DELETE FROM emp01 WHERE no = 3;

-- Ȯ��
SELECT * FROM emp01;
SELECT * FROM emp02;



-- Ʈ���� ��ȸ
SELECT * FROM user_triggers;

-- Ʈ���� ����
DROP TRIGGER tri_insert;
DROP TRIGGER tri_update;
DROP TRIGGER tri_delete;
