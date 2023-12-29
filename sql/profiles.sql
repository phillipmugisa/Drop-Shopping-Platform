create table if not exists UserAccountType (
id integer auto_increment,
account_type varchar(256) not null,

primary key(id)
);

create table if not exists User (
id integer auto_increment,
firstname varchar(256) not null,
lastname varchar(256) not null,
country varchar(50) not null,
state varchar(50) not null,
address varchar(100) not null,
telnumber varchar(50) not null,
email varchar(100) not null,

account_type integer,
is_verified boolean default false,
is_superuser boolean default false,
is_logged_in boolean default false,

created_on datetime not null,
updated_on datetime not null,
verified_on datetime null,
last_logged_in datetime null,

primary key(id),
foreign key(account_type) references UserAccountType(id) on delete set null
);

create table if not exists Business (
id integer auto_increment,
name varchar(256) not null,
description text,

vat_number varchar(256) unique not null,
legal_entity_identifier varchar(256) unique not null,

country varchar(50) not null,
state varchar(50) not null,
address varchar(100) not null,
business_line varchar(50) not null,
email varchar(100) not null,
website varchar(128) null,

is_verified boolean default false,
created_on datetime not null,
updated_on datetime not null,
verified_on datetime null,
verified_by integer null,
created_by integer not null,

primary key(id),
foreign key(created_by) references User(id) on delete cascade,
foreign key(verified_by) references User(id) on delete cascade
);

create table Team (
id integer auto_increment,
business integer,

created_on datetime not null,
updated_on datetime not null,

primary key(id),
foreign key(business) references Business(id) on delete cascade
);

create table if not exists TeamMember (
id integer,
team integer,
user integer,

foreign key(team) references Team(id) on delete cascade,
foreign key(user) references User(id) on delete cascade
);