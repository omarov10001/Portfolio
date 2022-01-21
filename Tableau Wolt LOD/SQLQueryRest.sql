select user_id,first_purchase_date  from first_purchases$ where product_line='Restaurant' union all 
select user_id,purchase_date from purchases$ 
where product_line='Restaurant'
order by 1

