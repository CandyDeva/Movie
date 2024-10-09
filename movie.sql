create database tamil_Cinema

Use tamil_cinema
create table Fav_Film_Director(
Director_Rank int primary key,
Director_Name_id int,
Total_Movies int,
index (director_name_id),
constraint fk_director foreign key(Director_Name_id) references director(Director_Name_id)
);

insert into Fav_Film_Director values
(1 , 001 , 6),
(2 , 002, 6),
(3 , 003, 5);


create table director(
Director_Name_id int primary key,
director_name varchar(20),
Age int,
Networth varchar(50)
);

insert into director values
(001 , "Vetrimaaran" , 49 , "100cr"),
(002 , "Lokesh_kanagaraj" , 38 , "70cr"),
(003 , "Atlee" , 38 , "80cr");

create table movies(
movie_id int primary key,
movie_name varchar(20),
movie_budget varchar(20),
Result varchar(20),
casting_id int,
producer_id int,
music_id int,
editor_id int,
index(casting_id),
constraint fk_cast foreign key(casting_id) references starring(casting_id),
index(producer_id),
constraint fk_producer foreign key(producer_id) references producer(producer_id),
index(music_id),
constraint fk_music foreign key(music_id) references musician(music_id),
index(editor_id),
constraint fk_editor foreign key(editor_id) references editor(editor_id)
);


select * from movies;

insert into movies values
(1,"polladhavan", "10cr","Super Hit",24,1,1,1),
(2,"Aadukalam", "18cr", "Block Buster",24,1,1,2),
(3,"Visaaranai", "2cr", "Block Buster",5,2,1,2),
(4,"Vada_chennai", "65cr", "Block Buster",24,3,2,3),
(5,"Asuran", "75cr", "Block Buster",24,4,1,4),
(6,"Viduthalai_1", "75cr", "Block Buster",22,5,3,4),
(7,"Maanagaram", "4cr",  "Super Hit",20,6,6,5),
(8,"kaithi", "25cr",  "Block Buster",18,7,7,5),
(9,"Master", "135cr",  "Block Buster",6,8,4,5),
(10,"Vikram", "120cr",  "A T B",15,9,4,5),
(11,"Leo", "250cr",  "Block Buster",6,10,4,5),
(12,"Raja_Rani" , "25cr",  "Block Buster",12,11,1,6),
(13,"Theri" , "75cr" ,  "Block Buster",6,4,1,6),
(14,"Mersal" , "110cr" ,  "Super Hit",6,12,5,6),
(15,"Bigil" , "140cr" ,  "Block Buster",6,13,5,6),
(16,"Jawan" , "300cr" ,  "Block Buster",1,14,4,6);


create table starring (
casting_id int primary key,
cast_name varchar(20),
roles varchar(20)
);


insert into starring values
(1,"Shah Rukh Khan","Hero"),
(2,"Nayanthara","Heroine"),
(3,"Vijay Sethupathi","Hero"),
(4,"Deepika Padukone","Heroine"),
(5,"Dinesh","Hero"),
(6,"Vijay","Hero"),
(7,"S J Surya","Villan"),
(8,"Kajal Aggarwal","Heroine"),
(9,"Nithya Menen","Heroine"),
(10,"Amy Jackson","Heroine"),
(11,"Arya","Hero"),
(12,"Jai","Hero"),
(13,"Nazriya","Heroine"),
(14,"Trisha","Heroine"),
(15,"Kamal Haasan","Hero"),
(16,"Fahadh Faasil","Hero"),
(17,"Surya","Hero"),
(18,"Karthi","Hero"),
(19,"Arjun Das","Villan"),
(20,"Sundeep Kishan","Hero"),
(21,"Regina Cassandra","Heroine"),
(22,"Soori","Hero"),
(23,"Bhavani sre","Heroine"),
(24,"Dhanush","Hero"),
(25,"Manju Warrier","Heroine"),
(26,"Ken Karunas","Hero"),
(27,"Teejay","Hero"),
(28,"Andrea","Heroine"),
(29,"Samuthirakani","Villan"),
(30,"Ameer","Hero"),
(31,"Aishwarya Rajesh","Heroine"),
(32,"Anandhi","Heroine"),
(33,"Tapsee","Heroine"),
(34,"Naren","Villan"),
(35,"Ramya","Heroine"),
(36,"Samantha","Heroine");


create table producer(
producer_id int primary key,
producer_name varchar(20)
);

insert into producer values
(1,"S Kathiresan"),
(2,"Dhanush"),
(3,"Subaskaran"),
(4,"Kalaipuli S Thanu"),
(5,"Elred Kumar"),
(6,"S R Prabhu"),
(7,"Prakashbabu"),
(8,"S Xavier Britto"),
(9,"Kamal Haasan"),
(10,"S S Lalit Kumar"),
(11,"A R Murugadoss"),
(12,"Ramasamy"),
(13,"Kalpathi AGS"),
(14,"Gauri Khan Gaurav");


create table musician (
music_id int primary key,
musician_name varchar(20),
age int
);

insert into musician values  
(1,"G V Prakash",37),
(2,"Santhosh Narayanan",41),
(3,"ilaiyaraaja",81),
(4,"Anirudh",33),
(5,"A R Rahman",57),
(6,"Javed Riaz",32),
(7,"Sam C S",37);


create table editor(
editor_id int primary key,
editor_name varchar(20)
);

insert into editor values
(1,"V T Vijayan"),
(2,"Kishore Te"),
(3,"G B Venkatesh"),
(4,"R Ramar"),
(5,"Philomin Raj"),  
(6,"Ruban");

-- stored procedure for find the movie name ,editor,budget from movies and editor 

delimiter $$

create procedure movie (in movie varchar(25))
begin

select movie_name,editor_name,movie_budget from movies
inner join editor on movies.editor_id=editor.editor_id
where movie_name=movie;

end$$
delimiter ;

call movie ("polladhavan");

