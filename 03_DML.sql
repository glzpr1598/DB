-- DML(Data Manipulation Language) : 데이터 조작 언어

-- 1. INSERT : 데이터 삽입
--     INSERT INTO [테이블명]([컬럼], ..., [컬럼]) VALUES([값], ..., [값]);
INSERT INTO employees(emp_no, first_name, family_name, email, mobile,
    salary, depart_no, commission)
    VALUES(111, 'Lennox', 'Kim', 'Kim@naver.com', '01012345678',
    '99999999', 'dev_001', 90);

INSERT INTO employees(emp_no, first_name, family_name, email, mobile, salary)
    VALUES(112, '태근', '이', 'lee@naver.com', '01011112222', '10000000');
    -- 지정하지 않은 값은 NULL로 들어감.

SELECT * FROM EMPLOYEES;


-- 2. UPDATE : 데이터 수정
--     UPDATE [테이블명] SET [컬럼] = [변경할 값] WHERE [조건]
UPDATE employees SET depart_no = 'dev_002' WHERE depart_no IS NULL;
UPDATE employees SET commission = '10' WHERE commission IS NULL;


-- 3. DELETE : 데이터 삭제
--     DELETE FROM [테이블명] WHERE [조건];
DELETE FROM employees WHERE depart_no = 'dev_002';


-- 4. MERGE : 조건에 따라 삽입/수정/삭제
/*
MERGE INTO [테이블명] USING [서브쿼리 또는 테이블] ON ([조건])
    WHEN MATCHED THEN
        UPDATE SET [컬럼] = [값], ...
        DELETE WHERE [조건]
    WHEN NOT MATCHED THEN
        INSERT([컬럼]) VALUES([값]);
*/
-- depart_no이 'dev_001'인 데이터가 있으면 commission을 10으로 변경, 없으면 데이터 추가
MERGE INTO employees USING DUAL ON (depart_no = 'dev_001') -- 테이블을 하나만 사용하기 때문에 DUAL 사용(가상테이블)
    WHEN MATCHED THEN
        UPDATE SET commission = 10
    WHEN NOT MATCHED THEN
        INSERT(emp_no, first_name, family_name, email, mobile, salary, depart_no)
          VALUES(118, '길동', '박', 'email@naver.com', '01033334444', 40000000, 'dev_001');
-- depart_no이 'dev_002'인 데이터가 있으면 commission을 20으로 변경하고,
-- emp_no이 117인 데이터를 삭제
MERGE INTO employees USING DUAL ON (depart_no = 'dev_002') -- 테이블을 하나만 사용하기 때문에 DUAL 사용(가상테이블)
    WHEN MATCHED THEN
        UPDATE SET commission = 20
        DELETE WHERE emp_no = 117;
        



-- 데이터 입력
INSERT INTO employees(emp_no, first_name, family_name, email, mobile, salary, depart_no, commission)
    VALUES(113, '길동','김','kim@naver.com','01011111111',5000000,'dev_001', 10);
    
INSERT INTO employees(emp_no, first_name, family_name, email, mobile, salary, depart_no, commission)
    VALUES(114, '길동','고','go@naver.com','01044444444',6000000,'dev_003', 30);
    
INSERT INTO employees(emp_no, first_name, family_name, email, mobile, salary, depart_no, commission)
    VALUES(115, '길동','나','na@naver.com','01033333333',3000000,'dev_002', 20);
    
INSERT INTO employees(emp_no, first_name, family_name, email, mobile, salary, depart_no, commission)
    VALUES(116, '길동','라','ra@naver.com','01022222222',4000000,'dev_001', 50);
    
INSERT INTO employees(emp_no, first_name, family_name, email, mobile, salary, depart_no, commission)
    VALUES(117, '길동','마','ma@naver.com','01055555555',7000000,'dev_003', 10);
