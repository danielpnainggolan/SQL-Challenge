# <p align="center" style="margin-top: 0px;">Case Study #2 - Pizza Runner
  
  ***

## Business Case

Danny was scrolling through his Instagram feed when something really caught his eye - “80s Retro Styling and Pizza Is The Future!”

Danny was sold on the idea, but he knew that pizza alone was not going to help him get seed funding to expand his new Pizza Empire - so he had one more genius idea to combine with it - he was going to Uberize it - and so Pizza Runner was launched!

Danny started by recruiting “runners” to deliver fresh pizza from Pizza Runner Headquarters (otherwise known as Danny’s house) and also maxed out his credit card to pay freelance developers to build a mobile app to accept orders from customers.
  
***
## Entity Relationship Diagram
<p align="center" style="margin-bottom: 0px !important;">
  <img src="https://user-images.githubusercontent.com/43850912/143775164-d5ce6601-55a1-4002-ad76-bac0bffc0fb9.png">

***
  
  
## Tables
#### ``Table 1: runners``
runner_id | registration_date
-- | --
1 | 2021-01-01
2 | 2021-01-03
3 | 2021-01-08
4 | 2021-01-15

#### ``Table 2: customer_orders``
order_id | customer_id | pizza_id | exclusions | extras | order_time
-- | -- | -- | -- | -- | --
1 | 101 | 1 |   |   | 2021-01-01 18:05:02
2 | 101 | 1 |   |   | 2021-01-01 19:00:52
3 | 102 | 1 |   |   | 2021-01-02 23:51:23
3 | 102 | 2 |   | NaN | 2021-01-02 23:51:23
4 | 103 | 1 | 4 |   | 2021-01-04 13:23:46
4 | 103 | 1 | 4 |   | 2021-01-04 13:23:46
4 | 103 | 2 | 4 |   | 2021-01-04 13:23:46
5 | 104 | 1 | null | 1 | 2021-01-08 21:00:29
6 | 101 | 2 | null | null | 2021-01-08 21:03:13
7 | 105 | 2 | null | 1 | 2021-01-08 21:20:29
8 | 102 | 1 | null | null | 2021-01-09 23:54:33
9 | 103 | 1 | 4 | 1, 5 | 2021-01-10 11:22:59
10 | 104 | 1 | null | null | 2021-01-11 18:34:49
10 | 104 | 1 | 2, 6 | 1, 4 | 2021-01-11 18:34:49

#### ``Table 3: runner_orders``
order_id | runner_id | pickup_time | distance | duration | cancellation
-- | -- | -- | -- | -- | --
1 | 1 | 2021-01-01 18:15:34 | 20km | 32 minutes |  
2 | 1 | 2021-01-01 19:10:54 | 20km | 27 minutes |  
3 | 1 | 2021-01-03 00:12:37 | 13.4km | 20 mins | NaN
4 | 2 | 2021-01-04 13:53:03 | 23.4 | 40 | NaN
5 | 3 | 2021-01-08 21:10:57 | 10 | 15 | NaN
6 | 3 | null | null | null | Restaurant Cancellation
7 | 2 | 2020-01-08 21:30:45 | 25km | 25mins | null
8 | 2 | 2020-01-10 00:15:02 | 23.4 km | 15 minute | null
9 | 2 | null | null | null | Customer Cancellation
10 | 1 | 2020-01-11 18:50:20 | 10km | 10minutes | null

#### ``Table 4: pizza_names``
pizza_id | pizza_name
-- | --
1 | Meat Lovers
2 | Vegetarian

#### ``Table 5: pizza_recipes``
pizza_id | toppings
-- | --
1 | 1, 2, 3, 4, 5, 6, 8, 10
2 | 4, 6, 7, 9, 11, 12

#### ``Table 6: pizza_toppings``
topping_id | topping_name
-- | --
1 | Bacon
2 | BBQ Sauce
3 | Beef
4 | Cheese
5 | Chicken
6 | Mushrooms
7 | Onions
8 | Pepperoni
9 | Peppers
10 | Salami
11 | Tomatoes
12 | Tomato Sauce

***
  
  
## Case Study Questions
#### A. Pizza Metrics
1. How many pizzas were ordered?
2. How many unique customer orders were made?
3. How many successful orders were delivered by each runner?
4. How many of each type of pizza was delivered?
5. How many Vegetarian and Meatlovers were ordered by each customer?
6. What was the maximum number of pizzas delivered in a single order?
7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
8. How many pizzas were delivered that had both exclusions and extras?
9. What was the total volume of pizzas ordered for each hour of the day?
10. What was the volume of orders for each day of the week?


#### B. Runner and Customer Experience
1. How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?
3. Is there any relationship between the number of pizzas and how long the order takes to prepare?
4. What was the average distance travelled for each customer?
5. What was the difference between the longest and shortest delivery times for all orders?
6. What was the average speed for each runner for each delivery and do you notice any trend for these values?
7. What is the successful delivery percentage for each runner?
  
  
#### C. Ingredient Optimisation
1. What are the standard ingredients for each pizza?
2. What was the most commonly added extra?
3. What was the most common exclusion?
4. Generate an order item for each record in the customers_orders table in the format of one of the following:
    - Meat Lovers
    - Meat Lovers - Exclude Beef
    - Meat Lovers - Extra Bacon
    - Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers
5. Generate an alphabetically ordered comma separated ingredient list for each pizza order from the customer_orders table and add a 2x in front of any relevant ingredients
    - For example: "Meat Lovers: 2xBacon, Beef, ... , Salami"
6. What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?
  

#### D. Pricing and Ratings
1. If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes - how much money has Pizza Runner made so far if there are no delivery fees?
2. What if there was an additional $1 charge for any pizza extras?
Add cheese is $1 extra
3. The Pizza Runner team now wants to add an additional ratings system that allows customers to rate their runner, how would you design an additional table for this new dataset - generate a schema for this new table and insert your own data for ratings for each successful customer order between 1 to 5.
4. Using your newly generated table - can you join all of the information together to form a table which has the following information for successful deliveries?
    - customer_id
    - order_id
    - runner_id
    - rating
    - order_time
    - pickup_time
    - Time between order and pickup
    - Delivery duration
    - Average speed
    - Total number of pizzas
5. If a Meat Lovers pizza was $12 and Vegetarian $10 fixed prices with no cost for extras and each runner is paid $0.30 per kilometre traveled - how much money does Pizza Runner have left over after these deliveries?
