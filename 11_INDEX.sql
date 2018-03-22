-- �ε��� ����

-- Unique index
-- �ߺ����� ���� �����͸� �ε����� ����
-- �⺻Ű Ȥ�� ����Ű ���� �� �ڵ����� ������
-- CREATE UNIQUE INDEX [�ε�����] ON [���̺��(�÷�)];
CREATE UNIQUE INDEX emp_idx_ename ON emp(ename);

-- Non_Unique index
-- �ߺ��� ����ϴ� �ε���
CREATE INDEX emp_idx_ename ON emp(ename);

-- Composite index(���� �ε���)
-- �ټ��� �÷�(�ִ� 16)�� �̿��ؼ� �ε����� ����
CREATE INDEX emp_idx_co ON emp(ename, ejob);
CREATE UNIQUE INDEX emp_idx_co ON emp(ename, ejob); -- UNIQUE�� ��� ����


-- �ε��� ��ȸ
SELECT * FROM USER_INDEXES WHERE table_name = 'EMP';


-- �ε��� ����
DROP INDEX emp_idx_ename;
DROP INDEX emp_idx_co;