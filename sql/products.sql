create table if not exists ProductCategory (
id integer auto_increment,
name varchar(256) not null,
image varchar(256) not null, -- stores the filename of the image

created_on datetime not null,
updated_on datetime not null,
created_by integer not null,

primary key(id),
foreign key(created_by) references User(id) on delete cascade
);

create table if not exists ProductSubcategory (
id integer auto_increment,
name varchar(256) not null,
image varchar(256) not null, -- stores the filename of the image
category integer,

created_on datetime not null,
updated_on datetime not null,
created_by integer not null,

primary key(id),
foreign key(created_by) references User(id) on delete cascade,
foreign key(category) references ProductCategory(id) on delete cascade
);

CREATE TABLE Product (
id integer auto_increment,
name varchar(256) not null,
description text,
unit_price integer not null,
currency varchar(5) not null,
is_verified boolean default false,
subcategory integer,
business integer,

created_on datetime not null,
updated_on datetime not null,
verified_on datetime null,
verified_by integer null,
created_by integer not null,

primary key(id),
foreign key(created_by) references User(id) on delete cascade,
foreign key(verified_by) references User(id) on delete cascade,
foreign key(subcategory) references ProductSubcategory(id) on delete cascade,
foreign key(business) references Business(id) on delete cascade
);

create table if not exists ProductImage (
id integer auto_increment,
image varchar(256) not null, -- stores the filename of the image
product integer,

created_on datetime not null,
updated_on datetime not null,
created_by integer not null,

primary key(id),
foreign key(created_by) references User(id) on delete cascade,
foreign key(product) references Product(id) on delete cascade
);

create table if not exists ProductTag (
id integer auto_increment,
image varchar(256) not null, -- stores the filename of the image
product integer,

created_on datetime not null,
updated_on datetime not null,
created_by integer not null,

primary key(id),
foreign key(created_by) references User(id) on delete cascade,
foreign key(product) references Product(id) on delete cascade
);