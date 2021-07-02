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
    mb_role INT default 0
);

drop table tbl_member;

insert into tbl_member(mb_id, mb_pw,mb_name,mb_tel)
values('gyu250','1234', '김' , '010-1111-1111');

insert into tbl_member(mb_id, mb_pw,mb_name,mb_tel, mb_role)
values('noso42','1234', '소연' , '010-4444-4444', 2);

insert into tbl_member(mb_id, mb_pw,mb_name,mb_tel, mb_role)
values('sk','1234', '은빈' , '010-1311-1111', 1);

select * from tbl_member;