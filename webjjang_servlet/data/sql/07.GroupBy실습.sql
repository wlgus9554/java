-- ī��Ʈ ����
-- 1. ��ü ���̺��� ī��Ʈ
select count(*) from board;
-- �ۼ��ڰ� lee�� �������� ����
select count(*) from board where writer = 'lee';
select distinct writer from board;
-- �ۼ��ں� ������ ����
select writer, count(*) cnt
from board
GROUP BY writer
HAVING count(*) >= 40
order by cnt desc
;

-- ȸ�� ���� �ο���
select gender, count(*) cnt
from member
-- where status = '����' -- ���� ���� ������ ������ ����
GROUP BY gender;
-- HAVING 

INSERT INTO board(no, title, content, writer, pw)
VALUES(board_seq.nextval, 'java', 'program', '�̿�ȯ', '1111');
INSERT INTO board(no, title, content, writer, pw)
VALUES(board_seq.nextval, 'java', 'program', 'hong', '1111');
commit;
INSERT INTO board(no, title, content, writer, pw)
(select board_seq.nextval, title, content, writer, pw from board);
commit;
