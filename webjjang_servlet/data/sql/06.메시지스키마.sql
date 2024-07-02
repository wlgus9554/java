-- �޽��� ��Ű��
-- 1. ����
DROP TABLE message CASCADE CONSTRAINTS PURGE;
DROP SEQUENCE message_seq;

-- 2. ����
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

-- 3. ���� ������
-- // ȸ���� test, admin, tear

-- test -> admin
insert into message(no, content, senderID, accepterID)
values (message_seq.nextval, '�����մϴ�.', 'test', 'admin');

-- admin -> tear
insert into message(no, content, senderID, accepterID)
values (message_seq.nextval, '������ ���� - �����մϴ�.', 'admin', 'tear');
commit;

select * from message;


