-- purpose: Defines database schema for the cocktails application
-- author:  Albin Remnestål (albinre@kth.se)
-- date:    2017-03-07

use cocktails;

drop table if exists base_spirits;
create table base_spirits (
    id int not null auto_increment,
    name tinytext,
    primary key (id)
);

drop table if exists spirits;
create table spirits (
    id int not null auto_increment,
    name tinytext,
    abv decimal(5,4),
    description text,
    type_of_liqour int,
    primary key (id)
);

drop table if exists mixers;
create table mixers (
    id int not null auto_increment,
    name tinytext,
    description text,
    primary key (id)
);

drop table if exists drinks;
create table drinks (
    id int not null auto_increment,
    name tinytext,
    image_url tinytext,
    description text,
    ingredients_json text,
    primary key (id)
);

drop table if exists events;
create table events (
    id int not null auto_increment,
    name tinytext,
    description text,
    passphrase tinytext,
    start_date datetime,
    end_date datetime,
    primary key (id)
);

drop table if exists inventory_spirits;
create table inventory_spirits (
    event_id int not null,
    spirit_id int not null
);

drop table if exists inventory_mixers;
create table inventory_mixers (
    event_id int not null,
    mixer_id int not null
);
