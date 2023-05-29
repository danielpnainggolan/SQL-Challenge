

with part as(
select *, dense_rank() over(partition by order_id order by date) ranking, 
lag(date) over(partition by order_id order by date) as dated
from order_log)

select if(status='processed','cteeated to processed','processed to delivered') status,  
       avg(datediff(date,dated)) average 
from part
where dated is not null
group by 1;
