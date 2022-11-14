#!/bin/bash
set -e
psql -U postgres -d billing_db --command='create user admin';
psql -U postgres -d billing_db --command='GRANT ALL PRIVILEGES ON DATABASE billing_db TO admin';
psql -U postgres -d billing_db --command="ALTER USER admin WITH PASSWORD '321'";
psql -U postgres -d billing_db --command='ALTER USER admin WITH SUPERUSER';
psql -U postgres -d billing_db --command='drop table if exists customer; \
create table customer ( \
    id integer primary key, \
    name varchar(120) \
); \
insert into customer (id, name) values (1, "Анжелика");';