/*
7)	Display the Id and Name of the Product ordered after “2021-10-05”.
*/

SELECT  pro_id, pro_name from product
inner join supplier_pricing 
using(pro_id)  
inner join orders
using(pricing_id)
where ORD_DATE >  '2021-10-05';