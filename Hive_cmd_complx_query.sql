set hive.auto.convert.join = false;
set hive.ignore.mapjoin.hint = false;


Create table customers_order_details as
Select /*+MAPJOIN(T)*/
c.customer_id ,
concat(c.first_name ,
c.last_name) as Full_name ,
c.state, c.zip_code,
o.order_id,
o.order_status,
o.order_date,
o.store_id
from customers_ORC c
join orders_ORC o on (c.customer_id=o.customer_id);