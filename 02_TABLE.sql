/*
<���̺� ����>
CREATE TABLE [���̺��] (
    [�÷���] [������Ÿ��],
    ...
    [�÷���] [������Ÿ��]
);
*/

/*
<������ Ÿ��> (oracle ����, DBM���� �ٸ�)
1. ����(�˻� �ӵ��� ���� ����, �ַ� ���)
    1) ������
        CHAR(����Ʈ��)
        NCHAR(���ڼ�) -- 1���ڿ� 3byte ����
    2) ������ : �Էµ� �����Ϳ� ���� �޸� ����� ����. �ӵ��� ���� ����.
        VARCHAR2(����Ʈ��)
        NVARCHAR2(���ڼ�)
2. ����
    NUMBER(��ü �ڸ���, �Ҽ��� �ڸ���) -- ��) 123.45 ->  NUMBER(5, 2)
    NUMBER -- ORACLE���� �˾Ƽ� ó��(�ӵ� ����)
3. ��¥
    DATE -- 7byte(YYYY-MM-DD hh:mm:ss:ss)
    TIMESTAMP -- DATE�� ������ �� ����������
    ����) SYSDATE : ���� �ý��� DATE
*/

GRANT RESOURCE TO web_user; -- ADMIN���� ����, ���� �ο�
-- ���̺� ����
CREATE TABLE testtable (
    username NVARCHAR2(10),
    age NUMBER(3), -- �Ҽ��� ���� ����
    mobile VARCHAR2(11),
    reg_date DATE DEFAULT SYSDATE -- �⺻���� ���� �ý��� DATE��
);

-- ���̺� ���� Ȯ��
DESC testtable;

-- ���� ������ ���̺� ����Ʈ Ȯ��
SELECT * FROM USER_TABLES;

-- �ǽ�
CREATE TABLE employees (
    emp_no NUMBER(3),
    first_name NVARCHAR2(8),
    last_name NVARCHAR2(2),
    email NVARCHAR2(50),
    mobile NVARCHAR2(11),
    salary NUMBER(8),
    reg_date DATE DEFAULT SYSDATE
);

-- ���̺� ���� Ȯ��
DESC employees;

-- ���̺� ����
-- DROP TABLE [���̺��];
DROP TABLE testtable;
-- ���̺� ���� ������ ����
-- TRUNCATE TABLE [���̺��];

-- ���̺� ����(�÷��� �߰�/����/����)

-- �÷� �߰�
-- ALTER TABLE [���̺��] ADD ([�÷���] [������Ÿ��]);
ALTER TABLE employees ADD (
    depart_no VARCHAR2(10),
    commission VARCHAR2(10),
    etc VARCHAR2(100)
);
DESC employees;

-- �÷� ����
-- ALTER TABLE [���̺��] DROP COLUMN [�÷���];
ALTER TABLE employees DROP COLUMN etc;

-- ������Ÿ�� ����
-- ALTER TABLE employees MODIFY ([�÷���] [������ ������Ÿ��]);
ALTER TABLE employees MODIFY (commission NUMBER(3));

-- �÷��� ����
-- ALTER TABLE employees RENAME COLUMN [���� �̸�] TO [����� �̸�];
ALTER TABLE employees RENAME COLUMN last_name TO family_name;
