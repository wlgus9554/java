select sysdate from dual;

-- 주석 : 사용자 만들기 (같은 이름으로 DB도 만들어 진다. 사용자와 연결되도록 되어있다.)
create USER java IDENTIFIED BY java;

-- 사용자 제거
DROP USER java;

-- 계정을 만들면 아무것도 못하는 허수아비 계정을 생성 -> 권한을 줘야 일을 할 수 있다.
GRANT CONNECT, RESOURCE, CREATE VIEW TO java;