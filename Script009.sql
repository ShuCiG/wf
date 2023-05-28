SELECT
	sales_id,
	customer_id,
	price_per_item,
	cnt, 
	SUM(cnt) OVER (ORDER BY customer_id DESC, price_per_item DESC) AS cum_uniq,
	cnt,
	SUM(cnt) OVER (ORDER BY customer_id, price_per_item ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS current_and_all_before,
	customer_id,
	cnt,
	SUM(cnt) OVER (ORDER BY customer_id, price_per_item RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS current_and_all_before2
FROM
	sales
ORDER BY
	2,
	price_per_item,
	sales_id desc;
