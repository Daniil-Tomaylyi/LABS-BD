-- Функциональные  требования:
-- Оперативные:
-- Показать кто работает на выпуске
select r.`name`,p.full_name,l.full_name,o.full_name from `release` as r
join producer as p on p.id_producer=r.id_producer
join release_to_leading as rts on rts.id_release=r.idrelease
join `leading` as l on rts.id_leading=l.id_leading
join release_to_operator as rto on rto.id_release=r.idrelease
join operator as o on rto.id_operator=o.id_operator
where r.idrelease=1;
-- Показать телепередачу
select `name` from broadcast
where id_broadcast=5;
-- Показать расписание выпусков
select  `name`,broadcast_time,broadcast_date from `release` as r
join `schedule` as s
on s.id_release=r.idrelease;
-- Показать оборудование на выпуске
select r.`name`, e.brand from `release` as r
join release_to_equipment as rte on rte.id_release=r.idrelease 
join equipment as e on e.id_equipment=rte.id_equipment
where r.idrelease=1;
-- Показать жанр передачи
select b.`name`,g.`name` from broadcast as b
join broadcast_to_genre as btg on btg.id_broadcast=b.id_broadcast 
join genre as g on g.id_genre=btg.id_genre
where  b.id_broadcast=6;
-- Аналитические:
-- Показать сколько посетителей используют сайт каждый день
select sum(rtu.`number`) as site_users from `user` as u
join release_to_user as rtu on rtu.id_user=u.id_user
join `release` as r on r.idrelease=rtu.id_release;
-- Показать прибыль за последний месяц по рекламе
select a.profit,s.broadcast_date from advertising as a
join release_to_advertising as rta on rta.id_advertising=a.id_advertising  
join `release` as r on r.idrelease=rta.id_release
join `schedule` as s on s.id_release=r.idrelease
where s.broadcast_date between 20220401 and 20220430;
select * from `schedule`; 
-- Показать какие выпуски чаще смотрят !!!
select r.`name`, sum(rtu.`number`) as most_views from `user` as u
join release_to_user as rtu on rtu.id_user=u.id_user 
join `release` as r on r.idrelease=rtu.id_release
group by r.`name`
order by rtu.`number` desc limit 1;
-- Показать сколько посетителей на сайте
select count(id_user) as count_user from `user`;
-- Показать какие выпуски смотрят реже всего
select r.`name`, sum(rtu.`number`) as least_views from `user` as u
join release_to_user as rtu on rtu.id_user=u.id_user
join `release` as r on r.idrelease=rtu.id_release
group by r.`name`
order by rtu.`number` asc limit 1;
-- UPDATE в разных таблицах, с WHERE
-- Изменение прибыли и продолжительности по рекламе для бренда Dove
update advertising
set duration = 000100, profit=15000
where id_advertising = 8;
-- Изменение время и даты начала выпуска 2 
update `schedule`
set broadcast_time=170000, broadcast_date=20220127
where id_release=2;
-- Изменение пароля пользователя 8
update `user`
set `password`= "asdsa321"
where id_user=8;
-- Изменение зарплаты оператора 8
update operator
set salary=25000
where id_operator=8;
-- Изменение зарплаты ведущего 7
update `leading`
set salary=150000
where id_leading=7;
-- изменение зарплаты режисера 6
update producer
set salary=80000
where id_producer=6;
-- DELETE в разных таблицах
select * from advertising;
-- Удалить жанр Теленовела
delete from genre 
where `name`="Теленовелла";
-- Удалить пользователя Ксения и связь между выпуском и пользователем для пользователя Ксения
delete from release_to_user 
where id_user=10;
delete from `user`
where `name`="Ксения";
-- Удалить рекламу 	Coca-cola  ии её связь с выпуском 
delete from release_to_advertising
where id_advertising=1;
delete from advertising
where theme="Coca-cola";
-- SELECT, DISTINCT, WHERE, AND/OR/NOT, IN, BETWEEN, различная работа с датами и числами, преобразование данных, IS NULL, AS для таблиц и столбцов и др. в различных вариациях
-- SElECT
Select theme from advertising;
select age,salary from producer;
-- DISTINCT 
select distinct resolution from camera;
-- WHERE
select * from advertising 
where duration>000200;
select * from equipment
where price=75000;
select `name`,mail from `user`
where `password`>=10;
select id_user,id_release from release_to_user
where `number` <=6;
-- AND/OR/NOT
select * from `leading`
where salary>130000
and age<50;
select full_name from producer
where salary>400000
or age<30;
select Brand from equipment
where not price<40000;
-- IN
select * from equipment
where price in(30000,75000);
-- BETWEEN
select * from operator
where age between 30 and 40;
-- as 
select broadcast_time as t,broadcast_date as d from `schedule`;
-- is null 
select e.brand, l.`type` from equipment as e
left join light as l on e.id_equipment=l.id_equipment
where l.`type` is not null;
-- is not null
select r.`name`, a.theme from advertising as a
right join release_to_advertising as rta on rta.id_advertising=a.id_advertising
right join `release` as r on r.idrelease=rta.id_release
where a.theme is null; 
-- LIKE и другая работа со строками
select * from `leading`
where full_name like '%о%';
select * from operator
where full_name like 'Макс_________';
select full_name from producer
where full_name like 'Иван%';
select `name`,theme from `release`
where theme like '_%р';
select `name`,`description` from broadcast 
where `name` like 'В%';
select concat_ws('- это ',b.`name`,b.`description`)
from broadcast as b
where b.`name` like concat('%','вор','%');
select `name` from `user` as u
where u.mail like concat('%','d','%');
-- SELECT INTO или INSERT SELECT, что поддерживается СУБД
create table `new`(
	id_new int not null auto_increment primary key,
    copy_name varchar(100)
); 
insert into `new`(copy_name)
select `name` from `release`;
insert into `new`(copy_name)
select `name` from broadcast as b
where b.year_of_creation>2015;
insert into `new`(copy_name)
select full_name from `leading`;
select * from `new`;
drop table `new`;
-- JOIN: INNER, OUTER (LEFT, RIGHT, FULL), CROSS, NATURAL, разных, в различных вариациях, несколько запросов с более, чем одним JOIN 
-- JOIN
select r.`name`, u.`name`,rtu.`number` from `release` as r
join release_to_user as rtu on rtu.id_release=r.idrelease
join `user` as u on u.id_user=rtu.id_user; 
select r.`name`,b.`name` from broadcast as b 
join `release` as r on r.id_broadcast=b.id_broadcast;
select r.`name`, p.full_name from producer as p
join `release` as r on r.id_producer=p.id_producer;
-- LEFT JOIN
select e.brand, l.`type` from equipment as e
left join light as l on e.id_equipment=l.id_equipment;
select e.price, c.resolution from equipment as e
left join camera as c on e.id_equipment=c.id_equipment; 
select m.frequency,m.noise_level,e.purchase_date from equipment as e
left join microphone as m on m.id_equipment=e.id_equipment;
select r.`name`, a.theme from advertising as a
--  RIGHT JOIN
right join release_to_advertising as rta on rta.id_advertising=a.id_advertising
right join `release` as r on r.idrelease=rta.id_release; 
insert into `schedule`(broadcast_time,broadcast_date,id_release) values
(210000,20220301,2),
(190000,20220305,6);
select s.broadcast_time,s.broadcast_date, r.`name` from `release` as r 
right join `schedule` as s on s.id_release=r.idrelease;
select b.`name`, g.`name` from broadcast as b
right join broadcast_to_genre as bto on bto.id_broadcast=b.id_broadcast
right join genre as g on g.id_genre=bto.id_genre;
select r.`name`, b.`name` from `release` as r
--  CROSS JOIN
cross join broadcast as b;
select r.`name`,o.full_name from operator as o
cross join `release` as r;
select e.Brand,c.* from equipment as e
cross join camera as c;
--  NATURAL JOIN
select r.`name`, p.full_name from `release` as r
natural join producer  as p;
select r.`name`,s.* from `release` as r
natural join `schedule`  as s;
select e.Brand,c.* from equipment as e
natural join camera as c;
-- GROUP BY (некоторые с HAVING), с LIMIT, ORDER BY (ASC|DESC) вместе с COUNT, MAX, MIN, SUM, AVG в различных вариациях, можно по отдельности
-- GROUP BY
select  m.noise_level,sum(m.frequency) from microphone as m
group by m.noise_level;
select l.`type`, count(*) from light as l
group by l.`type`;
select purchase_date, count(Brand)  from equipment
group by purchase_date;
-- GROUP BY  с LIMIT
select theme, count(profit) from advertising
group by theme limit 3;
select u.`name` , count(*) as count_name from `user` as u
group by `name` limit 3;
select o.full_name, count(*) from operator as o
group by o.age limit 3;
select * from genre as g
group by `name` 
order by `name` desc limit 3;
-- GROUP BY  с ORDER BY (ASC|DESC)
select c.resolution, avg(c.integrated_memory) from camera as c
group by c.resolution
order by c.resolution asc;
select s.broadcast_time, count(*) from `schedule` as s
group by s.broadcast_time
order by s.broadcast_time desc;
select  p.full_name,p.age from producer as p
group by p.age
order by p.full_name desc;
select  c.shooting_speed,count(c.resolution)from camera as c
group by c.shooting_speed
order by c.resolution desc;
-- GROUP BY  с having
select  salary, age from `leading`
group by salary
having avg(age)>31 and avg(age)<40
order by avg(age) asc;
select b.year_of_creation, count(*), GROUP_CONCAT(`name`)from broadcast as b
group by b.year_of_creation
having count(*)=2
order by b.year_of_creation desc;
select r.theme,count(*) from `release` as r
group by r.theme
having count(*)>3;
select e.Brand, avg(e.price) from equipment as e
group by e.Brand
having avg(e.price)<4000;
-- UNION, EXCEPT, INTERSECT, что поддерживается СУБД
select `name` from `release`
union
select `name`  from broadcast;
select age from operator
union all
select age  from producer;
select theme from advertising
union 
select theme from `release`;
select full_name, age, salary from `leading`
union all 
select full_name, age, salary from producer;
select full_name,phone_number from `leading`
union 
select full_name,phone_number from operator
union
select full_name,phone_number from producer;
-- Вложенные SELECT с GROUP BY, ALL, ANY, EXISTS
select full_name from `leading` 
where age>(
select max(age) from producer);
select l2.full_name, r.`name` from (
select max(salary) as salary from `leading` as l
) as max_salary
join `leading` as l2 on max_salary.salary=l2.salary
join release_to_leading as  rtl on l2.id_leading=rtl.id_leading
join `release` as r on r.idrelease=rtl.id_release;
select e1.Brand from equipment as e1
where e1.price>ALL(
select e2.price from equipment as e2
where e2.price>20000
and e2.price<80000
and e2.id_equipment<>e1.id_equipment
);
select * from producer as p
where p.salary<any(
select o.salary from operator as o
);
select r.`name` from `release` as r
where not exists(select * from producer as p where p.id_producer=r.id_producer );
select * from `release`;
-- GROUP_CONCAT и другие разнообразные функции SQL
select m.`type`,group_concat(m.frequency," и ", m.noise_level) as frequency_and_noise_level from microphone as m
group by m.`type`;
select rte.`number`, group_concat(rte.id_equipment,"-",rte.id_release) from release_to_equipment as rte
group by rte.`number`;
select group_concat("id ",rtu.id_user," = ", rtu.`number`," user") as `user - user number` from release_to_user as rtu
group by rtu.id_user;
-- Запросы с WITH
with cte_leading as(
 select * from `leading` as l
 where l.age>32 or l.salary<100000
)
select * from cte_leading as cl
order by cl.age asc;
with cte_user as (
select * from `user`
group by `name`
having length(`password`)<10
)
select * from cte_user as cu
where cu.`name` like "%сил%"; 
with cte_release as(
select r.`name`,r.theme from `release` as r
where theme like "Юм%" 
)
select * from cte_release;
-- Запросы со строковыми функциями СУБД, с функциями работы с датами временем (форматированием дат), с арифметическими функциями
select lower(r.theme) from `release` as r;
select length(u.`password`) as min_password from `user` as u
order by length(u.`password`) asc limit 1;
select locate("им",o.full_name) from operator as o
where locate("им",o.full_name)!=0; 
select left(o.full_name,5) from operator as o;
select year(l.birthday) from `leading` as l;
select datediff(CURDATE(),purchase_date) from equipment;
select btg.id_broadcast+btg.id_genre as sum_broadcast_to_genre from broadcast_to_genre as btg;
-- Сложные запросы, входящие в большинство групп выше, т.е. SELECT ... JOIN ... JOIN ... WHERE ... GROUP BY ... ORDER BY ... LIMIT ...
select * from `release` as r
join broadcast as b on b.id_broadcast=r.id_broadcast
join producer as p on p.id_producer=r.id_producer
group by b.`name`
having year_of_creation>2000
order by year_of_creation desc limit 5;
select p.*,l.*,o.* from `leading` as l
join release_to_leading as rtl on rtl.id_leading=l.id_leading
join `release` as r on r.idrelease=rtl.id_release
join release_to_operator as rto on rto.id_release=r.idrelease
join operator as o on o.id_operator=rto.id_operator
join producer as p on p.id_producer=r.id_producer
group by p.full_name
having p.age>40 and o.age>40 and l.age>40
order by p.id_producer desc;
select r.*, s.broadcast_date from `release` as r
join `schedule` as s on s.id_release=r.idrelease
group by r.theme
having year(s.broadcast_date)<2020
order by s.broadcast_date asc;
select u.*, count(r.theme),b.* from `user` as u
join release_to_user as rtu on u.id_user=rtu.id_user
join `release` as r on r.idrelease=rtu.id_release
join broadcast as b on b.id_broadcast=r.id_broadcast
group by u.`name`
having u.mail like "%mail%"
order by  count(r.theme) asc;
select g.*,b.year_of_creation from `release` as r
join broadcast as b on b.id_broadcast=r.id_broadcast
join broadcast_to_genre as btg on btg.id_broadcast=b.id_broadcast
join genre as g on g.id_genre=btg.id_genre
group by g.`name`
having year_of_creation<2000
order by year_of_creation asc;
-- Модификация
select g.*,count(r.idrelease) from `release` as r
join broadcast as b on b.id_broadcast=r.id_broadcast
join broadcast_to_genre as btg on btg.id_broadcast=b.id_broadcast
join genre as g on g.id_genre=btg.id_genre
group by g.`name`
order by count(r.idrelease) desc limit 3;
select r.`name`, l.full_name,l.age from `leading` as l
join release_to_leading as rtl on rtl.id_leading=l.id_leading
join `release` as r on r.idrelease=rtl.id_release
group by r.`name`
order by l.age limit 1;
select r.`name`, e.brand, m.frequency as micro_frequency, m.noise_level as micro_noise_level,m.`type` as micro_type,c.integrated_memory as cam_memory,c.resolution as cam_resolution,c.shooting_speed as cam_shot_speed,l.`type` as light_type 
from `release` as r
join release_to_equipment as rte on rte.id_release=r.idrelease 
join equipment as e on e.id_equipment=rte.id_equipment
left join microphone as m on m.id_equipment=e.id_equipment
left join camera as c on c.id_equipment=e.id_equipment
left join light as l on l.id_equipment=e.id_equipment
order by `name`;