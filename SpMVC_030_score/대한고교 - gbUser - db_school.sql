create DATABASE db_school;
use db_school;

create table tbl_student (
st_num	CHAR(8)	PRIMARY KEY,
st_name	VARCHAR(20)	NOT NULL,	
st_dept	VARCHAR(20)	NOT NULL,	
st_grade	INT	NOT NULL	,
st_tel	VARCHAR(15)	NOT NULL,	
st_addr	VARCHAR(125)		
);


INSERT INTO tbl_student 
(st_num, st_name, st_dept, st_grade,st_tel)
VALUES('2021001','홍길동','컴퓨터공학과',3,'010-1111-2222');

commit;
rollback;
drop table tbl_score;
drop table tbl_student;
drop table tbl_subject;

DROP TABLE tbl_score ;

/*
table에 
	INSERT INTO ON DUPLICATE KEY UPDATE를 실행하기 위해서는 PK 설정을 변경해야 한다
tbl_score는 두 개의 칼럼을 기준으로
	UPDATE, DELETE를 수행하는 문제가 발생한다
가장 좋은 설계는 UPDATE나 DELETE를 수행할 때 한 개의 칼럼으로 구성된 PK를 기준으로 수행하는 것이 좋다
*/
CREATE TABLE tbl_score (
	-- sc_seq	BIGINT	auto_increment	PRIMARY KEY,
	sc_stnum	CHAR(8)	NOT NULL	,
	sc_sbcode	CHAR(4)	NOT NULL	,
	sc_score	INT	NOT NULL	,
    primary key(sc_stnu, sc_sbcode)
);
-- PK는 그대로 살려두고 두 개의 칼럼을 묶어 UNIQUE로 설정
-- 두 개 칼럼의 값이 동시에 같은 경우는 추가하지 말라는 제약조건 설정
CREATE TABLE tbl_score (
	sc_seq	BIGINT	auto_increment	PRIMARY KEY,
	sc_stnum	CHAR(8)	NOT NULL	,
	sc_sbcode	CHAR(4)	NOT NULL	,
	sc_score	INT	NOT NULL	,
    unique(sc_stnu, sc_sbcode)
);





INSERT INTO tbl_score ( sc_stnum, sc_sbcode, sc_score)
VALUES ('2021001', 'S001', 90);
INSERT INTO tbl_score ( sc_stnum, sc_sbcode, sc_score)
VALUES ('2021001', 'S002', 88);
INSERT INTO tbl_score ( sc_stnum, sc_sbcode, sc_score)
VALUES ('2021001', 'S003', 50);
INSERT INTO tbl_score ( sc_stnum, sc_sbcode, sc_score)
VALUES ('2021001', 'S004', 100);


CREATE TABLE tbl_subject (
sb_code	CHAR(4)		PRIMARY KEY,
sb_name	VARCHAR(20)	NOT NULL	,
sb_proft	VARCHAR(20)		
);

INSERT INTO tbl_subject (sb_code, sb_name, sb_proft)
VALUES('S001','생명과학의이해','김생명');
INSERT INTO tbl_subject (sb_code, sb_name, sb_proft)
VALUES('S002','수학의정석','이수학');
INSERT INTO tbl_subject (sb_code, sb_name, sb_proft)
VALUES('S003','현대국어','김한문');
INSERT INTO tbl_subject (sb_code, sb_name, sb_proft)
VALUES('S004','컴퓨터언어C','박문과');
INSERT INTO tbl_subject (sb_code, sb_name, sb_proft)
VALUES('S005','서양철학','임이과');


select * from tbl_score ;
select * from tbl_student ;
select * from tbl_subject ;


		SELECT sc_seq, sc_stnum, T.st_name AS sc_stname, sc_sbcode, B.sb_name AS sc_sbname, sc_score
		FROM tbl_score C
			LEFT JOIN tbl_student T
				ON C.sc_stnum = T.st_num
			LEFT JOIN tbl_subject B
				ON C.sc_sbcode = B.sb_code
		ORDER BY sc_stnum, sc_sbcode;

/*
	과목리스트를 전체 보여주고 
	
	이 JOIN  명령문에 특정한 박번을 조건으로 부여하여 한 학생의 성적 여부를 조회하는 SQL문 만들기
    
	순수한 JOIN을 사용하여 한 학생의 성적을 조회하는데
    학생의 성적이 tbl_score table에 있으면
    점수를 보이고 없으면 NULL로 표현하기 위하여 
	WHERE절에서 학버능ㄹ 조건으로 부여하지 않고
    JOIN문의  ON 절에 학번을 조건으로 부여한다
*/







