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


#B. Customer Transactions
#number 1
select txn_type, count(distinct txn_amount) unique_value, sum(txn_amount) total
from customer_transactions
group by 1;


#number 2
select count(txn_type)/(select count(*) from customer_transactions) average, sum(txn_amount) total
from customer_transactions
where txn_type ='deposit';


#number 3
with df as(
select month(txn_date) month, customer_id, txn_date, txn_type,
row_number() over(partition by customer_id order by txn_date) ff
from customer_transactions
where txn_type ='deposit' and customer_id in (select distinct customer_id 
from customer_transactions 
where txn_type in ('pirchase','withdrawal'))
order by 1,2 asc)

select distinct month, customer_id
from df
where ff>1
