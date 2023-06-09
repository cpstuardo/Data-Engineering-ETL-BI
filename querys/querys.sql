SELECT product_category_name,
extract( year from date(order_purchase_timestamp)) as year_sold,
count(1) as total_count
from mysql_dwh.order_items
group by 1,2


select 
	b.product_category_name_english ,
	a.year,
	count(1) as view_count
from 
	dwh_external_data_spectrum.parquet_output a 
join 
	mysql_dwh.product_category_name_translation b 
on
	a.category_id = b.product_category_name
where a.event_type = 'view'
group by 1,2
order by a.year 


SELECT order_status,
extract( year from date(order_purchase_timestamp)) as year_sold,
count(1) as total_count
from mysql_dwh.orders
group by 1,2