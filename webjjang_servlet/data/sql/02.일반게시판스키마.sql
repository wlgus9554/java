-- 일반 게시판 테이블 스키마
-- 1. 객체 제거
-- CASCADE : 개울 물 - 지우려는 것과 연결되어 있는 것을 지우자
-- PURGE : 지우면 휴지통에 담기게 된다. 휴지통에 안 담고 지우자
DROP TABLE board CASCADE CONSTRAINTS PURGE;
DROP SEQUENCE board_seq;

-- 2. 객체 생성
CREATE TABLE board(
    no number primary key, -- null이 아니고 중복이 되지 않는 항목
    title VARCHAR2(300) not null, -- 한글은 3바이트
    content VARCHAR2(2000) not null,
    writer VARCHAR2(30) not null,
    writeDate DATE DEFAULT sysdate,
    hit NUMBER DEFAULT 0,
    pw VARCHAR2(20) not null
);

CREATE SEQUENCE board_seq;

-- 3. 샘플데이터 넣기
INSERT INTO board(no, title, content, writer, pw)
VALUES(board_seq.nextval, 'java', 'program', 'lee', '1111');
INSERT INTO board(no, title, content, writer, pw)
VALUES(board_seq.nextval, 'java', 'program', 'lee', '1111');
COMMIT;

select * from board;