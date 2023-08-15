/*
5)	Display the Supplier details who can supply more than one product.
*/

SELECT s.*, COUNT(distinct pr.PRO_ID) AS `Number` FROM supplier s
INNER JOIN supplier_pricing sp
using (SUPP_ID)
INNER JOIN product pr
using (PRO_ID)
GROUP BY SUPP_ID
HAVING COUNT(distinct PRO_ID) > 1;