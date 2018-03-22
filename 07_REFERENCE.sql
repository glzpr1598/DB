-- 1. 참조(Reference) 제약조건
-- FOREIGN KEY(외래키, 다른 테이블의 키를 가져와서 사용)

-- 부모 테이블
CREATE TABLE parenttable(
    userid VARCHAR2(30),
    username VARCHAR2(30),
    userphone VARCHAR2(30),
    useraddr VARCHAR2(30),
    CONSTRAINT parent_pk PRIMARY KEY(userid)
);

-- 자식 테이블(부모 테이블의 키를 참조하는 테이블)
-- 비식별 관계 : 부모의 PK를 자신의 PK로 사용하지 않는 관계, 점선으로 표시
-- 방법 1. 테이블 생성 시 지정
CREATE TABLE childtable(
    oderid NUMBER(10),
    userid VARCHAR2(20),
    productname VARCHAR2(20),
    price NUMBER(10),
    qty NUMBER(5),
    CONSTRAINT childtable_fk FOREIGN KEY(userid) REFERENCES parenttable(userid)
);
-- 방법 2. 생성된 테이블에 지정
ALTER TABLE childtable 
    ADD CONSTRAINT child_fk 
    FOREIGN KEY(userid) 
    REFERENCES parenttable(userid);

-- 식별관계 : 부모의 PK를 자신의 PK로 사용하는 관계, 실선으로 표시
CREATE TABLE identable(
    userid VARCHAR2(20),
    CONSTRAINT iden_pk PRIMARY KEY(userid),
    CONSTRAINT iden_fk FOREIGN KEY(userid) REFERENCES parenttable(userid)
);

DROP TABLE identable;
DROP TABLE childtable;
DROP TABLE parenttable;


-- 2. 연계 참조 무결성 제약조건
-- 부모가 없으면 자식도 없다.
-- 부모가 지워지면 자식도 지워져야 한다.
-- ON DELETE CASCADE

-- 부모 테이블
CREATE TABLE supplier(
    supplier_id NUMBER(10) NOT NULL,
    supplier_name VARCHAR2(50) NOT NULL,
    phone VARCHAR2(12),
    CONSTRAINT supplier_pk PRIMARY KEY(supplier_id)
);

-- 자식 테이블
CREATE TABLE products(
    product_id NUMBER(10) NOT NULL,
    supplier_id NUMBER(10) NOT NULL,
    product_price NUMBER(10),
    CONSTRAINT product_fk 
    FOREIGN KEY(supplier_id) 
    REFERENCES supplier(supplier_id)
    ON DELETE CASCADE -- 연계 참조 무결성 제약조건 -> 공급자가 사라지면 물건도 사라짐
);

-- 공급자 등록
INSERT INTO supplier(supplier_id, supplier_name, phone)
    VALUES(1, '김철수', '01011111111');
INSERT INTO supplier(supplier_id, supplier_name, phone)
    VALUES(2, '홍길동', '01022222222');
INSERT INTO supplier(supplier_id, supplier_name, phone)
    VALUES(3, '박영수', '01033333333');
SELECT * FROM supplier;

-- 물건 등록
INSERT INTO products VALUES(1111, 1, 6000);
INSERT INTO products VALUES(1112, 1, 5000);
INSERT INTO products VALUES(1113, 2, 3000);
INSERT INTO products VALUES(1114, 3, 10000);
SELECT * FROM products;

-- 김철수 퇴사
DELETE FROM supplier WHERE supplier_name = '김철수';
SELECT * FROM supplier;
SELECT * FROM products; -- 해당 물건도 삭제됨.

DROP TABLE supplier; -- 참조하는 테이블이 있기 때문에 삭제가 안됨.
DROP TABLE supplier CASCADE CONSTRAINTS;
DROP TABLE products;
