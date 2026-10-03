CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
    select distinct salary 
    from( select salary , DENSE_RANK() over (order by salary desc ) as rnk from Employee  )
    temp 
    where rnk = N 
  );
END