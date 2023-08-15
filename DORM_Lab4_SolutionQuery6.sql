/*
6)	Find the least expensive product from each category and print the table with 
category id, 
name, 
product name and price of the product
*/

select p.cat_id as category_id , 
c.CAT_NAME as name,  
 p.pro_name as product_name,
 min_price as price 
 from product p 
 inner join (
select c.CAT_ID, min(p.Supp_price) as min_price 
from product pr 
inner join supplier_pricing p using (PRO_ID)
inner join category c 
using(CAT_ID) 
group by c.CAT_ID) category_price
on category_price.CAT_ID = p.CAT_ID 
inner join category c on c.CAT_ID = category_price.CAT_ID inner join supplier_pricing sp 
on sp.supp_price = category_price.min_price;