select * from passenger 
--------------------------------------------------
--HANDLING MISSING VALUE
-----------------------------------------------------
select count(*) from passenger 
where age is null

declare @age_avg int
set @age_avg = (select round(avg(age),2)
from passenger
where age is not null  )
select @age_avg

update passenger 
set age = @age_avg 
where age is null 
-----------------------------------------------------------------------
select count(*) from passenger 
where embarked is null

select embarked , count(*) as count
from passenger 
where embarked is not null 
group by embarked 
order by count desc 

update passenger 
set embarked = 'S' 
where embarked is null 
-------------------------------------------------------------------------------
select count(*) from passenger 
where Ticket is null

alter table passenger 
add ticket2 varchar(255)

alter table passenger 
alter column ticket varchar(255) 

update passenger 
set ticket = 'Unkown' 
where ticket is null 

update passenger 
set ticket2 = case 
                when ticket = 'unkown' then 0
                 else 1 END
---------------------------------------------------------------------
alter table passenger 
add cabin2 BIT

update passenger 
set cabin = 'unkown' 
where cabin is null 

update passenger 
set cabin2 = case 
              when cabin = 'unkown' then 0
			  else 1 END



