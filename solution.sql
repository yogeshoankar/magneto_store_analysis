SELECT * FROM superstore;

# 1Q. What are total sales and total profits of each year?

select year,sum(sales)as sales,sum(profit)as profit from superstore
group by year;

# 2. What are the total profits and total sales per quarter?

select year,
case 
when month in (1,2,3) then "Q1"
when month in (4,5,6) then "Q2"
when month in (7,8,9) then "Q3"
when month in (10,11,12) then "Q4"
end as Quarter,sum(sales)as sales,sum(profit) as profit
from superstore
group by year,Quarter
order by year;

select
case 
when month in (1,2,3) then "Q1"
when month in (4,5,6) then "Q2"
when month in (7,8,9) then "Q3"
when month in (10,11,12) then "Q4"
end as Quarter,sum(sales)as sales,sum(profit) as profit
from superstore
group by Quarter
order by quarter;

# 3. What region generates the highest sales and profits ?

select region ,sum(sales)as sales,sum(profit)as profit from superstore
group by region
order by sales desc,profit desc;

-- Let’s observe each regions profit margins for further analysis with the following code:

select region,(sum(profit)/sum(sales))*100 as profit_margin from superstore
group by region
order by profit_margin desc;

# Q4. 4. What state and city brings in the highest sales and profits ?

-- top 10 profitable state;
select state,sum(sales)as sales,sum(profit)as profit from superstore
group by state
order by profit desc
limit 10;

-- 10 low profitable state;
select state,sum(sales)as sales,sum(profit)as profit from superstore
group by state
order by profit asc
limit 10;

-- for top 10 profitable city;
select city,sum(sales)as sales,sum(profit)as profit from superstore
group by city
order by profit desc
limit 10;

-- for 10 low profitable city;
select city,sum(sales)as sales,sum(profit)as profit from superstore
group by city
order by profit asc
limit 10;


# Q5. 5. The relationship between discount and sales and the total discount per category;
select  discount,avg(sales)as avg_sales from superstore
group by discount
order by discount;

-- total discount per category;
select  category,sum(discount)as total_discount from superstore
group by category
order by category;

-- what type of products are the most discounted.
select category,`sub-category`,sum(discount)as discount from superstore
group by category,`sub-category`
order by discount desc;

# 6. What category generates the highest sales and profits in each region and state ?
-- top 10 profitable regions;
select region,category,sum(sales)as sales,sum(profit)as profit from superstore
group by region,category
order by profit desc
limit 10;

-- 10 low profitable regions;
select region,category,sum(sales)as sales,sum(profit)as profit from superstore
group by region,category
order by profit asc
limit 10;

-- top 10 prifitable states;
select state,category,sum(sales)as sales,sum(profit)as profit from superstore
group by state,category
order by profit desc
limit 10;

-- 10 low profitable states;
select state,category,sum(sales)as sales,sum(profit)as profit from superstore
group by state,category
order by profit asc
limit 10;

# 7. What subcategory generates the highest sales and profits in each region and state ?

-- top 10 sub-category in region;
select region,`sub-category`,sum(sales)as sales,sum(profit) as profit from superstore
group by region,`sub-category` 
order by profit desc
limit 10;

-- 10 low sub-category in region;
select region,`sub-category`,sum(sales)as sales,sum(profit) as profit from superstore
group by region,`sub-category` 
order by profit asc
limit 10;

-- top 10 sub-category in state;
select state,`sub-category`,sum(sales)as sales,sum(profit) as profit from superstore
group by state,`sub-category` 
order by profit desc
limit 10;

-- 10 low 10 sub-category in state;
select state,`sub-category`,sum(sales)as sales,sum(profit) as profit from superstore
group by state,`sub-category` 
order by profit asc
limit 10;

# 8. What are the names of the products that are the most and least profitable to us?

-- top 10 most profitabe product name;
select `product name`,sum(sales),sum(profit)as profit from superstore
group by `product name`
order by profit desc
limit 10;

-- 10 low profitable product name;
select `product name`,sum(sales),sum(profit)as profit from superstore
group by `product name`
order by profit asc
limit 10;

# 9. What segment makes the most of our profits and sales ?

select segment,sum(profit)as profit from superstore
group by segment
order by profit desc;

# 10. How many customers do we have (unique customer IDs) in total and how much per region and state?

-- total customer ids;
select count(distinct(`customer id`))as customer_id from superstore;

-- total customer ids by region;
select region,count(distinct(`customer id`))as customer_id from superstore
group by region
order by customer_id desc;

-- total customer ids by state;
select state,count(distinct(`customer id`))as customer_id from superstore
group by state
order by customer_id desc;

# 11. Customer rewards program;
select `customer id`,`Customer Name`,sum(sales)as sales,sum(Profit)as profit from superstore
group by `customer id`,`Customer name`
order by Profit desc;

# 12. Average shipping time per class and in total;

select round(avg(avg_ship_time),1) from superstore;

-- The shipping time in each shipping mode is;
select `ship mode`,round(avg(avg_ship_time))as avg_time from superstore
group by `ship mode`
order by avg_time desc;



