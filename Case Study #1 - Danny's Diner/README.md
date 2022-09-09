# <p align="center" style="margin-top: 0px;">Case Study #1 - Danny's Diner
  
  ***

## Business Case
  
  Danny seriously loves Japanese food so in the beginning of 2021, he decides to embark upon a risky venture and opens up a cute little restaurant that sells his 3 favourite foods: sushi, curry and ramen.

Danny’s Diner is in need of your assistance to help the restaurant stay afloat - the restaurant has captured some very basic data from their few months of operation but have no idea how to use their data to help them run the business.
  
  Danny wants to use the data to answer a few simple questions about his customers, especially about their visiting patterns, how much money they’ve spent and also which menu items are their favourite. Having this deeper connection with his customers will help him deliver a better and more personalised experience for his loyal customers.

  ***

  
  ## Entity Relationship Diagram
<p align="center" style="margin-bottom: 0px !important;">
  <img src="https://user-images.githubusercontent.com/43850912/143439961-d2a99289-bd1d-4a52-b095-6c1feb4ad9b2.png">
    
***
  
## Tables
  

 #### ``Table 1: runners``
  
runner_id | registration_date
-- | --
1 | 2021-01-01
2 | 2021-01-03
3 | 2021-01-08
4 | 2021-01-15

#### ``Table 2: subscriptions``
  
customer_id | plan_id | start_date
-- | -- | --
1 | 0 | 2020-08-01
1 | 1 | 2020-08-08
2 | 0 | 2020-09-20
2 | 3 | 2020-09-27
11 | 0 | 2020-11-19
11 | 4 | 2020-11-26
13 | 0 | 2020-12-15
13 | 1 | 2020-12-22
13 | 2 | 2021-03-29
15 | 0 | 2020-03-17
15 | 2 | 2020-03-24
15 | 4 | 2020-04-29
16 | 0 | 2020-05-31
16 | 1 | 2020-06-07
16 | 3 | 2020-10-21
18 | 0 | 2020-07-06
18 | 2 | 2020-07-13
19 | 0 | 2020-06-22
19 | 2 | 2020-06-29
19 | 3 | 2020-08-29

  
#### ``Table 3: members``
customer_id |	join_date
  -- | --
A	| 2021-01-07
B	| 2021-01-09

***

  
  ## Case Study Questions
Each of the following case study questions can be answered using a single SQL statement:

1. What is the total amount each customer spent at the restaurant?
2. How many days has each customer visited the restaurant?
3. What was the first item from the menu purchased by each customer?
4. What is the most purchased item on the menu and how many times was it purchased by all customers?
5. Which item was the most popular for each customer?
6. Which item was purchased first by the customer after they became a member?
7. Which item was purchased just before the customer became a member?
8. What is the total items and amount spent for each member before they became a member?
9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
  
  
## Bonus Questions
#### Join All The Things
  The following questions are related creating basic data tables that Danny and his team can use to quickly derive insights without needing to join the underlying tables using SQL.

Recreate the following table output using the available data:

customer_id	| order_date	| product_name	| price	| member
  -- | -- | -- | -- | --
A	| 2021-01-01	| curry	| 15	| N
A	| 2021-01-01	| sushi	| 10	| N
A	| 2021-01-07	| curry	| 15	| Y
A	| 2021-01-10	| ramen	| 12	| Y
A	| 2021-01-11	| ramen	| 12	| Y
A	| 2021-01-11	| ramen	| 12	| Y
B	| 2021-01-01	| curry	| 15	| N
B	| 2021-01-02	| curry	| 15	| N
B	| 2021-01-04	| sushi	| 10	| N
B	| 2021-01-11	| sushi	| 10	| Y
B	| 2021-01-16	| ramen	| 12	| Y
B	| 2021-02-01	| ramen	| 12	| Y
C	| 2021-01-01	| ramen	| 12	| N
C	| 2021-01-01	| ramen	| 12	| N
C	| 2021-01-07	| ramen	| 12	| N

  
  #### Rank All The Things
Danny also requires further information about the ranking of customer products, but he purposely does not need the ranking for non-member purchases so he expects null ranking values for the records when customers are not yet part of the loyalty program.

customer_id	| order_date	| product_name	| price	| member | ranking
  -- | -- | -- | -- | -- | --
A	| 2021-01-01	| curry	| 15	| N | null
A	| 2021-01-01	| sushi	| 10	| N | null
A	| 2021-01-07	| curry	| 15	| Y | 1
A	| 2021-01-10	| ramen	| 12	| Y | 2
A	| 2021-01-11	| ramen	| 12	| Y | 3
A	| 2021-01-11	| ramen	| 12	| Y | 3
B	| 2021-01-01	| curry	| 15	| N | null
B	| 2021-01-02	| curry	| 15	| N | null
B	| 2021-01-04	| sushi	| 10	| N | null
B	| 2021-01-11	| sushi	| 10	| Y | 1 
B	| 2021-01-16	| ramen	| 12	| Y | 2 
B	| 2021-02-01	| ramen	| 12	| Y | 3
C	| 2021-01-01	| ramen	| 12	| N | null
C	| 2021-01-01	| ramen	| 12	| N | null
C	| 2021-01-07	| ramen	| 12	| N | null 
  
