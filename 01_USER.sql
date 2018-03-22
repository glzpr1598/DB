/* 
대문자 : 명령어
소문자 : 변경할 수 있는 값
전체 실행 : F5
현재 문장 실행 : Ctrl + enter
*/

-- 유저 생성
-- CREATE USER [유저명] IDENTIFIED BY [비밀번호];
CREATE USER web_user IDENTIFIED BY pass;
CREATE USER dba_user IDENTIFIED BY pass;
CREATE USER user02 IDENTIFIED BY pass3;

-- 유저 비밀번호 변경
-- ALTER USER [유저명] IDENTIFIED BY [비밀번호];
ALTER USER user02 IDENTIFIED BY pass;

-- 유저 조회
SELECT * FROM DBA_USERS;

-- 유저 삭제
-- DROP USER [유저명];
-- 테이블이 존재하는 유저의 경우, 뒤에 CASCADE 명령어 붙임
DROP USER user02;
DROP USER dba_user;

-- 권한 부여
-- GRANT [권한 | 롤] TO [유저명];
-- 롤은 권한들을 묶어놓은 것
-- CONNECT 롤 : 데이터베이스 접속. 세션, 테이블, 뷰와 같은 객체 생성
-- RESOURCE 롤 : 사용자에게 자신의 테이블, 시퀀스, 프로시저, 트리거와 같은 객체를 생성할 수 있는 권한을 부여한 롤.
-- DBA 롤 : 관리자
GRANT CONNECT, RESOURCE TO web_user; -- CONNECT, RESOURCE 권한 부여
GRANT DBA TO web_user;

-- 권한 회수
-- REVOKE [권한] FROM [유저명];
REVOKE DBA FROM web_user;

