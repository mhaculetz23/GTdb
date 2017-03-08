set echo on

connect system/kikumaru



--Create PHP Application User
--For regular user
drop user GT cascade;

create user GT identified by qwerty;

	grant connect, resource to GT;

		alter user GT default tablespace users

		temporary tablespace temp account unlock;



--Create user owner security information about the app
--For Administrator

drop user adminGT cascade;

create user adminGT identified by qwerty;

	alter user adminGT default tablespace system

	temporary tablespace temp account unlock;

	grant create procedure, create session, create table, --or grant DBA to "name"; >>> shortcut for admin priviledges

		resource, select any dictionary to adminGT;



connect GT/qwerty



--"Parts" table for the application demo

create table Administrator
	(admin_id number primary key,
		admin_email varchar2(200),
		admin_pass varchar2(50));

create table Customer
	(c_id number primary key,
		c_pass varchar2(100),
		c_name varchar2(200),
		c_address varchar2(1000),
		c_contact number(20));

create table Product
	(p_id number primary key,
		p_title varchar2(200),
		p_image varchar2(200),
		p_desc varchar2(1000),
		p_price number(100),
		p_brand varchar2(200),
		p_cat varchar2(200),
		brand_id number(100),
		cat_id number(100));

create table Cart 
	(cart_id number primary key,
		cart_qty number(100));

create table Categories
	(cat_id number	primary key,
		cat_title varchar2(500));

create table Brand 
	(brand_id number primary key,
		brand_title varchar2(500));

connect adminGT/qwerty;