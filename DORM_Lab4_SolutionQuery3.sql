/*
3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
*/

SELECT c.CUS_GENDER, 
COUNT(*) AS total_customers
FROM customer c
Inner JOIN orders o 
using (cus_id)
inner JOIN supplier_pricing sp 
using (PRICING_ID)
WHERE SP.supp_price >= 3000
group by c.CUS_GENDER;