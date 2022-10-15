create external table if not exists customers (
customer_id INT,
first_name string,
last_name string,
phone INT,
email string,
street string,
city string,
state string,
zip_code INT ) 
comment ' table to store customers details' 
row format delimited 
fields terminated by ',' 
stored as TEXTFILE  
location '/user/hdfs/customers/';

create external table if not exists orders ( 
order_id INT,
customer_id string,
order_status string,
order_date string,
required_date string,
shipped_date string,
store_id INT,
staff_id INT ) 
comment ' table to store orders details' 
row format delimited 
fields terminated by ',' 
stored as TEXTFILE 
location '/user/hdfs/orders/';

set hive.exec.dynamic.partition = true;
set hive.exec.dynamic.partition.mode = nonstrict;
set hive.enforce.bucketing = true;

