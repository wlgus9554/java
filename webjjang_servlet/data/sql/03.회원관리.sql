-- 회원 등급 & 회원

-- 1. 객체 제거
-- FK 테이블은 먼저 지우고 PK는 나중에 지운다.
DROP TABLE member CASCADE CONSTRAINTS PURGE;
DROP TABLE grade CASCADE CONSTRAINTS PURGE;

-- 2. 객체 생성
-- PK 테이블은 먼저 만들고 FK는 나중에 만든다.
CREATE TABLE grade(
    gradeNo NUMBER(2) PRIMARY KEY,
    gradeName VARCHAR2(21) not null
);

CREATE TABLE member(
    id VARCHAR2(20) PRIMARY KEY,
    pw VARCHAR2(20) NOT NULL,
    name VARCHAR2(30) NOT NULL,
    gender VARCHAR2(6) NOT NULL CHECK( gender in ('남자','여자')),
    birth date NOT NULL,
    tel VARCHAR2(13),
    email VARCHAR2(50) NOT NULL UNIQUE,
    regDate DATE DEFAULT sysdate,
    conDate DATE DEFAULT sysdate,
    status VARCHAR2(6) DEFAULT '정상' CHECK(status in ('정상', '강퇴', '탈퇴', '휴면')),
    photo VARCHAR2(200),
    newMsgCnt NUMBER DEFAULT 0,
    gradeNo NUMBER(2) DEFAULT 1 REFERENCES grade(gradeNo) 
    -- ON DELETE CASCADE
    -- ON DELETE SET NULL
);

-- 3. 샘플 데이터
-- 1) PK 데이터를 먼저 넣는다. - grade
INSERT INTO grade -- 테이블 이름만 쓰는 경우는 모든 컬럼에 대해서 순서대로 데이터를 입력할 때 생략 가능
values(1, '일반회원');
INSERT INTO grade
values(9, '관리자');
commit;
-- 2) FK 데이터를 PK 뒤에 넣는다. - member
-- 일반 회원 가입
INSERT INTO member(id, pw, name, gender, birth, tel, email, photo)
values('test','1111','홍길동','남자','1990-01-01','010-1234-1234','hong@naver.com','/upload/member/hong.jpg');
INSERT INTO member(id, pw, name, gender, birth, tel, email, photo)
values('tear','1111','김지원','여자','1998-01-01','010-1004-1004','tear@naver.com','/upload/member/tear.jpg');
-- 관리자 등록
INSERT INTO member(id, pw, name, gender, birth, tel, email, photo, gradeNo)
values('admin','1111','관리자','남자','1997-03-01','010-1111-8888','leelj1@nate.com','/upload/member/leelj1.jpg', 9);
commit;


select * from grade;
select * from member;
