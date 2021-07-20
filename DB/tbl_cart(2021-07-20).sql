-- cart 
use db_malang;

SELECT * FROM tbl_cart;

create view view_cart as select
C.cr_code, C.cr_buyerid, C.cr_itcode, I.it_photo, I.it_title, C.cr_option,
	I.it_seid, C.cr_price, C.cr_amount, C.cr_shippingfee
FROM tbl_cart C
	LEFT JOIN tbl_item I
		ON C.cr_itcode = I.it_code;

select * from view_cart;