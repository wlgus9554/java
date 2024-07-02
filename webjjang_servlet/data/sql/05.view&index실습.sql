-- 1-1) 현재 공지 - 일반회원 이상
select no, title, startDate, endDate, updateDate
from notice
-- 시작일이 현재보다 작고 종료일이 현재보다 크다 - 현재가 시작일과 종료일의 사이에 있다.
where startDate <= sysdate and endDate >= trunc(sysdate)
order by updateDate desc, no desc;

-- view table을 이용한 처리를 위한 view 생성
CREATE OR REPLACE VIEW notice_pre
AS
select no, title, content, startDate, endDate, updateDate writeDate
from notice
-- 시작일이 현재보다 작고 종료일이 현재보다 크다 - 현재가 시작일과 종료일의 사이에 있다.
where startDate <= sysdate and endDate >= trunc(sysdate)
order by updateDate desc, no desc;

-- 현재 공지 보기
-- view 테이블은 1. 쿼리가 길고 복잡하면, 2. 사용 제한을 주려면 뷰 만든다.
select no, title, startDate, endDate, writeDate
from notice_pre;

-- index - 속도 빠르게 
CREATE INDEX board_no_idx
ON board(no DESC);
-- 회원 이름, 생년월일 -> index
CREATE INDEX board_name_birth_idx
ON member(name,birth);