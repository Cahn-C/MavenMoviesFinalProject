-- Question 1
select s.first_name as manager_first_name, s.last_name as manager_last_name, a.address, a.district, ci.city, co.country 
from staff s
join address a
on s.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country co
on ci.country_id = co.country_id;


-- Question 2
select i.store_id, i.inventory_id, f.title, f.rating, f.rental_rate, f.replacement_cost
from inventory i
join film f
on i.film_id = f.film_id;


-- Question 3
select f.rating, i.store_id, count(i.inventory_id) as number_of_items
from inventory i
join film f
on i.film_id = f.film_id
group by 1, 2
order by 2;


-- Question 4
select i.store_id, c.name, count(f.title) as films, avg(f.replacement_cost) as average_cost, sum(replacement_cost) as total_cost
from film f
join film_category fc
on f.film_id = fc.film_id
join inventory i
on i.film_id = f.film_id
join category c
on fc.category_id = c.category_id
group by 1, 2
order by 1;


-- Question 5
select c.first_name as customer_first_name, c.last_name customer_last_name, c.store_id, a.address, ci.city, co.country,
       case when c.active = 1 then 'active' else 'inactive' end as customer_status
from customer c
join address a
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country co
on ci.country_id = co.country_id;


-- Question 6
select c.first_name, c.last_name, count(p.rental_id) as rentals, sum(p.amount) as total_payments
from customer c
join payment p
on c.customer_id = p.customer_id
group by 1, 2
order by 4 desc;


-- Question 7
select 'investor' as type, first_name, last_name, company_name from investor
union
select 'advisor' as type, first_name, last_name, 'Not associated' from advisor;


-- Question 8
select case when awards = 'Emmy, Oscar, Tony ' then '3 awards'
	    when awards in ('Emmy, Oscar', 'Emmy, Tony', 'Oscar, Tony') then '2 awards'
            else '1 award'
       end as actor_awards,
       avg(case when actor_id is null then 0 else 1 end) as percentage_awards 
from actor_award
group by 1;
