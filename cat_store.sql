create database cat_store;
use cat_store;
create table user(
    id int primary key AUTO_INCREMENT,
    username varchar(255),
    password varchar(255),
    role bit
);
