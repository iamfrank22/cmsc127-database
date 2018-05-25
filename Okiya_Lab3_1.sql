use petdbase;

select * from pet;
-- 1
select count(ID) as 'No of Registered Pets' from pet;

-- 2
select Owner, count(*) as 'Number of Pets'
from pet 
group by Owner;


-- 3
select Owner, specie, count(*) as 'Number of Pet Type'
from pet 
group by owner, specie;

-- 4
select name, 
(year(curdate()) - year(birthday)) 
- (right(curdate(), 5) < right(birthday, 5))
as Age
from pet where death is null order by age;

-- 5
select pet.Name
from pet
where ID not in (select PetID from event)
group by pet.Name

-- 6
select pet.Name, count(*) as 'Number of Check-ups'
from pet
inner join event on pet.ID = event.PetID
group by pet.Name;
