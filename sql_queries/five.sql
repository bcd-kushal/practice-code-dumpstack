create table Author(
	auth_id number(2),
	auth_name varchar2(30),
	expertise varchar2(15),
	constraint primaryAuth primary key(auth_id),
	constraint domainCheck check(expertise in('Horror','Drama','Science Fiction','Detective Story'))
);

create table Publisher(
	pub_id number(2),
	pub_name varchar2(30),
	owner_name varchar2(30),
	address varchar2(30),
	constraint primaryPub primary key(pub_id)
);

create table Publication(
	publication_id number(3),
	pub_id number(2),
	auth_id number(2),
	DOP date,
	edition number(2),
	constraint foreignPub foreign key(pub_id) references Publisher(pub_id),
	constraint foreignAuth foreign key(auth_id) references Author(auth_id),
	constraint EditionCheck check(edition>=1)
);


insert into Author(auth_id,auth_name,expertise)
values(1,'Karumanchi','Science Fiction');

insert into Author(auth_id,auth_name,expertise)
values(2,'SK Sinha','Drama');

insert into Author(auth_id,auth_name,expertise)
values(3,'Sahani','Horror');

insert into Author(auth_id,auth_name,expertise)
values(4,'Bose n Roy','Science Fiction');

insert into Author(auth_id,auth_name,expertise)
values(5,'HL Teyvat','Detective Story');

insert into Author(auth_id,auth_name,expertise)
values(6,'Rex Incognito','Horror');

insert into Author(auth_id,auth_name,expertise)
values(7,'Luna Stone','Science Fiction');