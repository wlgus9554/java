-- 메시지 운영 쿼리
-- 1. 리스트
select 
    m.no, m.content, m.senderID, sm.name, m.sendDate,
    m.accepterID, am.name, m.acceptDate
from message m, member sm, member am
-- 조건((일반조건) and (조인조건)) : 조건이 없으면 생략 가능
where m.senderID = sm.id and accepterID = am.id;

-- 2. 상세보기(메시지 읽기) - 글번호
--- 1) acceptDate에 오늘 날짜로 수정한다.
--- 2) 상세정보 보기

