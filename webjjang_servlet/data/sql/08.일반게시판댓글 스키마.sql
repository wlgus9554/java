-- ÀÏ¹Ý°Ô½ÃÆÇ ´ñ±Û ½ºÅ°¸¶

-- 1. °´Ã¼ Á¦°Å
drop TABLE board_reply CASCADE CONSTRAINTS PURGE;
DROP SEQUENCE board_reply_seq;

-- 2. °´Ã¼ »ý¼º
CREATE TABLE board_reply(
    rno NUMBER PRIMARY KEY,
    no NUMBER REFERENCES board(no) NOT NULL,
    content VARCHAR2(1500) NOT NULL,
    writer VARCHAR2(30) NOT NULL,
    pw VARCHAR2(20) NOT NULL,
    writeDate date default sysdate
);

CREATE SEQUENCE board_reply_seq;

select max(no) from board;
-- 3. »ùÇÃµ¥ÀÌÅÍ
insert into board_reply(rno, no, content, writer, pw)
values(board_reply_seq.nextval, 158, 'ÀÏ¹Ý°Ô½ÃÆÇ ´ñ±Û1', 'È«±æµ¿', '1111');
insert into board_reply(rno, no, content, writer, pw)
values(board_reply_seq.nextval, 158, 'ÀÏ¹Ý°Ô½ÃÆÇ ´ñ±Û2', '¼ÕÈï¹Î', '1111');
commit;