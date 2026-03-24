/*Important KPI's*/

#Total_Revenue
SELECT 
Concat(round(Sum(revenue_realized)/1000000000,3),"B" )as Total_Revenue
FROM fact_bookings;

#Total_Bookings
Select concat(round(count(booking_id)/1000,0),"K") Total_Bookings 
From fact_bookings;

#Occupancy %
Select
Concat(round(((sum(successful_bookings)/sum(capacity))*100),2),"%") As "Occupancy%"
From fact_aggregated_bookings;

#Total no. of NoShows
select count(booking_status) Total_NoShows
from fact_bookings
where booking_status = "No Show";

#Total Checkouts
select
Concat(round(count(booking_status)/1000,0),"K") Total_Checkouts
from fact_bookings
where booking_status = "Checked Out";

#Bookng status
select booking_status,count(booking_status) Count,(count(booking_status)/sum(count(booking_id)) over())*100 percentage
from fact_bookings
group by 1;
































































