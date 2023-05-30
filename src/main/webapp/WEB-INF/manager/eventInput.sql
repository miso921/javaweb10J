show tables;

create table eventInput (
	idx         int not null auto_increment primary key,      /* 관리자 행사 등록 고유번호 */
	part        char(4) not null,                             /* 분류 (봉사활동, 체험활동) */
	eventName   varchar(30) not null,                         /* 행사명 */
	eTime       varchar(20) not null,              						/* 행사 가능 시간 */
	people      int not null,                                 /* 모집 인원 */
	place       varchar(30) not null,                         /* 행사 장소 */
	target      varchar(30),                                  /* 모집 대상 */
	money       varchar(30),                                  /* 참가비 */
	photo       varchar(100) not null,                        /* 행사사진 / 상세정보 / 오시는길 사진 */
	UNIQUE KEY unique_name (eventName)                         
);

desc eventInput;



drop table eventInput;

create table eventDate (
	idx       int not null auto_increment primary key,        /* 행사 날짜 고유번호 */
	eventIdx  int not null,                                   /* 행사 고유번호(FK) */
	eDate     datetime not null,                              /* 행사 등록 날짜 */
	FOREIGN KEY (eventIdx) REFERENCES eventInput (idx)
);

desc eventDate;

drop table eventDate;

alter table eventDate add constraint FK_ed foreign key (eventName) REFERENCES eventInput (eventName);
