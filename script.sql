alter table cinema 
modify column rating float;
select * from cinema;
insert cinema (adress,number_of_halls,rating) values
('ул. им. Землячки, 110Б',7,4.5);
insert employee(first_name,adress,number_of_halls,rating,id_cinema) values
('Николай','ул. им. Землячки, 31',1,3.5,1);
insert producer(`name`,age) values
('Джон Уоттс',40);
insert film (`name`,id_producer) values
('Человек-паук: Нет пути домой',1);
insert `session`(`hall's_number`,time_and_date,id_cinema,id_film) values
('1',20211216163000,1,1);
select * from `session`;
insert customer(`name`,phone_number,Email) values
('Даниил','+79041232211','dan@mail.ru');
select * from customer;
insert ticket(place,id_session,id_employee,id_customer) values
(6,1,1,1);
insert review(grade,`comment`,id_film,id_customer) values
(8,'За прошедшие двадцать лет, с того момента, как на экранах стали появляться фильмы про Человека-паука, наверно у каждого зрителя был свой любимый исполнитель указанной роли. 
Для кого-то им был Тоби Магуайр, для кого-то перезапущенный “Удивительный Человек-паук” и именно Эндрю Гарфилд, да и нынешний Том Холланд уже уверенно собрал немалую фанатскую базу вокруг себя.
 А что же на счёт злодеев всей киновселенной Человека-паука? За прошедшую серию фильмов их было достаточно, и наверняка у каждого зрителя найдётся именно тот антагонист, что впечатлил именно его.
 А как вам идея того, что нынешний Марвел полностью слетит с катушек, и объединит это всё в одном фильме? Вот и мне подобное казалось нереальным ещё каких-то пару или тройку лет назад. 
 Но постепенно по мере производства “Нет пути домой” стали вырисовываться крайне интригующие детали будущего фильма, которые из разряда слухов перешли в разряд фактов, 
 и по идее, должны были подарить зрителю один из самых амбициозных фильмов про Человека-паука.
Сюжет “Нет пути домой” стартует сразу же после событий предыдущего фильма, в финале которого, буквально весь мир благодаря Мистерио узнал о том, что Человеком-пауком является Питер Паркер. 
С этого момент жизнь Питера и близких ему друзей меняется просто кардинально. Их везде преследуют репортёры, любознательные зеваки, безумные фанаты, и даже ненавистники. 
Всё в буквальном смысле рушится, а в полицейский участок Питер с друзьями ходит чуть-ли не как на учёбу. Возжелав прекратить это всё, 
Паркер идёт за помощью к своему соратнику по Мстителям - Доктору Стрэйнджу, который даже соглашается помочь в проблеме молодого человека. 
Только в дальнейшем это решение окажется слишком легкомысленным, не только для Питера, но и конечно же для самого Стрэйнджа, ведь они оба открывают двери в мультивселенную... 
Говоря немного выше о том, что “Нет пути домой” является амбициозным проектом, я немного слукавил, так как на деле, это самый стандартный кинокомикс от Марвел и Дисней. 
Да, он по-своему масштабный, где-то даже захватывающий, и явно лучше совершенно позорных “Капитана Марвел” или “Чёрной вдовы”. 
Хотя, по правде сказать, он лучше очень многих сольников в киновселенной. И тем не менее, после всей этой масштабной и помпезной рекламной компании, которая сулила нечто невероятное, 
картина постепенно приземляет тебя с небес на землю, и ты понимаешь, что завязка в общем-то немного хромает, 
а сюжет не может предложить даже вменяемого объяснения некоторых событий и поступков главных героев, что просто выступают обычным двигателем. 
Но в то же время, фильм, как и раньше, наполнен добротным экшеном, сражениями с основными противниками Человека-паука, которые ещё и вернулись в буквальном смысле из далёкого прошлого.
Ностальгия безусловно является очень сильной вещью, и конкретно здесь создатели надавили на неё на всё 156 процентов, местами вернув меня в начало нулевых. 
Да, персонажей очень много, и далеко не все из них получили столько экранного времени, сколько хотелось бы, 
но за два с половиной часа создатели постарались уделить им максимально доступное количество хронометража картины. 
И самое главное состоит в том, что они смогли по новой закончить историю каждого из так называемых “визитёров”,
 словно бы этакое исправление ошибок прошлого для каждого из задействованных персонажей. Хорошо это, или плохо, судить наверно каждому зрителю, 
 но лично я одобряю подобный подход, ведь иной финал для каждого из них мы уже видели. “Нет пути домой” безусловно является важным винтиком для нынешней фазы киновселенной Марвел,
 и по сути открывает для Дисней и её киноподразделения просто невероятные просторы для использования в буквальном смысле всей интеллектуальной собственности её',1,1);
 insert actor(`name`,age) values
 ('Том Холланд',25);
 insert `role`(`name`,id_film,id_actor) values
 ('Питер Паркер',1,1);
 insert genre(`name`)values
 ('Фантастика');
 insert film_to_genre(id_film,id_genre) values
 (1,1);
 insert  release_to_operator(id_operator,id_release) values
 (7,7),
 (8,8),
 (9,9),
 (10,10);
select * from  release_to_equipment;
select * from customer;
create table dubbing_actor(
id char not null,
`name` int not null auto_increment,
voice_character char not null,
primary key(`name`)
);
alter table dubbing_actor
add Date_of_birth date not null,
add Birthplace varchar(100) not null,
add Number_of_movies int not null;
select * from dubbing_actor;
alter table dubbing_actor
add primary key(id),
drop primary key,
modify column `name` varchar(100) not null,
modify column id int not null auto_increment;
alter table  dubbing_actor
add foreign key( Number_of_movies) references genre(id);
alter table dubbing_actor
drop foreign key dubbing_actor_ibfk_1,
add id_genre int not null,
add foreign key(id_genre) references genre(id);
alter table dubbing_actor
add unique index `ix_dubbing_actor`(`name`,voice_character);
create table film_to_dubbing_actor(
	id_film int not null,
    id_dubbing_actor int not null,
    primary key(id_film,id_dubbing_actor),
    foreign key(id_film) references film(id),
    foreign key(id_dubbing_actor) references dubbing_actor(id)
);
alter table dubbing_actor
drop column voice_character,
add id_role int not null,
add foreign key(id_role) references `role`(id);
alter table dubbing_actor
drop foreign key dubbing_actor_ibfk_2,
drop column id_genre;
create table dubbing_actor_to_genre(
    id_dubbing_actor int not null,
    id_genre int not null,
    primary key(id_dubbing_actor, id_genre),
    foreign key(id_dubbing_actor) references dubbing_actor(id),
	foreign key(id_genre) references genre(id)
);
select * from `role`;
insert into dubbing_actor(`name`,Date_of_birth,Birthplace,Number_of_movies,id_role) values
('Иван Чабан',19970823,'Санкт-Петербург',292,1);
insert into film_to_dubbing_actor(id_film,id_dubbing_actor) values
(1,1);
insert into dubbing_actor_to_genre(id_dubbing_actor,id_genre) values
(1,1);
drop table film_to_genre;
alter table genre
add id_film int not null;
select * from genre;
alter table genre
add foreign key(id) references film(id);
alter table genre 
drop column id_film;
select * from review;
alter table review
modify column grade int not null default 5 check(grade >0 and grade<10);
alter table employee
drop foreign key employee_ibfk_1,
drop column id_cinema;
create table cinema_to_employee(
	id_cinema int not null,
    id_employee int not null,
    primary key(id_cinema,id_employee),
    foreign key(id_cinema) references cinema(id),
    foreign key(id_employee) references employee(id)
);
select * from employee;
insert into cinema_to_employee(id_cinema,id_employee) values
(1,1);
alter table producer
rename column `name` to first_name;
alter table actor
rename column `name` to first_name;
alter table dubbing_actor
rename column `name` to first_name;
drop table cinema;
drop table employee;
drop table `session`;
drop database cinema;