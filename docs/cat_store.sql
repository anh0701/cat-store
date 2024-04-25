create database cat_store;
use cat_store;

-- drop database cat_store;

create table role(
    id int primary key AUTO_INCREMENT,
    roleName nvarchar(255)
);

INSERT INTO `cat_store`.`role` (`roleName`) VALUES ('admin');
INSERT INTO `cat_store`.`role` (`roleName`) VALUES ('user');

create table user(
    id int primary key AUTO_INCREMENT,
    username varchar(255),
    password varchar(255),
    address varchar(255),
    phone varchar(10),
    email varchar(255),
    roleId int DEFAULT 2,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at datetime,
    foreign key (roleId) references role(id)
);

INSERT INTO `cat_store`.`user` (`username`, `password`) VALUES ('huong', '2');
INSERT INTO `cat_store`.`user` (`username`, `password`, `roleId`) VALUES ('anh', '1', '1');

create table review(
    id int primary key AUTO_INCREMENT,
    content varchar(255),
    rating int,
    customerId int,
    foreign key (customerId) references user(id)
);


