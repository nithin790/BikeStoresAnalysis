/*You can download the raw data for this link (github user's)
	link:- http://www.sqlservertutorial.net/load-sample-database/
	*/

USE BIkeStores;
SELECT ord.order_id,
       CONCAT(cus.first_name, ' ', cus.last_name) AS 'customer',
       cus.city,
       cus.state,
       ord.order_date,
       SUM(ite.quantity) AS total_units,
       SUM(ite.quantity) AS revenue,
       pro.product_name,
	   cat.category_name,
	   sto.store_name,
	   CONCAT(sta.first_name, ' ', sta.last_name) AS 'sales_rep'
FROM sales.orders ord
JOIN sales.customers cus ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite ON ord.order_id = ite.order_id
JOIN production.products pro ON ite.product_id = pro.product_id
join production.categories cat On pro.category_id =cat.category_id
join sales.stores sto On ord.store_id =sto.store_id
join sales.staffs sta on ord.staff_id =sta.staff_id
GROUP BY
       ord.order_id,
       CONCAT(cus.first_name, ' ', cus.last_name),
       cus.city,
       cus.state,
       ord.order_date,
       pro.product_name,
	   cat.category_name,
	   sto.store_name,
	   CONCAT(sta.first_name, ' ', sta.last_name) 

