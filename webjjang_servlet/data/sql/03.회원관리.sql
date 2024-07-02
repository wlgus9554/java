-- ȸ�� ��� & ȸ��

-- 1. ��ü ����
-- FK ���̺��� ���� ����� PK�� ���߿� �����.
DROP TABLE member CASCADE CONSTRAINTS PURGE;
DROP TABLE grade CASCADE CONSTRAINTS PURGE;

-- 2. ��ü ����
-- PK ���̺��� ���� ����� FK�� ���߿� �����.
CREATE TABLE grade(
    gradeNo NUMBER(2) PRIMARY KEY,
    gradeName VARCHAR2(21) not null
);

CREATE TABLE member(
    id VARCHAR2(20) PRIMARY KEY,
    pw VARCHAR2(20) NOT NULL,
    name VARCHAR2(30) NOT NULL,
    gender VARCHAR2(6) NOT NULL CHECK( gender in ('����','����')),
    birth date NOT NULL,
    tel VARCHAR2(13),
    email VARCHAR2(50) NOT NULL UNIQUE,
    regDate DATE DEFAULT sysdate,
    conDate DATE DEFAULT sysdate,
    status VARCHAR2(6) DEFAULT '����' CHECK(status in ('����', '����', 'Ż��', '�޸�')),
    photo VARCHAR2(200),
    newMsgCnt NUMBER DEFAULT 0,
    gradeNo NUMBER(2) DEFAULT 1 REFERENCES grade(gradeNo) 
    -- ON DELETE CASCADE
    -- ON DELETE SET NULL
);

-- 3. ���� ������
-- 1) PK �����͸� ���� �ִ´�. - grade
INSERT INTO grade -- ���̺� �̸��� ���� ���� ��� �÷��� ���ؼ� ������� �����͸� �Է��� �� ���� ����
values(1, '�Ϲ�ȸ��');
INSERT INTO grade
values(9, '������');
commit;
-- 2) FK �����͸� PK �ڿ� �ִ´�. - member
-- �Ϲ� ȸ�� ����
INSERT INTO member(id, pw, name, gender, birth, tel, email, photo)
values('test','1111','ȫ�浿','����','1990-01-01','010-1234-1234','hong@naver.com','/upload/member/hong.jpg');
INSERT INTO member(id, pw, name, gender, birth, tel, email, photo)
values('tear','1111','������','����','1998-01-01','010-1004-1004','tear@naver.com','/upload/member/tear.jpg');
-- ������ ���
INSERT INTO member(id, pw, name, gender, birth, tel, email, photo, gradeNo)
values('admin','1111','������','����','1997-03-01','010-1111-8888','leelj1@nate.com','/upload/member/leelj1.jpg', 9);
commit;


select * from grade;
select * from member;
