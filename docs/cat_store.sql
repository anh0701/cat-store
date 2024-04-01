create database cat_store;
use cat_store;

create table role(
    id int primary key AUTO_INCREMENT,
    roleName nvarchar(255)
);

insert into role values ('', 'admin'),
                        ('', 'customer');

create table user(
    id int primary key AUTO_INCREMENT,
    username varchar(255),
    password varchar(255),
    address nvarchar(255),
    phone varchar(10),
    email varchar(255),
    roleId int,
    foreign key (roleId) references role(id)
);

insert into user values ('', 'anh', '123', '1')
                        ('', 'cus', '123', '2');

create table review(
    id int primary key AUTO_INCREMENT,
    content nvarchar(255),
    rating int,
    customerId int,
    foreign key (customerId) references user(id)
);

insert into values('', 'good', '5', '1');


