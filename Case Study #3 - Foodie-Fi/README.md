# <p align="center" style="margin-top: 0px;">Case Study #3 - Foodie-Fi
  
  ***

## Business Case

Subscription based businesses are super popular and Danny realised that there was a large gap in the market - he wanted to create a new streaming service that only had food related content - something like Netflix but with only cooking shows!

Danny finds a few smart friends to launch his new startup Foodie-Fi in 2020 and started selling monthly and annual subscriptions, giving their customers unlimited on-demand access to exclusive food videos from around the world!

Danny created Foodie-Fi with a data driven mindset and wanted to ensure all future investment decisions and new features were decided using data. This case study focuses on using subscription style digital data to answer important business questions.
  
***
    
## Entity Relationship Diagram
<p align="center" style="margin-bottom: 0px !important;">
  <img src="https://user-images.githubusercontent.com/43850912/143993105-c30ab129-8a50-4788-aaf7-9e6fb2e830d8.png">

***
  

 #### ``Table 1: plans``
plan_id | plan_name | price
-- | -- | --
0 | trial | 0
1 | basic monthly | 9.90
2 | pro monthly | 19.90
3 | pro annual | 199
4 | churn | null

#### ``Table 2: subscriptions``
*Note: this is only customer sample*
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


***
  
  
## Case Study Questions
#### A. Customer Journey
Based off the 8 sample customers provided in the sample from the subscriptions table, write a brief description about each customer’s onboarding journey.

Try to keep it as short as possible - you may also want to run some sort of join to make your explanations a bit easier!
  

#### B. Data Analysis Questions
1. How many customers has Foodie-Fi ever had?
2. What is the monthly distribution of trial plan start_date values for our dataset - use the start of the month as the group by value
3. What plan start_date values occur after the year 2020 for our dataset? Show the breakdown by count of events for each plan_name
4. What is the customer count and percentage of customers who have churned rounded to 1 decimal place?
5. How many customers have churned straight after their initial free trial - what percentage is this rounded to the nearest whole number?
6. What is the number and percentage of customer plans after their initial free trial?
7. What is the customer count and percentage breakdown of all 5 plan_name values at 2020-12-31?
8. How many customers have upgraded to an annual plan in 2020?
9. How many days on average does it take for a customer to an annual plan from the day they join Foodie-Fi?
10. Can you further breakdown this average value into 30 day periods (i.e. 0-30 days, 31-60 days etc)
11. How many customers downgraded from a pro monthly to a basic monthly plan in 2020?
  
  
 #### C. Challenge Payment Question
