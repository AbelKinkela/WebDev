
create table PROJECT
(
	ID int auto_increment,
	NAME varchar(50) not null,
	START_DATE date not null,
	END_DATE date not null,
	DESCRIPTION varchar(1000) not null,
	MILESTONES varchar(500) not null,
	COMPLETION_PERCENT int default 0 not null,
	USER_ID int not null,
	constraint PROJECT_pk
		primary key (ID),
	constraint USER_ID
		foreign key (USER_ID) references USER (ID)
			on delete cascade
);

create table USER
(
	ID int auto_increment,
	NAME varchar(50) not null,
    EMAIL varchar(50) not null,
	PASSWORD varchar(100) not null,
	constraint USER_pk
		primary key (ID)
);





