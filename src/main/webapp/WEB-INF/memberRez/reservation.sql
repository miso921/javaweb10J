show tables;

CREATE TABLE reservation (
	idx         int not null AUTO_INCREMENT PRIMARY KEY,    /* 예약 고유번호 */
	eventName   varchar(50) not null,                       /* 예약 행사명 */
	mid         varchar(50) not null,  
	rDate       datetime not null,                          /* 행사 예약날짜 */
	rTime       char(5) not null,                          /* 행사 예약시간 */
	rPeopleNum  int not null,                               /* 행사 참여인원(실제 예약하는 인원) */
	aplDate     datetime not null default now(),                          /* 예약 신청한 날짜 */
	FOREIGN KEY (eventName) REFERENCES eventInput (eventName),
	FOREIGN KEY (mid) REFERENCES member (mid)
);

desc reservation;
drop table reservation;