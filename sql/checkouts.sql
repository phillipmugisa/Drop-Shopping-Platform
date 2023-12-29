-- a user can only add products to an active cart
-- if a cart if converted in to an order, it is set to is_active = false
-- hence is considered not active
create table if not exists Cart (
id integer,
business integer null,
total_price integer not null, -- total price of items in cart
is_active boolean default false,

primary key(id),
foreign key(business) references Business(id) on delete cascade
);

create table if not exists CartProducts (
id integer,
product integer not null,
cart integer not null,
quantity integer default 1,
total_price integer not null,
added_on datetime not null,

primary key(id),
foreign key(cart) references Cart(id) on delete cascade,
foreign key(product) references Product(id) on delete cascade
);

create table if not exists Wishlist (
id integer,
business integer null,

primary key(id),
foreign key(business) references Business(id) on delete cascade
);

create table if not exists WishlistProducts (
id integer,
product integer not null,
wishlist integer not null,
added_on datetime not null,

primary key(id),
foreign key(wishlist) references Wishlist(id) on delete cascade,
foreign key(product) references Product(id) on delete cascade
);

-- an order if based off a cart
-- a cart is converted into an order.
create table if not exists TranslationOrder (
id integer,
cart integer,
order_id varchar(20) not null,
created_on datetime not null,
payment_made boolean default false,
is_complete boolean default false,

-- shipping details
country varchar(50) not null,
state varchar(50) not null,
address varchar(50) not null,

primary key(id),
foreign key(cart) references Cart(id)
);

create table if not exists TranslationOrderNote (
id integer,
transactionOrder integer,
filename varchar(256) not null, -- filename of chat/note json file

primary key(id),
foreign key(transactionOrder) references TransactionOrder(id)
);
