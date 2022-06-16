select * from   light;
load data infile 
'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\light.csv'
ignore INTO TABLE light
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
(id_equipment,`type`);
select sum(a.profit) as profit from advertising as a
join release_to_advertising as rta on rta.id_advertising=a.id_advertising  
join `release` as r on r.idrelease=rta.id_release
join `schedule` as s on s.id_release=r.idrelease
where s.broadcast_date between 20220401 and 20220430;
create index idx_advertising_profit on advertising(profit);
select * from `release` as r
join broadcast as b on b.id_broadcast=r.id_broadcast
join producer as p on p.id_producer=r.id_producer
group by b.`name`
having year_of_creation>2000
order by year_of_creation desc limit 5;
create index idx_broadcast on broadcast(`name`);
select p.*,l.*,o.* from `leading` as l
join release_to_leading as rtl on rtl.id_leading=l.id_leading
join `release` as r on r.idrelease=rtl.id_release
join release_to_operator as rto on rto.id_release=r.idrelease
join operator as o on o.id_operator=rto.id_operator
join producer as p on p.id_producer=r.id_producer
group by p.full_name
having p.age>40 and o.age>40 and l.age>40
order by p.id_producer desc;
create index idx_age_producer on producer(full_name,age);
create index idx_age_operator on operator(age);
create index idx_age_leading on `leading`(age);
select u.*, count(r.theme),b.* from `user` as u
join release_to_user as rtu on u.id_user=rtu.id_user
join `release` as r on r.idrelease=rtu.id_release
join broadcast as b on b.id_broadcast=r.id_broadcast
group by u.`name`
having u.mail like "%mail%"
order by  count(r.theme) asc;
create index idx_mail_user on `user`(mail);
select g.*,b.year_of_creation from `release` as r
join broadcast as b on b.id_broadcast=r.id_broadcast
join broadcast_to_genre as btg on btg.id_broadcast=b.id_broadcast
join genre as g on g.id_genre=btg.id_genre
group by g.`name`
having year_of_creation<2000
order by year_of_creation asc;
create index idx_broadcast_year on broadcast(year_of_creation);
create index idx_genre_name on genre(`name`);
-- Функции
select `password`,if(length(`password`)>10,'Хороший пароль','Плохой пароль') from `user`;
select r.`name`, case
when `number`<5 and `number`>0 then 'Мало оборудования'
when `number`>5 and `number`<10 then 'Достаточно оборудования'
when `number`>10 then 'Много оборудования'
else 'Нет оборудования'
end as Category
from release_to_equipment as rte
join `release` as r on rte.id_release=r.idrelease;
select full_name, IFNULL(phone_number, 'не определен') AS Phone from `leading`;
-- Процедуры
DELIMITER $$
CREATE PROCEDURE name_broadcast(broadcast int)
BEGIN
select `name` from broadcast
where id_broadcast=broadcast;
END$$
DELIMITER ;
call name_broadcast(3);
DELIMITER $$
CREATE PROCEDURE work_to_release(`release` int)
BEGIN
select r.`name`,p.full_name,l.full_name,o.full_name from `release` as r
join producer as p on p.id_producer=r.id_producer
join release_to_leading as rts on rts.id_release=r.idrelease
join `leading` as l on rts.id_leading=l.id_leading
join release_to_operator as rto on rto.id_release=r.idrelease
join operator as o on rto.id_operator=o.id_operator
where r.idrelease=`release`;
END$$
DELIMITER ;
call work_to_release(1);
DELIMITER $$
CREATE PROCEDURE old_release(date_release int)
BEGIN
select r.*, s.broadcast_date from `release` as r
join `schedule` as s on s.id_release=r.idrelease
group by r.theme
having year(s.broadcast_date)<date_release;
END$$
DELIMITER ;
call old_release(2020);
-- Представления
create view advertising_and_release
as 
select r.`name`, a.theme from advertising as a
right join release_to_advertising as rta on rta.id_advertising=a.id_advertising
right join `release` as r on r.idrelease=rta.id_release; 
select * from advertising_and_release;
create view release_and_leading
as 
select r.`name`, l.full_name,l.age from `leading` as l
join release_to_leading as rtl on rtl.id_leading=l.id_leading
join `release` as r on r.idrelease=rtl.id_release
;
select * from release_and_leading;
create view equipment_and_light
as 
select e.brand, l.`type` from equipment as e
left join light as l on e.id_equipment=l.id_equipment;
SHOW FULL TABLES IN `channel` WHERE TABLE_TYPE LIKE 'VIEW';
select * from equipment_and_light;
-- Триггер
DELIMITER //
CREATE TRIGGER before_delete_schedule
BEFORE DELETE ON `release` FOR EACH ROW
BEGIN
DELETE FROM `schedule`  WHERE id_release=old.idrelease;
END;//
DELIMITER ;
select * from `release`;