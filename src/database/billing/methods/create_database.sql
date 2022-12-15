drop table if exists mortgage_payment;
drop table if exists transaction;
drop table if exists mortgage;
drop table if exists account;
drop table if exists customer;
drop table if exists employee;
drop table if exists mortgage_type;
drop table if exists role;
drop table if exists customer_type;

create table customer_type (
    id integer primary key,
    title varchar(120) not null,
    unique (title)
);

create table role (
    id integer primary key,
    title varchar(120) not null,
    unique (title)
);

create table mortgage_type (
    id integer primary key,
    title varchar(120) not null,
    unique (title)
);

create table customer (
    id integer primary key,
    type_id integer default 1,
    f_name varchar(120) not null,
    l_name varchar(120) not null,
    address varchar(120) not null,
    mobile_number varchar(120) not null,
    unique (mobile_number),
    foreign key (type_id)
        references customer_type (id)
        on update cascade
        on delete restrict
);

create table employee (
    id integer primary key,
    role_id integer not null,
    f_name varchar(120) not null,
    l_name varchar(120) not null,
    address varchar(120) not null,
    mobile_number varchar(120) not null,
    foreign key (role_id)
        references role (id)
        on update cascade
        on delete restrict
);

create table account (
    id integer primary key,
    customer_id integer not null,
    acc_number integer not null default 0,
    count double precision default 0,
    unique (acc_number),
    foreign key (customer_id)
        references customer (id)
        on update cascade
        on delete restrict
);

create table mortgage (
    id integer primary key,
    emp_id integer not null,
    cus_id integer not null,
    subject varchar(120) not null,
    value double precision not null check (value > 0),
    essence varchar(120) not null,
    scale varchar(120) not null,
    term date not null,
    type_id integer not null,
    foreign key (emp_id)
        references employee (id)
        on update cascade
        on delete restrict,
    foreign key (type_id)
        references mortgage_type (id)
        on update cascade
        on delete restrict,
    foreign key (cus_id)
        references customer (id)
        on update cascade
        on delete restrict
);

create table transaction (
    id integer primary key,
    r_id integer not null,
    s_id integer not null,
    count double precision check (count > 0),
    cur_date date not null,
    foreign key (r_id)
        references account (id)
        on update cascade
        on delete restrict,
    foreign key (s_id)
        references account (id)
        on update cascade
        on delete restrict
);

create table mortgage_payment (
    id integer primary key,
    mort_id integer not null,
    next_date date not null,
    nex_payment double precision not null check (nex_payment > 0),
    status integer not null,
    acc_number integer not null,
    foreign key (mort_id)
        references mortgage (id)
        on update cascade
        on delete restrict
);
