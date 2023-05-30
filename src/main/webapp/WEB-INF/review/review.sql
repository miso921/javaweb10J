show tables;

CREATE TABLE review (
	idx      INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	mid      VARCHAR(20) NOT NULL,
	email    VARCHAR(50) NOT NULL,
	title    VARCHAR(100) NOT NULL,
	content  VARCHAR(100) NOT NULL,
	hostIp   VARCHAR(40),
	wDate    DATETIME DEFAULT NOW(),
	photo    VARCHAR(100),
	readNum  INT default 0,
	FOREIGN KEY (mid) REFERENCES member (mid)
);

desc review;