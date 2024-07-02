-- 공지사항 운영 쿼리
-- 1. 리스트
-- 1-0) 모든 공지 - 조건이 없다.
select no, title, 
    to_char(startDate, 'yyyy-mm-dd') startDate,
    to_char(endDate, 'yyyy-mm-dd') endDate,
    to_char(updateDate, 'yyyy-mm-dd') updateDate
from notice
order by updateDate desc, no desc;

-- 1-1) 현재 공지 - 일반회원 이상
select no, title, startDate, endDate, updateDate
from notice
-- 시작일이 현재보다 작고 종료일이 현재보다 크다 - 현재가 시작일과 종료일의 사이에 있다.
where startDate <= sysdate and endDate >= trunc(sysdate)
order by updateDate desc, no desc;

-- 1-2) 지난 공지 - 관리자만
select no, title, startDate, endDate, updateDate
from notice
-- 종료일이 현재보다 작다 - 종료일이 지나갔다.
where endDate < trunc(sysdate)
order by updateDate desc, no desc;

update notice set endDate = '2024-04-30'
where no = 2;

-- 1-3) 예약 공지 - 관리자만
select no, title, startDate, endDate, updateDate
from notice
-- 시작일이 현재보다 크다 - 공지 전 - 시작일이 뒤에 있다.
where startDate > sysdate
order by updateDate desc, no desc;

update notice set startDate = '2024-04-30'
where no = 3;

rollback;