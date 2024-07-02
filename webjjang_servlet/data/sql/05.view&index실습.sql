-- 1-1) ���� ���� - �Ϲ�ȸ�� �̻�
select no, title, startDate, endDate, updateDate
from notice
-- �������� ���纸�� �۰� �������� ���纸�� ũ�� - ���簡 �����ϰ� �������� ���̿� �ִ�.
where startDate <= sysdate and endDate >= trunc(sysdate)
order by updateDate desc, no desc;

-- view table�� �̿��� ó���� ���� view ����
CREATE OR REPLACE VIEW notice_pre
AS
select no, title, content, startDate, endDate, updateDate writeDate
from notice
-- �������� ���纸�� �۰� �������� ���纸�� ũ�� - ���簡 �����ϰ� �������� ���̿� �ִ�.
where startDate <= sysdate and endDate >= trunc(sysdate)
order by updateDate desc, no desc;

-- ���� ���� ����
-- view ���̺��� 1. ������ ��� �����ϸ�, 2. ��� ������ �ַ��� �� �����.
select no, title, startDate, endDate, writeDate
from notice_pre;

-- index - �ӵ� ������ 
CREATE INDEX board_no_idx
ON board(no DESC);
-- ȸ�� �̸�, ������� -> index
CREATE INDEX board_name_birth_idx
ON member(name,birth);