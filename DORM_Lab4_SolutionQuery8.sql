/*
8)	Display customer name and gender whose names start or end with character 'A'.
*/

select CUS_NAME as name , CUS_GENDER as gender 
from customer 
where CUS_NAME like 'A%' or CUS_NAME like '%A';