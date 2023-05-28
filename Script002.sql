SELECT
	sales_id,
	customer_id,
	cnt, 
	SUM(cnt) OVER () AS total,
	SUM(cnt) OVER (ORDER BY customer_id) AS cum,
	SUM(cnt) OVER (ORDER BY customer_id, sales_id) AS cum_uniq
FROM
	sales
ORDER BY
	customer_id,
	sales_id;
	