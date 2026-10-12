# Write your MySQL query statement below
with filtered_stadium as ( select id , visit_date , people ,
 id - Row_Number() over (order by id ) as  grp  from stadium where 
people >= 100 )
select id , visit_date , people from filtered_stadium where grp in ( select grp from filtered_stadium group by grp having count(*) >= 3 )
order by visit_date ;