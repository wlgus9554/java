select sysdate from dual;

-- �ּ� : ����� ����� (���� �̸����� DB�� ����� ����. ����ڿ� ����ǵ��� �Ǿ��ִ�.)
create USER java IDENTIFIED BY java;

-- ����� ����
DROP USER java;

-- ������ ����� �ƹ��͵� ���ϴ� ����ƺ� ������ ���� -> ������ ��� ���� �� �� �ִ�.
GRANT CONNECT, RESOURCE, CREATE VIEW TO java;