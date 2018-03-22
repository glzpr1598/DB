-- 1. ����(Reference) ��������
-- FOREIGN KEY(�ܷ�Ű, �ٸ� ���̺��� Ű�� �����ͼ� ���)

-- �θ� ���̺�
CREATE TABLE parenttable(
    userid VARCHAR2(30),
    username VARCHAR2(30),
    userphone VARCHAR2(30),
    useraddr VARCHAR2(30),
    CONSTRAINT parent_pk PRIMARY KEY(userid)
);

-- �ڽ� ���̺�(�θ� ���̺��� Ű�� �����ϴ� ���̺�)
-- ��ĺ� ���� : �θ��� PK�� �ڽ��� PK�� ������� �ʴ� ����, �������� ǥ��
-- ��� 1. ���̺� ���� �� ����
CREATE TABLE childtable(
    oderid NUMBER(10),
    userid VARCHAR2(20),
    productname VARCHAR2(20),
    price NUMBER(10),
    qty NUMBER(5),
    CONSTRAINT childtable_fk FOREIGN KEY(userid) REFERENCES parenttable(userid)
);
-- ��� 2. ������ ���̺� ����
ALTER TABLE childtable 
    ADD CONSTRAINT child_fk 
    FOREIGN KEY(userid) 
    REFERENCES parenttable(userid);

-- �ĺ����� : �θ��� PK�� �ڽ��� PK�� ����ϴ� ����, �Ǽ����� ǥ��
CREATE TABLE identable(
    userid VARCHAR2(20),
    CONSTRAINT iden_pk PRIMARY KEY(userid),
    CONSTRAINT iden_fk FOREIGN KEY(userid) REFERENCES parenttable(userid)
);

DROP TABLE identable;
DROP TABLE childtable;
DROP TABLE parenttable;


-- 2. ���� ���� ���Ἲ ��������
-- �θ� ������ �ڽĵ� ����.
-- �θ� �������� �ڽĵ� �������� �Ѵ�.
-- ON DELETE CASCADE

-- �θ� ���̺�
CREATE TABLE supplier(
    supplier_id NUMBER(10) NOT NULL,
    supplier_name VARCHAR2(50) NOT NULL,
    phone VARCHAR2(12),
    CONSTRAINT supplier_pk PRIMARY KEY(supplier_id)
);

-- �ڽ� ���̺�
CREATE TABLE products(
    product_id NUMBER(10) NOT NULL,
    supplier_id NUMBER(10) NOT NULL,
    product_price NUMBER(10),
    CONSTRAINT product_fk 
    FOREIGN KEY(supplier_id) 
    REFERENCES supplier(supplier_id)
    ON DELETE CASCADE -- ���� ���� ���Ἲ �������� -> �����ڰ� ������� ���ǵ� �����
);

-- ������ ���
INSERT INTO supplier(supplier_id, supplier_name, phone)
    VALUES(1, '��ö��', '01011111111');
INSERT INTO supplier(supplier_id, supplier_name, phone)
    VALUES(2, 'ȫ�浿', '01022222222');
INSERT INTO supplier(supplier_id, supplier_name, phone)
    VALUES(3, '�ڿ���', '01033333333');
SELECT * FROM supplier;

-- ���� ���
INSERT INTO products VALUES(1111, 1, 6000);
INSERT INTO products VALUES(1112, 1, 5000);
INSERT INTO products VALUES(1113, 2, 3000);
INSERT INTO products VALUES(1114, 3, 10000);
SELECT * FROM products;

-- ��ö�� ���
DELETE FROM supplier WHERE supplier_name = '��ö��';
SELECT * FROM supplier;
SELECT * FROM products; -- �ش� ���ǵ� ������.

DROP TABLE supplier; -- �����ϴ� ���̺��� �ֱ� ������ ������ �ȵ�.
DROP TABLE supplier CASCADE CONSTRAINTS;
DROP TABLE products;
