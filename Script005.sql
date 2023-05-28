SELECT
	sales_id,
	customer_id,
	cnt, 
	SUM(cnt) OVER (ORDER BY customer_id, sales_id ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS current_and_all_frame,
	SUM(cnt) OVER (ORDER BY customer_id DESC, sales_id DESC) AS current_and_all_order_desc
FROM
	sales
ORDER BY
	customer_id,
	sales_id;
