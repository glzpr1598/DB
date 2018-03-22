-- 제약조건
-- PRIMARY KEY(컬럼) : 기본키, 중복/NULL 불가, 테이블당 하나만 가능, 최대 16개의 컬럼으로 만들 수 있음
-- FOREIGN KEY(컬럼) REFERENCES 테이블(컬럼) : 외래키, 다른 테이블의 기본키를 참조
-- NOT NULL : NULL 불가
-- UNIQUE(컬럼) : 중복 불가
-- CHECK(조건) : 조건에 맞는 값만 입력받음.

-- 테이블 생성시 함께 지정
-- 방법 1
CREATE TABLE pktest(
    firstcol NCHAR(8) PRIMARY KEY, -- 기본키 지정 방법1
    secondcol NVARCHAR2(4) NOT NULL
);
DESC pktestname;
-- 방법 2
-- CONSTRAINT [제약조건 이름] [제약조건]([적용 필드], ...)
CREATE TABLE pktest2(
    firstcol NCHAR(8),
    secondcol NVARCHAR2(4) NOT NULL,
    CONSTRAINT pk_code2 PRIMARY KEY(firstcol) -- 기본키 지정 방법2(이름을 지정할 수 있음)
);

-- 생성된 테이블에 지정
CREATE TABLE pktest3(
    firstcol NCHAR(8),
    secondcol NVARCHAR2(4)
);
-- 제약조건 추가
-- ALTER TABLE [테이블명] ADD CONSTRAINT [제약조건명] [제약조건]([적용 필드]);
-- NOT NULL은 추가할 수 없다.(제약조건 이름이 없음)
ALTER TABLE pktest3 ADD CONSTRAINT pk_code3 PRIMARY KEY(firstcol);

-- 제약조건 수정
-- ALTER TABLE [테이블명] MODIFY [컬럼] [데이터타입] [제약조건]
ALTER TABLE pktest3 MODIFY firstcol NCHAR(8) PRIMARY KEY;
ALTER TABLE pktest3 MODIFY secondcol NVARCHAR2(4) NOT NULL;

-- 제약조건 삭제
-- ALTER TABLE [테이블명] DROP CONSTRAINT [제약조건명]
ALTER TABLE pktest3 DROP CONSTRAINT pk_code3;

-- 제약조건 조회
SELECT * FROM USER_CONSTRAINTS;


DROP TABLE pktest;
DROP TABLE pktest2;
DROP TABLE pktest3;
