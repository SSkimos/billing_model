#!/bin/bash
set -e
psql -U admin -d test --command='create user admin';
psql -U admin -d test --command='GRANT ALL PRIVILEGES ON DATABASE test TO admin';
psql -U admin -d test --command="ALTER USER admin WITH PASSWORD 'admin'";
psql -U admin -d test --command='ALTER USER admin WITH SUPERUSER';
psql -U admin -d test --command='drop table if exists customer; \
create table customer ( \
    id integer primary key, \
    name varchar(120) \
); \
insert into customer (id, name) values (1, "Анжелика");';