show tables;

create table eventDate (
	idx        int not null auto_increment primary key,        /* 행사 날짜 고유번호 */
	eventName  varchar(30) not null,                           /* 행사 고유번호(FK) */
	eDate      datetime not null,                              /* 행사 등록 날짜 */
	FOREIGN KEY (eventName) REFERENCES eventInput (eventName)
);

desc eventDate;