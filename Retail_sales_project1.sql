-- sql retail sales analysis project.
-- by MD. TALHA MOBASHSHIR
create database sql_project_p2;

-- Firstly we will create a table.

CREATE TABLE retail_sales
              (
                 transaction_id int primary key,
				 sales_date date ,
               sale_time Time,
               customer_id int ,
               gender varchar(15),
               age int ,
               category varchar(15) ,
               quantity int ,
               price_per_unit float,
               cogs float , 
               total_sale float
              );
     -- checking transactional id is null or not         
    select * from retail_sales
    where transaction_id is null;
    
    -- -- checking all null values from the table
    
    
SELECT * FROM retail_sales
    WHERE 
    transaction_id IS NULL
    OR
    sales_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    
  -- DATA EXPLORATION   .
  -- How many Sales we have done?
select count(*) as total_sale from retail_sales;

-- How many  unique Costumers we have served to?
select count(distinct customer_id) as total_sale from retail_sales;

-- data analysis and business key problems & answers

-- Q. Write a SQL Query to retrieve all columns for sales made on '2022-11-05'

 select * from retail_sales 
 where sales_date = '2022-11-05' ;
 
 -- Q. Write a SQL Query to retrieve all transactions where the category is clothing and the quantity sold is more than 4
 
 select * from retail_sales
 where 
 category = 'Clothing'
and
quantity >=4

-- Q3. Write a sql query to calculate the total sales for each category

select category from retail_sale
sum(total_sale) as net sale


-- Q4. Write a sql query to find the average age of customers who purchased the beauty category.

SELECT
    ROUND(AVG(age), 2) as avg_age
FROM retail_sales
WHERE category = 'Beauty' selecct all the transactions 

-- Q5.select all the transactions where the total_sale is greater than 1000

select * from retail_sales where total_sale > 1000

-- Q6. write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category

SELECT 
    category,
    gender,
    COUNT(*) as total_trans
FROM retail_sales
GROUP 
    BY 
    category,
    gender
ORDER BY 1


-- Q.7 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT 
    customer_id,
    SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

-- Q.8 Write a SQL query to find the number of unique customers who purchased items from each category.


SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail_sales
GROUP BY category



-- Q.9 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

WITH hourly_sale
AS
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift

-- End of project













