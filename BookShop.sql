# c:\xampp2\mysql\bin\mysql -uedunova -pedunova < d:\pp21\zavrsni_\BookShop.sql

drop database if exists BookShop;
create database BookShop;
use BookShop;

create table Book(
    ID int not null primary key auto_increment,
    title varchar (100) not null,
    number_of_pages int,
    ID_author int,
    ID_publishing_house int,
    ID_book_type int,
    price int,
    year_of_issue year
 );

 create table Book_type(
     ID int not null primary key auto_increment,
     name varchar (50) not null, 
     book_type int not null  
 );


 create table Author(
     ID int not null primary key auto_increment,
     name varchar(50) not null,
     last_name varchar(50) not null,
     date_of_birth date,
     date_of_death date,
     country varchar(50)
 
 );

 create table Book_Author (
     ID_book int not null,
     ID_author int not null 
 );
 create table Book_Booktype (
     ID_book int not null,
     ID_book_type INT not null
     
 );

 create table Publishing_house(
     ID int not null primary key auto_increment,
     name varchar(50) not null,
     adress varchar(50) ,
     city varchar(50),
     phone_number int,
     e_mail varchar(50)
     );


 create table Order_(
 ID_order_number int not null primary key auto_increment,
 ID_custumer int not null,
 quantity int not null,
 price decimal(18,4) not null,
  description varchar(100)
 );
 create table Book_order(
  book_ID int not null,
  order_ID_number int not null

 );

 create table Custumer(
ID int not null primary key auto_increment,
name varchar(50) not null,
lastname varchar(50) not null,
street_adress varchar(50) not null,
city varchar(50) not null,
postcode int not null,
country varchar(50) not null,
phone_number int not null,
e_mail varchar(50) not null
) ;



 alter table Book_Author add foreign key (ID_author) references Author(ID); 
 alter table Book_Author add foreign key (ID_book) references Book(ID);
 alter table Book_Booktype add foreign key (ID_book_type) references Book_type(ID); 
 alter table Book_Booktype add foreign key (ID_book) references Book(ID);
 alter table Book add foreign key(ID_publishing_house) references Publishing_house(ID); 
  alter table Book_type add foreign key(book_type) references Book_type(ID);
  alter table Book_order add foreign key(book_ID) references Book(ID);
  alter table Book_order add foreign key(order_ID_number) references Order_(ID_order_number);
  alter table Order_ add foreign key(ID_custumer) references  Custumer(ID);
 
