/*
9)	Create a stored procedure to display supplier id, name, rating and Type_of_Service. 

For Type_of_Service-
	If rating =5, print “Excellent Service”
	If rating >4 print “Good Service”
    If rating >2 print “Average Service”
    else print “Poor Service”
*/

DELIMITER $
CREATE PROCEDURE displaySupplierRatings()
Begin
select 
	  report.supp_id as Supplier_ID,
	  report.supp_name as Supplier_Name, 
	  report.AverageRating as Average_Rating,
 
CASE
	  WHEN report.AverageRating =5 THEN 'Excellent Service'
	  WHEN report.AverageRating >4 THEN 'Good Service'
	  WHEN report.AverageRating >2 THEN 'Average Service'
	  ELSE 'Poor Service'
END 
AS Type_of_Service 
from
(select supplier.supp_name, final.supp_id, final.AverageRating from
	(select sp_orra.supp_id, avg(sp_orra.rat_ratstars)
    as AverageRating from
		(select supplier_pricing.supp_id, orra.ORD_ID, orra.RAT_RATSTARS 
        from supplier_pricing 
            inner join
			(select `orders`.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS 
            from `orders` 
            inner join rating 
            on rating.`ord_id` = `orders`.ord_id 
			) 
			as orra
			on orra.pricing_id = supplier_pricing.pricing_id
		)
		as sp_orra 
		group by supplier_pricing.supp_id
	)
	as final 
	inner join supplier 
	where final.supp_id = supplier.supp_id
) 
as report;
End$
DELIMITER ;

call displaySupplierRatings();