SELECT
	sales_id,
	customer_id,
	price_per_item,
	cnt, 
	SUM(cnt) OVER (ORDER BY customer_id, price_per_item) AS cum_uniq,
	cnt,
	SUM(cnt) OVER (ORDER BY customer_id, price_per_item ROWS UNBOUNDED PRECEDING) AS current_and_all_before,
	customer_id,
	cnt,
	SUM(cnt) OVER (ORDER BY customer_id, price_per_item RANGE UNBOUNDED PRECEDING) AS current_and_all_before2
FROM
	sales
ORDER BY
	2,
	price_per_item;
