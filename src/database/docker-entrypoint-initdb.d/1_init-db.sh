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

psql -U test_user -d billing_system --command="
insert into customer_type (id, title)
values (
  1, 'basic'
),(
  2, 'premium'
),(
  3, 'vip'
);"

psql -U test_user -d billing_system --command="
insert into customer (id, customer_type_id, first_name, second_name, address, mobile_number)
values (
  1, 1, 'Лебедева', 'Марьям', 'test', '7(495)520-85-67'
), (
  2, 1, 'Попов', 'Сергей', 'test', '7(495)873-27-27'
), (
  3, 1, 'Симонова', 'Полина', 'test', '7(495)433-21-79'
), (
  4, 1, 'Грачев', 'Роман', 'test', '7(495)660-78-26'
), (
  5, 1, 'Волкова', 'Ева', 'test', '7(495)473-93-15'
), (
  6, 1, 'Мельникова', 'Арина', 'test', '7(495)895-52-27'
), (
  7, 1, 'Литвинов', 'Платон', 'test', '7(495)619-88-83'
), (
  8, 1, 'Зайцева', 'Алиса', 'test', '7(495)533-45-98'
), (
  9, 1, 'Макаров', 'Федор', 'test', '7(495)729-13-43'
), (
  10, 1, 'Зайцев', 'Мирон', 'test', '7(495)498-61-53'
);"

psql -U test_user -d billing_system --command="
insert into transaction_type (id, title)
values (
  1, 'Снятие наличных'
), (
  2, 'Перевод'
), (
  3, 'Оплата услуг'
), (
  4, 'Получение перевода'
), (
  5, 'Пополнение счета'
);
"