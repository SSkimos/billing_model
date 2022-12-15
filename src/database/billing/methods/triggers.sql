drop function if exists rand_number();
create function rand_number() returns trigger as $psql$
    declare
        value integer;
    begin
        value = (random()*(999999-100000)+100000);
        update account set acc_number = value
        where id = (select max(id) from account);
        return new;
    end;
$psql$ language plpgsql;

drop trigger r_number on account;
create trigger r_number
after insert on account
for each row execute procedure rand_number();
