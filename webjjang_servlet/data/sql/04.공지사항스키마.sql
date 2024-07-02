-- ���� ���� ��Ű��
-- 1. ����
DROP TABLE notice CASCADE CONSTRAINTS PURGE;
DROP SEQUENCE notice_seq;

-- 2. ����
CREATE TABLE notice(
    no number primary key,
    title VARCHAR2(300) not null,
    content VARCHAR2(2000) not null,
    startDate date default sysdate,
    endDate date default '9999-12-30',
    writeDate date default sysdate,
    updateDate date default sysdate
);

CREATE SEQUENCE notice_seq;

-- 3. ���õ�����
-- 3-1) ���� ����
insert into notice(no, title, content, startDate, endDate)
values(notice_seq.nextval, 'Ű����ũ���� ����', 'Ű����ũ���� ����', '2024-04-11', '2024-09-27');
-- 3-2) ���� ����
insert into notice(no, title, content, startDate, endDate)
values(notice_seq.nextval, 'Ű����ũ���� ����', 'Ű����ũ���� ����', '2024-04-11', '2024-04-17');
-- 3-3) ���� ����
insert into notice(no, title, content, startDate, endDate)
values(notice_seq.nextval, 'Ű����ũ���� ����', 'Ű����ũ���� ���� ����', '2024-09-21', '2024-09-27');
commit;

select * from notice;