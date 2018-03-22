-- 인덱스 생성

-- Unique index
-- 중복되지 않은 데이터를 인덱스로 지정
-- 기본키 혹은 고유키 지정 시 자동으로 생성됨
-- CREATE UNIQUE INDEX [인덱스명] ON [테이블명(컬럼)];
CREATE UNIQUE INDEX emp_idx_ename ON emp(ename);

-- Non_Unique index
-- 중복을 허용하는 인덱스
CREATE INDEX emp_idx_ename ON emp(ename);

-- Composite index(결합 인덱스)
-- 다수의 컬럼(최대 16)을 이용해서 인덱스를 구성
CREATE INDEX emp_idx_co ON emp(ename, ejob);
CREATE UNIQUE INDEX emp_idx_co ON emp(ename, ejob); -- UNIQUE도 사용 가능


-- 인덱스 조회
SELECT * FROM USER_INDEXES WHERE table_name = 'EMP';


-- 인덱스 삭제
DROP INDEX emp_idx_ename;
DROP INDEX emp_idx_co;