-- The Query aim to get table with 4 columns 
-- cohort month , cohort size , month number in the relation of the
-- cohort month and percentage of customer retention of that month 

-- Separate the users depending of the product line (Restaurant)
with firsrest as (select * from first_purchases$ where product_line='Restaurant')
,rest as (select * from purchases$ where product_line='Restaurant')

, cohort_items as (
  select 
    convert(date, first_purchase_date,4) as cohort_month, user_id
  from firsrest   

)
,user_activities  as (select A.user_id,datediff(month,c.cohort_month,convert(date, A.purchase_date,4)) as month_number
from rest A left join cohort_items as c on A.user_id=c.user_id 
group by A.user_id, datediff(month,c.cohort_month,convert(date, A.purchase_date,4))
)
, cohort_size as (
  select Month(cohort_month)as m, count(user_id) as num_users
  from cohort_items
  group by Month(cohort_month)
), retention_table as (
  select
    Month(C.cohort_month) as m,
    A.month_number,
    count(A.month_number) as num_users
  from user_activities A
  left join cohort_items C ON A.user_id = C.user_id
  group by Month(C.cohort_month),  A.month_number
)select
  B.m,
  S.num_users as total_users,
  B.month_number,
  cast(B.num_users as float) * 100 / S.num_users as percentage

from retention_table B
left join cohort_size S ON B.m = S.m
where B.m is not null and B.month_number <> 0
order by 1, 3