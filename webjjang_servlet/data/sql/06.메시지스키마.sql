-- 메시지 스키마
-- 1. 제거
DROP TABLE message CASCADE CONSTRAINTS PURGE;
DROP SEQUENCE message_seq;

-- 2. 생성
CREATE TABLE message(
    no number primary key,
    content VARCHAR2(2000) not null,
    senderID VARCHAR2(20) references  member(id) not null,
    sendDate date default sysdate,
    accepterID VARCHAR2(20) references  member(id),
    acceptDate date,
    allUser number(1) default 0
);

CREATE SEQUENCE message_seq;

-- 3. 샘플 데이터
-- // 회원을 test, admin, tear

-- test -> admin
insert into message(no, content, senderID, accepterID)
values (message_seq.nextval, '감사합니다.', 'test', 'admin');

-- admin -> tear
insert into message(no, content, senderID, accepterID)
values (message_seq.nextval, '눈문의 여왕 - 감사합니다.', 'admin', 'tear');
commit;

select * from message;


