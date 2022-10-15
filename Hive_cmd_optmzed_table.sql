create external table if not exists customers_ORC (
first_name string,
last_name string,
phone INT,
email string,
state string,
street string,
city string,
zip_code INT ) 
PARTITIONED BY (customer_id INT) 
CLUSTERED BY (zip_code) ino 4 BUCKETS 
STORED AS ORC
location '/user/hdfs/optimiz_dir/' 
TBLPROPERTIES('orc.compress'='SNAPPY');

insert overwrite table customers_ORC 
PARTITION(customer_id)
Select * from customers;

create external table if not exists orders_ORC ( 
order_id INT,
order_status string,
order_date DATE,
required_date DATE,
shipped_date DATE,
store_id INT,
staff_id INT ) 
PARTITIONED BY (customer_id INT) 
CLUSTERED BY (order_date) ino 4 BUCKETS 
STORED AS ORC
location '/user/hdfs/optimiz_dir/' 
TBLPROPERTIES('orc.compress'='SNAPPY');

insert overwrite table customers_ORC 
PARTITION(state)
Select 
order_id, order_status,from_unixtime(unix_timestamp(order_date,'M/dd/yyyy'),'yyyy-MM-dd'),from_unixtime(unix_timestamp(required_date,'M/dd/yyyy'),'yyyy-MM-dd'),from_unixtime(unix_timestamp(shipped_date,'M/dd/yyyy'),'yyyy-MM-dd'),store_id, staff_id,
customer_id
from order;

