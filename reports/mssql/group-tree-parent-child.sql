/* groups: PARENT --> CHILD traversal */
declare @group nvarchar(1024) = 'Loans & Advances (Asset)';
with cte as
(
 select name, parent from mst_group where name = @group
 union all
 select e.name, e.parent from mst_group e inner join cte on cte.name = e.parent
)
select * from cte;