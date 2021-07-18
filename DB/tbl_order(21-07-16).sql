-- tbl_order
use db_malang;

select * from tbl_order;

-- id별로 주문 중 후기 없는 리스트
select * from tbl_order
where od_buyerid = 'noso42' and od_paydate is not null and od_rcode is null;


