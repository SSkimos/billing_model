#!/bin/bash
psql -U postgres -d billing_system --command='create user test_user';
psql -U postgres -d billing_system --command='GRANT ALL PRIVILEGES ON DATABASE billing_system TO test_user';
psql -U postgres -d billing_system --command="ALTER USER test_user WITH PASSWORD '123'";
psql -U postgres -d billing_system --command='ALTER USER test_user WITH SUPERUSER';
psql -U test_user -d billing_system --command='drop table if exists customer;';
psql -U test_user -d billing_system --command='create table customer (id integer primary key, name varchar(120));';
psql -U test_user -d billing_system --command='insert into customer (id, name) values (1, 123);';