show tables;

create table member (
	idx      int not null auto_increment,      /* 회원의 고유번호 */
	name     varchar(20)  not null,            /* 회원의 이름 */
	mid      varchar(20)  not null,            /* 회원의 아이디 */
	nick     varchar(20)  not null,            /* 회원의 닉네임 */
	pwd      varchar(100) not null,            /* 회원의 비밀번호 */
	salt     char(8)      not null,            /* 비밀번호 암호화 */ 
	birthday datetime default now(),           /* 회원의 생년월일 */
	address  varchar(100),                     /* 회원의 주소 */
	tel      varchar(15) not null,             /* 회원의 전화번호 */
	email    varchar(50),                      /* 회원의 이메일 */
	gender   varchar(5) default '미선택',        /* 회원의 성별 */ 
	userDel  char(2) default 'NO',             /* 탈퇴 신청 유무 */
	level		 int default 1,                    /* 0:관리자 1:회원 */
	primary key(idx)
);  

drop table member;
desc member;