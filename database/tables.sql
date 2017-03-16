-- purpose: Defines database schema for the cocktails application
-- author:  Albin Remnestål (albinre@kth.se)
-- date:    2017-03-07

use albinre;

drop table if exists base_spirits;
create table base_spirits (
    id int not null auto_increment,
    name varchar(255) unique,
    primary key (id)
) auto_increment=0 default charset=utf8;

drop table if exists spirits;
create table spirits (
    id int not null auto_increment,
    name varchar(255) unique,
    abv decimal(4,2),
    description text,
    type_of_liqour int,
    primary key (id),
    foreign key (type_of_liqour) references base_spirits(id)
) auto_increment=1000 default charset=utf8;

drop table if exists mixers;
create table mixers (
    id int not null auto_increment,
    name varchar(255) unique,
    description text,
    primary key (id)
) auto_increment=1000 default charset=utf8;

drop table if exists drinks;
create table drinks (
    id int not null auto_increment,
    name varchar(255),
    description text,
    image_url varchar(255),
    howto_json text,
    spirits_json text not null,
    mixers_json text,
    primary key (id)
) default charset=utf8;

drop table if exists events;
create table events (
    id int not null auto_increment,
    name varchar(255) not null,
    description text,
    passphrase varchar(255) not null,
    start_date datetime not null,
    primary key (id)
) default charset=utf8;

drop table if exists inventory_spirits;
create table inventory_spirits (
    event_id int not null,
    spirit_id int not null,
    primary key (event_id, spirit_id),
    foreign key (event_id) references events(id),
    foreign key (spirit_id) references spirits(id)
) default charset=utf8;

drop table if exists inventory_mixers;
create table inventory_mixers (
    event_id int not null,
    mixer_id int not null,
    primary key (event_id, mixer_id),
    foreign key (event_id) references events(id),
    foreign key (mixer_id) references mixers(id)
) default charset=utf8;

drop table if exists event_drinklist;
create table event_drinklist (
    event_id int not null,
    drinks_json text not null,
    primary key (event_id),
    foreign key (event_id) references events(id)
) default charset=utf8;
