
with cte as(
select category, round(avg(review_rating),1) as avg_rate
from customer_info
where Review_Rating is not null
group by Category
)

update customer_info
set review_rating = (select avg_rate from cte where customer_info.Category = cte.Category)
where review_rating is null;

go

if col_length('customer_info', 'Promo_code_used') IS NOT NULL
begin
    alter table customer_info 
    drop column Promo_code_used;
end;                 -- drop the column same as discount_appiled


go 
if col_length('customer_info', 'age_category') IS NULL
begin
alter table customer_info
add age_category as (
case when age>= 18 and age <= 35 then 'Young Adult'
		when age > 35 and age <=45 then 'Adult'
		when age >45 and age <=55 then 'Middle-aged'
		else 'Senior'
		end )
end

if col_length('customer_info', 'FoP_days') IS  NULL
begin
alter table customer_info
add FoP_days as(
case Frequency_of_Purchases 
when 'Every 3 Months' then 90
when 'Monthly' then 30
when 'Quarterly' then 90
when 'Annually' then 365
when 'Fortnightly' then 14
when 'Bi-Weekly' then 14
when 'Weekly' then 7
else 0
end 
)
end
