show tables;

create table board (
	idx     int not null auto_increment primary key,   /* 문의게시판 고유번호 */
	mid     varchar(20),                               /* 글쓴이 아이디 */
	email   varchar(50) not null,                      /* 글쓴이 이메일 */
	title   varchar(100) not null,                     /* 게시글 제목 */
	content text not null,                             /* 게시글 내용 */
	hostIp  varchar(40),                               /* IP주소 */
	wDate   datetime default now(),                    /* 글쓴날짜 */
	openInfo char(2)	default 'OK',                    /* 공개여부 */  
	FOREIGN KEY (mid) REFERENCES member (mid)
);

desc board;

create table boardReply (
	idx      int not null auto_increment primary key,   /* 댓글 고유번호 */
	boardIdx int not null,															/* 문의글 고유번호 */
	mid      varchar(20),                               /* 댓글 작성자 아이디 */
	content  varchar(20) not null,                      /* 댓글 작성자 이메일 */
	FOREIGN KEY (boardIdx) REFERENCES board (idx)
);