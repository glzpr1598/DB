-- DML(Data Manipulation Language) : ������ ���� ���

-- 1. INSERT : ������ ����
--     INSERT INTO [���̺��]([�÷�], ..., [�÷�]) VALUES([��], ..., [��]);
INSERT INTO employees(emp_no, first_name, family_name, email, mobile,
    salary, depart_no, commission)
    VALUES(111, 'Lennox', 'Kim', 'Kim@naver.com', '01012345678',
    '99999999', 'dev_001', 90);

INSERT INTO employees(emp_no, first_name, family_name, email, mobile, salary)
    VALUES(112, '�±�', '��', 'lee@naver.com', '01011112222', '10000000');
    -- �������� ���� ���� NULL�� ��.

SELECT * FROM EMPLOYEES;


-- 2. UPDATE : ������ ����
--     UPDATE [���̺��] SET [�÷�] = [������ ��] WHERE [����]
UPDATE employees SET depart_no = 'dev_002' WHERE depart_no IS NULL;
UPDATE employees SET commission = '10' WHERE commission IS NULL;


-- 3. DELETE : ������ ����
--     DELETE FROM [���̺��] WHERE [����];
DELETE FROM employees WHERE depart_no = 'dev_002';


-- 4. MERGE : ���ǿ� ���� ����/����/����
/*
MERGE INTO [���̺��] USING [�������� �Ǵ� ���̺�] ON ([����])
    WHEN MATCHED THEN
        UPDATE SET [�÷�] = [��], ...
        DELETE WHERE [����]
    WHEN NOT MATCHED THEN
        INSERT([�÷�]) VALUES([��]);
*/
-- depart_no�� 'dev_001'�� �����Ͱ� ������ commission�� 10���� ����, ������ ������ �߰�
MERGE INTO employees USING DUAL ON (depart_no = 'dev_001') -- ���̺��� �ϳ��� ����ϱ� ������ DUAL ���(�������̺�)
    WHEN MATCHED THEN
        UPDATE SET commission = 10
    WHEN NOT MATCHED THEN
        INSERT(emp_no, first_name, family_name, email, mobile, salary, depart_no)
          VALUES(118, '�浿', '��', 'email@naver.com', '01033334444', 40000000, 'dev_001');
-- depart_no�� 'dev_002'�� �����Ͱ� ������ commission�� 20���� �����ϰ�,
-- emp_no�� 117�� �����͸� ����
MERGE INTO employees USING DUAL ON (depart_no = 'dev_002') -- ���̺��� �ϳ��� ����ϱ� ������ DUAL ���(�������̺�)
    WHEN MATCHED THEN
        UPDATE SET commission = 20
        DELETE WHERE emp_no = 117;
        



-- ������ �Է�
INSERT INTO employees(emp_no, first_name, family_name, email, mobile, salary, depart_no, commission)
    VALUES(113, '�浿','��','kim@naver.com','01011111111',5000000,'dev_001', 10);
    
INSERT INTO employees(emp_no, first_name, family_name, email, mobile, salary, depart_no, commission)
    VALUES(114, '�浿','��','go@naver.com','01044444444',6000000,'dev_003', 30);
    
INSERT INTO employees(emp_no, first_name, family_name, email, mobile, salary, depart_no, commission)
    VALUES(115, '�浿','��','na@naver.com','01033333333',3000000,'dev_002', 20);
    
INSERT INTO employees(emp_no, first_name, family_name, email, mobile, salary, depart_no, commission)
    VALUES(116, '�浿','��','ra@naver.com','01022222222',4000000,'dev_001', 50);
    
INSERT INTO employees(emp_no, first_name, family_name, email, mobile, salary, depart_no, commission)
    VALUES(117, '�浿','��','ma@naver.com','01055555555',7000000,'dev_003', 10);
