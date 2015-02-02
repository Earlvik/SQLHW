#Задание 1 
select organization_form 
from employer  
where  organization_form is not null 
order by organization_form desc;

#Задание 2
select count(*), organization_form 
from employer 
group by organization_form  
having count(*) > 3 
order by count desc;

#Задание 3
select t1.translation_id, t1.name,t1.site_id, t1.ui, t1.lang 
from translation t1 left join (select * from translation where lang = 'UA') t2 
on t1.name = t2.name and t1.site_id = t2.site_id 
where t1.lang = 'RU' and t2.name is null and t1.ui = true; 

#Задание 4. Таблицу заполнил случайными user_id
#update translation_history set user_id = ceil(random() * 50);

select th.name, th.user_id, min from translation_history th inner join
(select user_id, min(modification_time) as min 
from translation_history th inner join translation t 
on th.name = t.name and th.site_id = t.site_id 
where ui = true group by user_id) result
on th.user_id = result.user_id and th.modification_time = result.min
order by min
limit 10;
