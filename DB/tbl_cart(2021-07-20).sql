-- cart 
use db_malang;

SELECT * FROM tbl_cart;

-- drop view view_cart;

create view view_cart as select
C.cr_code, C.cr_buyerid, C.cr_itcode, I.it_photo, I.it_title, C.cr_option,
	I.it_seid, C.cr_price, C.cr_amount, C.cr_shippingfee
FROM tbl_cart C
	LEFT JOIN tbl_item I
		ON C.cr_itcode = I.it_code;

select * from view_cart;

-- select cr_price from view_cart
select cr_shippingfee from view_cart
where cr_buyerid = 'nana';

-- select sum(cr_price) from view_cart
select sum(cr_shippingfee) from view_cart
where cr_buyerid = 'nana';


insert into tbl_cart (cr_buyerid, cr_itcode, cr_option, cr_price, cr_amount, cr_shippingfee)
values('nana', '00000005', '사용:상업용/추가옵션:없음/테스트:테스트1',9900,1,0);

insert into tbl_cart (cr_buyerid, cr_itcode, cr_option, cr_price, cr_amount, cr_shippingfee)
values('nana', '48315592', '매트 사이즈:60 * 60',15000,1,3000);