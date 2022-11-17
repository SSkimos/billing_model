#!/bin/bash
psql -U postgres -d billing_system --command='create user test_user';
psql -U postgres -d billing_system --command='GRANT ALL PRIVILEGES ON DATABASE billing_system TO test_user';
psql -U postgres -d billing_system --command="ALTER USER test_user WITH PASSWORD '123'";
psql -U postgres -d billing_system --command='ALTER USER test_user WITH SUPERUSER';
psql -U test_user -d billing_system --command='drop table if exists customer;';

psql -U test_user -d billing_system --command='
  create table position (id integer primary key,
  title varchar(120)
);'
psql -U test_user -d billing_system --command='
create table employee (
    id integer primary key,
    position_id integer not null,
    foreign key (position_id)
        references position (id)
        on update cascade
        on delete restrict
);'
psql -U test_user -d billing_system --command='
create table customer_type (
    id integer primary key,
    title varchar(120),
    unique (title)
);'
psql -U test_user -d billing_system --command='
create table customer (
    id integer primary key,
    customer_type_id integer not null,
    first_name varchar(120) not null,
    second_name varchar(120) not null,
    address varchar(120) not null,
    mobile_number varchar(120) not null,
    foreign key (customer_type_id)
        references customer_type (id)
        on update cascade
        on delete restrict
);'
psql -U test_user -d billing_system --command='
create table account (
    id integer primary key,
    customer_id integer not null,
    number integer not null,
    count double precision default 0,
    foreign key (customer_id)
        references customer (id)
        on update cascade
        on delete restrict
);
'
psql -U test_user -d billing_system --command='
create table transaction_type (
    id integer primary key,
    title varchar(120)
);'
psql -U test_user -d billing_system --command='
create table transaction (
    id integer primary key,
    recipient_id integer not null,
    sender_id integer not null,
    type_id integer not null,
    employee_id integer not null,
    count double precision default 0,
    foreign key (recipient_id)
        references account (id)
        on update cascade
        on delete restrict,
    foreign key (sender_id)
        references account (id)
        on update cascade
        on delete restrict,
    foreign key (type_id)
        references transaction_type (id)
        on update cascade
        on delete restrict
);'