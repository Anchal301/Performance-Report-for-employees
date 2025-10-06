use AdventureWorks2022

select d.name,soh.salespersonId,
count(soh.salesorderID) as total_orders, sum(soh.totaldue) as 
total_sales from HumanResources.department as d
join sales.salesperson as sp on d.ModifiedDate = sp.ModifiedDate
join sales.SalesOrderHeader as soh on soh.ModifiedDate = sp.ModifiedDate
where year(soh.orderdate)=2011
group by d.Name,soh.SalesPersonID
order by total_sales desc

select p.firstname,p.lastname,p.title,soh.salespersonId,
count(soh.salesorderID) as total_orders, sum(soh.totaldue) as 
total_sales from person.Person as p
join sales.salesperson as sp on p.ModifiedDate = sp.ModifiedDate
join sales.SalesOrderHeader as soh on soh.ModifiedDate = sp.ModifiedDate
where year(soh.orderdate)=2012
group by p.FirstName,soh.SalesPersonID, p.LastName, p.Title
order by total_sales desc

select * from sales.SalesPerson
select * from HumanResources.Department
select * from sales.salesorderheader 
select * from HumanResources.Employee

select p.firstname,p.lastname,p.title,(select sum(soh.totaldue) from sales.SalesOrderHeader as soh 
where soh.ModifiedDate=sp.modifiedDate and YEAR(soh.OrderDate)=2011) as totalsales
from person.person as p join sales.SalesPerson as sp on p.ModifiedDate=sp.ModifiedDate

select top 5 p.firstname,p.lastname,p.title,(select sum(soh.totaldue) from sales.SalesOrderHeader as soh 
where soh.ModifiedDate=sp.modifiedDate and YEAR(soh.OrderDate)=2011) as totalsales
from person.person as p join sales.SalesPerson as sp on p.ModifiedDate=sp.ModifiedDate

select p.firstname,p.lastname,p.title,(select sum(soh.totaldue) from sales.SalesOrderHeader as soh 
where soh.ModifiedDate=sp.modifiedDate and YEAR(soh.OrderDate)=2011) as totalsales
from person.person as p join sales.SalesPerson as sp on p.ModifiedDate=sp.ModifiedDate
order by FirstName desc
offset 10 rows
fetch next 10 rows only


select p.firstname,p.lastname,p.title,(select sum(soh.totaldue) from sales.SalesOrderHeader as soh 
where soh.ModifiedDate=sp.modifiedDate and YEAR(soh.OrderDate)=2011) as totalsales
from person.person as p join sales.SalesPerson as sp on p.ModifiedDate=sp.ModifiedDate
order by FirstName desc
offset 0 rows
fetch next 10 rows only