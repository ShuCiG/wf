SELECT
	sales_id,
	customer_id,
	cnt, 
	SUM(cnt) OVER (ORDER BY customer_id) AS cum_uniq,
	cnt,
	SUM(cnt) OVER (ORDER BY customer_id ROWS UNBOUNDED PRECEDING) AS current_and_all_before,
	customer_id,
	cnt,
	SUM(cnt) OVER (ORDER BY customer_id RANGE UNBOUNDED PRECEDING) AS current_and_all_before2
FROM
	sales
ORDER BY
	2,
	sales_id;
