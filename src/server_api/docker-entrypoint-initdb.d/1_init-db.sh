#!/bin/bash
psql -U postgres_db -d billing_db --command='drop table if exists customer; \
create table customer ( \
    id integer primary key, \
    name varchar(120) \
); \
insert into customer (id, name) values (1, "Анжелика");';