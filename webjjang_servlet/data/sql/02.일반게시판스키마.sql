-- �Ϲ� �Խ��� ���̺� ��Ű��
-- 1. ��ü ����
-- CASCADE : ���� �� - ������� �Ͱ� ����Ǿ� �ִ� ���� ������
-- PURGE : ����� �����뿡 ���� �ȴ�. �����뿡 �� ��� ������
DROP TABLE board CASCADE CONSTRAINTS PURGE;
DROP SEQUENCE board_seq;

-- 2. ��ü ����
CREATE TABLE board(
    no number primary key, -- null�� �ƴϰ� �ߺ��� ���� �ʴ� �׸�
    title VARCHAR2(300) not null, -- �ѱ��� 3����Ʈ
    content VARCHAR2(2000) not null,
    writer VARCHAR2(30) not null,
    writeDate DATE DEFAULT sysdate,
    hit NUMBER DEFAULT 0,
    pw VARCHAR2(20) not null
);

CREATE SEQUENCE board_seq;

-- 3. ���õ����� �ֱ�
INSERT INTO board(no, title, content, writer, pw)
VALUES(board_seq.nextval, 'java', 'program', 'lee', '1111');
INSERT INTO board(no, title, content, writer, pw)
VALUES(board_seq.nextval, 'java', 'program', 'lee', '1111');
COMMIT;

select * from board;