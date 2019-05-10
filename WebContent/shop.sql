create table shop_product(

no int(5) not null auto_increment ,
name varchar(20) null,
price varchar(10) null,
detail text null,
date varchar(20) null ,
stock varchar(10) null,
image varchar(20) null,
primary key (no)
)engine=InnoDB default charset=euckr;

create table shop_order(

no int(5) not null auto_increment,
product_no varchar(5) not null,
quantity varchar(10) not null,
date varchar(20) null,
state varchar(10) null,
id varchar(10) null,
primary key (no)
)engine=InnoDB default charset=euckr;


create table admin(
admin_id varchar(20) not null,
admin_passwd varchar(20) null,
primary key (admin_id)
)engine=InnoDB default charset=euckr;

drop table shop_product;

drop table shop_order;
