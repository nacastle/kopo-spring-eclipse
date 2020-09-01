

-- hafy 회원 테이블
select * from hf_member;
select sysdate from dual;
DROP TABLE hf_member;

CREATE TABLE hf_member
(
    nickname    VARCHAR2(30) NOT NULL,
    name    VARCHAR2(20) NOT NULL,
    sex      VARCHAR2(5) NOT NULL,
    res_no    VARCHAR2(20) NOT NULL,
    phone    VARCHAR2(19) NOT NULL,
    address1    VARCHAR2(200) NOT NULL,   
    phone_company    VARCHAR2(10) NOT NULL,
    address2    VARCHAR2(200) NOT NULL,
    tranz_pwd VARCHAR2(30) NOT NULL   
    
);

CREATE UNIQUE INDEX 엔터티1_1_1_1_1_1_1_PK8 ON hf_member
( nickname );

ALTER TABLE hf_member
 ADD CONSTRAINT 엔터티1_1_1_1_1_1_1_PK8 PRIMARY KEY ( nickname )
 USING INDEX 엔터티1_1_1_1_1_1_1_PK8;
 
desc hf_member;

insert into hf_member values('123','123','123','123','123','123','123','123');
delete hf_member;
commit;

----------------------------------------------------------------------------------
-----회원 계좌 테이블

select * from hf_m_account;

truncate table hf_m_account;

DROP TABLE hf_m_account;

CREATE TABLE hf_m_account
(
    account_no    VARCHAR2(30) NOT NULL,
    bank    VARCHAR2(30) NOT NULL,
    member_nick    VARCHAR2(30) NOT NULL,
    balance     NUMBER(12) DEFAULT 1000000 not null
);

desc hf_m_account;
commit;
alter table hf_m_account rename column nickname to member_nick;

alter table hf_m_account add balance NUMBER(12) DEFAULT 1000000 not null;

CREATE UNIQUE INDEX 엔터티2_PK ON hf_m_account
( account_no );

ALTER TABLE hf_m_account
 ADD CONSTRAINT 엔터티2_PK PRIMARY KEY ( account_no )
 USING INDEX 엔터티2_PK;
 
 commit;
 
 
----------------------------------------------------------------------------------------------------------------------------------
 --경매 상품 테이블----------------------------------------------------------------

select * from hf_auc_goods;
select * from hf_goods_photo;
select no, save_name    from hf_goods_photo    where auc_no = 120;

select * from 
(select * from hf_goods_photo where auc_no = 114 order by no) where rownum = 1;

desc hf_goods_photo;
		select save_name from 
(select save_name from hf_goods_photo where auc_no = 120 order by no) where rownum = 1;

select * from hf_goods_photo;

select * from hf_goods_photo;

select a.no, a.name, a.end_date, a.start_price, g.save_name, g.no  from hf_auc_goods a
join hf_goods_photo g
on a.no = g.auc_no;

delete hf_auc_goods;
commit;
truncate table hf_goods_photo;
select * from hf_goods_photo;

desc hf_auc_goods;
select sysdate from dual;
select to_date(to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')) from dual;

DROP TABLE hf_auc_goods;

CREATE TABLE hf_auc_goods
(
    category    VARCHAR2(100) NOT NULL,
    reg_date    VARCHAR2(100) default sysdate NOT NULL ,
    name    VARCHAR2(30) NOT NULL,
    no    NUMBER(5) NOT NULL,
    method    VARCHAR2(20) NOT NULL,
    start_price    NUMBER(12) NOT NULL,
    start_date    VARCHAR2(100) NOT NULL,
    end_date    VARCHAR2(100) NOT NULL,
    detail    VARCHAR2(400) NOT NULL,
    member_nick    VARCHAR2(30) NOT NULL,
    view_cnt NUMBER(10) DEFAULT 0 NOT NULL,
    like_cnt NUMBER(10) DEFAULT 0 NOT NULL
);

alter table hf_auc_goods add view_cnt number(10) default 0 not null;
alter table hf_auc_goods add like_cnt number(10) default 0 not null;


CREATE UNIQUE INDEX 엔터티1_1_1_1_1_1_1_1_PK1 ON hf_auc_goods
( no );

ALTER TABLE hf_auc_goods
 ADD CONSTRAINT 엔터티1_1_1_1_1_1_1_1_PK1 PRIMARY KEY ( no )
 USING INDEX 엔터티1_1_1_1_1_1_1_1_PK1;

create sequence seq_hf_auc_goods_no nocache;

select seq_hf_auc_goods_no.nextval from dual;
commit;
rollback;

ALTER TABLE hf_auc_goods ADD CONSTRAINT hf_auc_goods_nick_fk   
FOREIGN KEY(member_nick) REFERENCES hf_member(nickname);


----------------------------------------------------------------------------------------------------------------------------------------------------
--상품 사진 테이블 ---------------------------------------------------------------
select * from hf_goods_photo;
DROP TABLE hf_goods_photo;

desc hf_goods_photo;


CREATE TABLE hf_goods_photo
(
    no    NUMBER(10) NOT NULL,
    ori_name    VARCHAR2(200) NOT NULL,
    save_name    VARCHAR2(200) NOT NULL,
    file_size    NUMBER(15) NOT NULL,
    auc_no    NUMBER(5) NOT NULL
);


create sequence seq_hf_goods_photo_no nocache;


ALTER TABLE hf_goods_photo ADD CONSTRAINT hf_goods_photo_auc_no_fk   
FOREIGN KEY(auc_no) REFERENCES hf_auc_goods(no);

CREATE UNIQUE INDEX 엔터티2_PK1 ON hf_goods_photo
( no );

ALTER TABLE hf_goods_photo
 ADD CONSTRAINT 엔터티2_PK1 PRIMARY KEY ( no )
 USING INDEX 엔터티2_PK1;


commit;

------------------------------------------------------------------------------------------
---좋아요 목록------------------------------------------------------------------

DROP TABLE hf_like;

CREATE TABLE hf_like
(
    member_nick    VARCHAR2(100) NOT NULL,
    auc_no    NUMBER(5) NOT NULL
);

CREATE UNIQUE INDEX 엔터티2_PK2 ON hf_like
( auc_no,member_nick );

ALTER TABLE hf_like
 ADD CONSTRAINT 엔터티2_PK2 PRIMARY KEY ( auc_no,member_nick )
 USING INDEX 엔터티2_PK2;
 
 ALTER TABLE hf_like ADD CONSTRAINT hf_like_auc_no_fk   
FOREIGN KEY(auc_no) REFERENCES hf_auc_goods(no) on delete cascade;

commit;





