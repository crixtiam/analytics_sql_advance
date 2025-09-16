use ventas_demo;

select * from customers;
select * from sales;

SELECT customer_id, order_date, amount
FROM (
    SELECT 
        customer_id,
        order_date,
        amount,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rn
    FROM sales
) t
WHERE rn = 1;


SELECT 
    customer_id,
    order_date,
    amount,
    LAG(amount, 1) OVER (PARTITION BY customer_id ORDER BY order_date) AS prev_amount,
    amount - LAG(amount, 1) OVER (PARTITION BY customer_id ORDER BY order_date) AS diff_vs_prev
FROM sales;


SELECT 
    customer_id,
    order_date,
    amount,
    LEAD(amount, 1) OVER (PARTITION BY customer_id ORDER BY order_date) AS next_amount
FROM sales;

-- Saber para cada compra: el pedido anterior, el siguiente y marcar si es la primera compra.

SELECT 
    customer_id,
    order_date,
    amount,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn,
    LAG(amount, 1) OVER (PARTITION BY customer_id ORDER BY order_date) AS prev_amount,
    LEAD(amount, 1) OVER (PARTITION BY customer_id ORDER BY order_date) AS next_amount
FROM sales;


SELECT * FROM SALES;
SELECT * FROM CUSTOMERS;


-- resolve the problem 
-- get the first and last purchase for each client

SELECT customer_id, order_date, amount, order_
FROM (
	SELECT customer_id, 
	   order_date, 
       amount,
       ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY ORDER_DATE ASC) AS order_ 
	FROM SALES AS T
) AS CUS
WHERE order_ = 3 or order_  = 1;

-- enumerate the purchase
SELECT customer_id, 
	   order_date, 
       amount,
       ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY ORDER_DATE DESC) AS order_ 
FROM SALES AS T;

-- diference between spent
SELECT customer_id, order_date, amount,
	   ROW_NUMBER() OVER (PARTITION BY customer_id order by order_date) top,
	   LAG(amount,1) OVER ( partition by customer_id order by order_date ) as last_purchase,
       amount - LAG(amount,1) over ( partition by customer_id order by order_date) as diff,
       COUNT(*) OVER (PARTITION BY customer_id ) total_orders,
       CASE
			WHEN ROW_NUMBER() OVER (PARTITION BY customer_id order by order_date)  = 1 THEN "PRIMERA COMPRA"
            WHEN ROW_NUMBER() OVER (PARTITION BY customer_id order by order_date)  = COUNT(*) OVER (PARTITION BY customer_id) THEN 'Última compra'
            ELSE "COMPRA INTERMEDIA"
	   END AS compra_tipo
FROM SALES;

----------------------------------------------

-- La diferencia en días entre una compra y la compra anterior (DATEDIFF + LAG).
select customer_id, order_date, amount,
	   DATEDIFF(
			lag(order_date,1) over (partition by customer_id order by order_date),
			order_date
       ) as date_between_orders
from sales
























