drop table if exists employee;
drop table if exists position;
drop table if exists account;
drop table if exists customer;
drop table if exists customer_type;
drop table if exists transaction;
drop table if exists transaction_type;

create table position (
    id integer primary key,
    title varchar(120)
);

create table employee (
    id integer primary key,
    position_id integer,
    foreign key (position_id)
        references position (id)
        on update cascade
        on delete restrict
);

create table customer_type (
    id integer primary key,
    title varchar(120)
);

create table customer (
    id integer primary key,
    customer_type_id integer,
    account_id integer,
    first_name varchar(120),
    second_name varchar(120),
    address varchar(120),
    mobile_number varchar(120),
    foreign key (customer_type_id)
        references customer_type (id)
        on update cascade
        on delete restrict
);

create table account (
    id integer primary key,
    customer_id integer,
    number integer,
    count double precision,
    foreign key (customer_id)
        references customer (id)
        on update cascade
        on delete restrict
);

create table transaction_type (
    id integer primary key,
    title varchar(120)
);

create table transaction (
    id integer primary key,
    recipient_id integer,
    sender_id integer,
    type_id integer,
    employee_id integer,
    count double precision,
    foreign key (recipient_id)
        references account (id)
        on update cascade
        on delete restrict,
    foreign key (sender_id)
        references account (id)
        on update cascade
        on delete restrict
);

