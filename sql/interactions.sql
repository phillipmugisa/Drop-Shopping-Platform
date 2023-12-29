-- THESE ARE TO BE USED FOR RECOMMANDATIONS AND BUSINESS ANALYTICS
create table if not exists ProductReview (
id integer,
user integer,
product integer,
content text not null,
is_verified boolean default false,
verified_by integer null,

primary key(id),
foreign key(user) references User(id) on delete set null,
foreign key(verified_by) references User(id) on delete set null,
foreign key(product) references Product(id) on delete cascade
);

create table if not exists ProductView (
id integer,
user integer null,
product integer,
duration integer not null,
ip_address varchar(40) null,

primary key(id),
foreign key(user) references User(id) on delete set null,
foreign key(product) references Product(id) on delete cascade
);

create table if not exists ProductLike (
id integer,
user integer,
product integer,

primary key(id),
foreign key(user) references User(id) on delete set null,
foreign key(product) references Product(id) on delete cascade
);

create table if not exists ProductShare (
id integer,
user integer null,
product integer,
ip_address varchar(40) null,
shared_to varchar(40) null,

primary key(id),
foreign key(user) references User(id) on delete set null,
foreign key(product) references Product(id) on delete cascade
);