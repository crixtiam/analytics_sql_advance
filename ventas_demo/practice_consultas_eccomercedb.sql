-- calcular el crecimiento porcentual de ventas por cliente mes a mes 
use ecommerce_db;

select customer_id, year, month  from (
	select customer_id,
		   year(order_date) as year,
		   month(order_date) as month,
           row_number () over ( partition by month(order_date) order by total_amount desc) as total_per_month
    from purchase_order
) percentual;


-- select * from purchase_order