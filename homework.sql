-- 1. List all customers who live in Texas (use
-- JOINs)

SELECT customer_id, district, address.address_id
FROM customer
INNER JOIN address
ON customer.customer_id = address.address_id
WHERE district = 'Texas'


SELECT * from address

SELECT * from customer

--customer_id 10,122,310,405,567

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name

SELECT first_name, last_name, amount, payment_id, customer.customer_id
from customer
INNER JOIN payment
on customer.customer_id = payment.customer_id
Where amount > 6.99

SELECT* from payment

-- Peter Menard

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
select first_name, last_name
from (
select first_name, last_name, amount
from payment
inner join customer
on customer.customer_id = payment.customer_id
) as pay
where amount > 175

--none

select * from payment
-- 4. List all customers that live in Nepal (use the city
-- table)

SELECT * from city where city like 'Nepal';

-- None

-- 5. Which staff member had the most
-- transactions?

SELECT * FROM rental

SELECT staff_id, count(staff_id)
from rental 
GROUP BY staff_id;

-- staff id 1 had the most transactions


-- 6. How many movies of each rating are
-- there?

SELECT rating, count(rating)
from film 
GROUP BY film.rating;


select * from film

-- NC-17 209, G 178, PG-13 223, PG 194, R 196

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)

select first_name, last_name
from (
select first_name, last_name, amount
from payment
INNER JOIN customer
on customer.customer_id = payment.customer_id
) as pay
where amount > 6.99

-- There are no customers who have made a single payment of 6.99 or higher 
--there is only one customer Peter Menard who has made 22 payments of 6.99 or higher

-- 8. How many free rentals did our store give away?

SELECT amount, payment_id
FROM payment
where amount < 0

--14574 was the amounts of refunds made = to free rental.