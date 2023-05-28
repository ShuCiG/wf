SELECT
	sales_id,
	customer_id,
	cnt, 
	SUM(cnt) OVER (ORDER BY customer_id, sales_id) AS cum_uniq,
	SUM(cnt) OVER (ORDER BY customer_id, sales_id ROWS UNBOUNDED PRECEDING) AS current_and_all_before,
	SUM(cnt) OVER (ORDER BY customer_id, sales_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS current_and_all_before2
FROM
	sales
ORDER BY
	customer_id,
	sales_id;
