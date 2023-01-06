#A. Customer Nodes Exploration 
#number 1
select count(distinct node_id) total_nodes from customer_nodes;

#number 2
select region_id, count(distinct node_id) total_node
from customer_nodes
group by 1;

#number 3
select region_id, count(distinct customer_id) total_customer
from customer_nodes
group by 1;

#number 4
with urutan as (
select distinct customer_id,node_id, start_date, row_number () over( partition by customer_id, node_id order by start_date asc) urut
from customer_nodes
order by 1),

selisih as(
select customer_id, node_id, start_date, lag(start_date) over(partition by customer_id) dated
from urutan
where urut=1),

average as (
select *, abs(datediff(start_date,dated)) diff
from selisih
having diff is not NULL)

select concat(round(avg(diff),2)," days") averages
from average;

#number 5

