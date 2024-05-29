--ex1--
SELECT 
sum(case 
when device_type='laptop' then 1 else 0
end) as laptop_views,
sum(CASE
when device_type in ('tablet','phone') then 1 else 0
end) as mobile_views
FROM viewership
--ex2--
select x,y,z,
case
when (x+y)>z and (x+z)>y and (z+y)>x then 'Yes' else 'No'
end as triangle
from triangle
--ex3--
 with uncategorised_callers as (select count(case_id) as uncategorised_calls from callers
where call_category	is null or call_category	='n/a')
select cast(100.0*uncategorised_calls/
(select count(*) from callers) as decimal(10,1)) 
from uncategorised_callers
--ex4--
select name from customer 
where referee_id <>2 or referee_id is null
--ex5--
select survived,
sum(case
when pclass='1'  then 1 else 0
end) as first_class,
sum(case
when pclass='2' then 1 else 0
end) as second_class,
sum(case
when pclass='3' then 1 else 0
end) as thrid_class
from titanic
group by survived
