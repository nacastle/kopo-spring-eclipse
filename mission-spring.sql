
select * from t_board;

alter table t_board add reply_cnt number(5) default 0;

select * from t_reply;
delete t_reply;
commit;

update t_board set reply_cnt = 0;

-- 댓글 테이블 생성

create table t_reply (
    no number(5) primary key,
    board_no number(5) not null,
    content varchar2(1000) not null,
    writer varchar2(200) not null,
    reg_date date default sysdate,
    constraint t_reply_board_no_fk foreign key(board_no) references t_board(no)
);

-- 댓글 시퀀스 생성
create sequence seq_t_reply_no nocache;

select no, title, writer, content, view_cnt,reg_date
    ,(select count(*) from t_reply r where r.board_no = t.no) as reply_cnt
    from t_board t
    where no = 3;


select * from t_board;
select no, title, content, writer, view_cnt as viewCnt,   reg_date as regDate   from t_board      order by desc;
desc t_board;

-- t_board 테이블에 댓글 카운트 컬럼 추가

alter table t_board
    add reply_cnt number(5) default 0;

select id, password
	from t_member
	where id='asd' and password='asd';
    
select * from t_member;
