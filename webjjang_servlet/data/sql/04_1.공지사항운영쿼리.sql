-- �������� � ����
-- 1. ����Ʈ
-- 1-0) ��� ���� - ������ ����.
select no, title, 
    to_char(startDate, 'yyyy-mm-dd') startDate,
    to_char(endDate, 'yyyy-mm-dd') endDate,
    to_char(updateDate, 'yyyy-mm-dd') updateDate
from notice
order by updateDate desc, no desc;

-- 1-1) ���� ���� - �Ϲ�ȸ�� �̻�
select no, title, startDate, endDate, updateDate
from notice
-- �������� ���纸�� �۰� �������� ���纸�� ũ�� - ���簡 �����ϰ� �������� ���̿� �ִ�.
where startDate <= sysdate and endDate >= trunc(sysdate)
order by updateDate desc, no desc;

-- 1-2) ���� ���� - �����ڸ�
select no, title, startDate, endDate, updateDate
from notice
-- �������� ���纸�� �۴� - �������� ��������.
where endDate < trunc(sysdate)
order by updateDate desc, no desc;

update notice set endDate = '2024-04-30'
where no = 2;

-- 1-3) ���� ���� - �����ڸ�
select no, title, startDate, endDate, updateDate
from notice
-- �������� ���纸�� ũ�� - ���� �� - �������� �ڿ� �ִ�.
where startDate > sysdate
order by updateDate desc, no desc;

update notice set startDate = '2024-04-30'
where no = 3;

rollback;