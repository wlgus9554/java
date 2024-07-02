-- 카운트 세기
-- 1. 전체 테이블의 카운트
select count(*) from board;
-- 작성자가 lee인 데이터의 갯수
select count(*) from board where writer = 'lee';
select distinct writer from board;
-- 작성자별 데이터 개수
select writer, count(*) cnt
from board
GROUP BY writer
HAVING count(*) >= 40
order by cnt desc
;

-- 회원 성별 인원수
select gender, count(*) cnt
from member
-- where status = '정상' -- 원본 값을 가지고 들어오는 조건
GROUP BY gender;
-- HAVING 

INSERT INTO board(no, title, content, writer, pw)
VALUES(board_seq.nextval, 'java', 'program', '이영환', '1111');
INSERT INTO board(no, title, content, writer, pw)
VALUES(board_seq.nextval, 'java', 'program', 'hong', '1111');
commit;
INSERT INTO board(no, title, content, writer, pw)
(select board_seq.nextval, title, content, writer, pw from board);
commit;
