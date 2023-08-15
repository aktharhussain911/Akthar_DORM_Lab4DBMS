/*
4)	Display all the orders along with product name ordered by a customer having Customer_Id=2
*/

SELECT 
     product.PRO_NAME, `orders`.*
FROM 
     `orders`, supplier_pricing, product
WHERE 
     `orders`.CUS_ID = 2
	AND 
    `orders`.PRICING_ID = supplier_pricing.PRICING_ID
    AND 
    supplier_pricing.PRO_ID = product.PRO_ID;