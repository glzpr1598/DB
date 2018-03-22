-- ��������
-- PRIMARY KEY(�÷�) : �⺻Ű, �ߺ�/NULL �Ұ�, ���̺�� �ϳ��� ����, �ִ� 16���� �÷����� ���� �� ����
-- FOREIGN KEY(�÷�) REFERENCES ���̺�(�÷�) : �ܷ�Ű, �ٸ� ���̺��� �⺻Ű�� ����
-- NOT NULL : NULL �Ұ�
-- UNIQUE(�÷�) : �ߺ� �Ұ�
-- CHECK(����) : ���ǿ� �´� ���� �Է¹���.

-- ���̺� ������ �Բ� ����
-- ��� 1
CREATE TABLE pktest(
    firstcol NCHAR(8) PRIMARY KEY, -- �⺻Ű ���� ���1
    secondcol NVARCHAR2(4) NOT NULL
);
DESC pktestname;
-- ��� 2
-- CONSTRAINT [�������� �̸�] [��������]([���� �ʵ�], ...)
CREATE TABLE pktest2(
    firstcol NCHAR(8),
    secondcol NVARCHAR2(4) NOT NULL,
    CONSTRAINT pk_code2 PRIMARY KEY(firstcol) -- �⺻Ű ���� ���2(�̸��� ������ �� ����)
);

-- ������ ���̺� ����
CREATE TABLE pktest3(
    firstcol NCHAR(8),
    secondcol NVARCHAR2(4)
);
-- �������� �߰�
-- ALTER TABLE [���̺��] ADD CONSTRAINT [�������Ǹ�] [��������]([���� �ʵ�]);
-- NOT NULL�� �߰��� �� ����.(�������� �̸��� ����)
ALTER TABLE pktest3 ADD CONSTRAINT pk_code3 PRIMARY KEY(firstcol);

-- �������� ����
-- ALTER TABLE [���̺��] MODIFY [�÷�] [������Ÿ��] [��������]
ALTER TABLE pktest3 MODIFY firstcol NCHAR(8) PRIMARY KEY;
ALTER TABLE pktest3 MODIFY secondcol NVARCHAR2(4) NOT NULL;

-- �������� ����
-- ALTER TABLE [���̺��] DROP CONSTRAINT [�������Ǹ�]
ALTER TABLE pktest3 DROP CONSTRAINT pk_code3;

-- �������� ��ȸ
SELECT * FROM USER_CONSTRAINTS;


DROP TABLE pktest;
DROP TABLE pktest2;
DROP TABLE pktest3;
