show tables;

create table eventInput (
	idx         int not null auto_increment primary key,      /* 관리자 행사 등록 고유번호 */
	eventName   varchar(30) not null,                         /* 행사명 */
	eTime       datetime not null default now(),                       /* 행사 가능 시간 */
	ticketNum   varchar(30) not null,                         /* 참여가능한 표 개수 */
	place       varchar(30) not null,                         /* 행사 장소 */
	target      varchar(30),                                  /* 모집 대상 */
	people      char(5),                             /* 모집 인원 */
	money       varchar(30),                                  /* 참가비 */
	part        char(4) not null,                             /* 분류 (봉사활동, 체험활동) */
	thumbnail   varchar(100) not null,                        /* 행사 홍보 사진 */
	detail      varchar(100),                                 /* 행사 상세 정보 */
	road        varchar(100),                                 /* 오시는 길 */
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
