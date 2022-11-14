#!/bin/bash
psql -U postgres -d billing --command='drop table if exists customer;';
psql -U postgres -d billing --command='create table customer (id integer primary key, name varchar(120));';
psql -U postgres -d billing --command='insert into customer (id, name) values (1, 123);';