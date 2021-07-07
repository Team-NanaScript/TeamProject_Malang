use db_malang;

CREATE TABLE tbl_member (
    mb_id VARCHAR(20) PRIMARY KEY,
    mb_pw VARCHAR(16) NOT NULL,
    mb_name VARCHAR(10) NOT NULL,
    mb_tel VARCHAR(20) NOT NULL,
    mb_birth CHAR(8),
    mb_anum VARCHAR(20),
    mb_addr VARCHAR(200),
    mb_email VARCHAR(50),
    mb_role INT default 0,
	mb_nickname	VARCHAR(15)
);



drop table tbl_member;

insert into tbl_member(mb_id, mb_pw,mb_name,mb_tel, mb_role, mb_nickname)
values('gyu250','1234', '영진' , '010-1111-1111', '2', '영진');

insert into tbl_member(mb_id, mb_pw, mb_name, mb_tel, mb_role, mb_nickname)
values('nana', 'nanask', '나나', '010-1111-4444', '0', 'nana');

insert into tbl_member(mb_id, mb_pw,mb_name,mb_tel, mb_role, mb_nickname)
values('noso42','1234', '소연' , '010-4444-4444', 2, '관리자');

insert into tbl_member(mb_id, mb_pw,mb_name,mb_tel, mb_role, mb_nickname)
values('seller', 'seller', '판매자', '010-1112-2223', '1', '말랑이말랑');

select * from tbl_member;