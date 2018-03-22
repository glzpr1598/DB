/*
<테이블 생성>
CREATE TABLE [테이블명] (
    [컬럼명] [데이터타입],
    ...
    [컬럼명] [데이터타입]
);
*/

/*
<데이터 타입> (oracle 기준, DBM마다 다름)
1. 문자(검색 속도가 가장 빠름, 주로 사용)
    1) 고정형
        CHAR(바이트수)
        NCHAR(글자수) -- 1글자에 3byte 차지
    2) 가변형 : 입력된 데이터에 따라 메모리 사용을 줄임. 속도는 비교적 느림.
        VARCHAR2(바이트수)
        NVARCHAR2(글자수)
2. 숫자
    NUMBER(전체 자릿수, 소수점 자릿수) -- 예) 123.45 ->  NUMBER(5, 2)
    NUMBER -- ORACLE에서 알아서 처리(속도 저하)
3. 날짜
    DATE -- 7byte(YYYY-MM-DD hh:mm:ss:ss)
    TIMESTAMP -- DATE와 같지만 초 단위까지만
    참고) SYSDATE : 현재 시스템 DATE
*/

GRANT RESOURCE TO web_user; -- ADMIN으로 실행, 권한 부여
-- 테이블 생성
CREATE TABLE testtable (
    username NVARCHAR2(10),
    age NUMBER(3), -- 소수점 생략 가능
    mobile VARCHAR2(11),
    reg_date DATE DEFAULT SYSDATE -- 기본값을 현재 시스템 DATE로
);

-- 테이블 구조 확인
DESC testtable;

-- 현재 유저의 테이블 리스트 확인
SELECT * FROM USER_TABLES;

-- 실습
CREATE TABLE employees (
    emp_no NUMBER(3),
    first_name NVARCHAR2(8),
    last_name NVARCHAR2(2),
    email NVARCHAR2(50),
    mobile NVARCHAR2(11),
    salary NUMBER(8),
    reg_date DATE DEFAULT SYSDATE
);

-- 테이블 구조 확인
DESC employees;

-- 테이블 삭제
-- DROP TABLE [테이블명];
DROP TABLE testtable;
-- 테이블 내의 데이터 삭제
-- TRUNCATE TABLE [테이블명];

-- 테이블 수정(컬럼의 추가/삭제/변경)

-- 컬럼 추가
-- ALTER TABLE [테이블명] ADD ([컬럼명] [데이터타입]);
ALTER TABLE employees ADD (
    depart_no VARCHAR2(10),
    commission VARCHAR2(10),
    etc VARCHAR2(100)
);
DESC employees;

-- 컬럼 삭제
-- ALTER TABLE [테이블명] DROP COLUMN [컬럼명];
ALTER TABLE employees DROP COLUMN etc;

-- 데이터타입 변경
-- ALTER TABLE employees MODIFY ([컬럼명] [변경할 데이터타입]);
ALTER TABLE employees MODIFY (commission NUMBER(3));

-- 컬럼명 변경
-- ALTER TABLE employees RENAME COLUMN [기존 이름] TO [변경된 이름];
ALTER TABLE employees RENAME COLUMN last_name TO family_name;
