-- tbl_order
use db_malang;

select * from tbl_order;
desc tbl_order;

insert into tbl_order (od_buyerid, od_itcode, od_option, od_price, od_anum, od_addr, od_paydate, od_orderdate)
values ('nana','00000005','상업용/배경추가', 5000, '12345', '광주 냠냠냠냠..', '2021-07-16', '2021-07-18');

-- id별로 주문 중 후기 없는 리스트
select * from tbl_order
where od_buyerid = 'noso42'
and od_paydate is not null and od_rcode is null;

create view view_order as select
O.od_code, O.od_buyerid, O.od_itcode, I.it_title, O.od_option, O.od_price, O.od_anum,
O.od_addr, O.od_paydate, O.od_orderdate, O.od_rcode
FROM tbl_order O
	LEFT JOIN tbl_item I
		ON O.od_itcode = I.it_code;

select * from view_order;
	