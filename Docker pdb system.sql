CREATE TABLE MEMBER
(
    ID VARCHAR2(50),
    PWD VARCHAR2(50),
    NAME VARCHAR2(50),
    GENDER VARCHAR2(50),
    AGE NUMBER,
    BIRTHDAY VARCHAR2(50),
    PHONE VARCHAR2(50),
    REGDATE DATE
    
);
SELECT LENGTHB('AB')FROM DUAL;
SELECT LENGTHB('한글')FROM DUAL; 

DROP TABLE MEMBER;

CREATE TABLE MEMBER
(
    ID VARCHAR2(50),
    PWD VARCHAR2(50),
    NAME VARCHAR2(50),
    GENDER VARCHAR2(1), --F,M
    AGE NUMBER,
    BIRTHDAY VARCHAR2(10), --2021-05-06
    PHONE VARCHAR2(13), --010-1234-1234
    REGDATE DATE
);


SELECT * FROM MEMBER
DROP TABLE MEMBER;


ALTER TABLE MEMBER MODIFY ID NVARCHAR2(20); --ALTER있는 내용 추가, 수정, 삭제 --NVARCHAR2 한글도 가능
ALTER TABLE MEMBER DROP COLUMN AGE;
ALTER TABLE MEMBER ADD EMAIL VARCHAR2(200); 
--DDL 학습완료


CREATE TABLE NOTICE
(
    ID NUMBER,
    TITLE NVARCHAR2(100),
    WRITER_ID NVARCHAR2(50),
    CONTENT CLOB,
    REGDATE TIMESTAMP,
    HIT NUMBER,
    FILES NVARCHAR2(1000)
);

CREATE TABLE COMMENT1
(
    ID NUMBER,
    CONTENT NVARCHAR2(2000),
    REGDATE TIMESTAMP,
    WRITER_ID NVARCHAR2(50),
    NOTICE_ID NUMBER
);

CREATE TABLE ROLE1 
(
    ID VARCHAR2(50),
    DISCRIPTION NVARCHAR2(500),
);

CREATE TABLE MEMBER_ROLE
(
    MEMBER_ID NVARCHAR2(50),
    ROLE_ID VARCHAR2(50)
);

INSERT INTO MEMBER VALUES 
('NEWLEC','1111','손민아','F','2021-05-05','010-1234-1234','2021-05-06','MRSONO0@gmail.com');

INSERT INTO MEMBER
(ID, PWD, NAME, GENDER, BIRTHDAY, PHONE, EMAIL, REGDATE)
VALUES
('newlec11','1111','손아','F','2021-05-06','011-1234-1234','mrson0@gmail.com','2021-05-06');

INSERT INTO MEMBER 
(ID, PWD, NAME)
VALUES
('DRAGON','1234','할로우');

SELECT * FROM MEMBER;
 
UPDATE MEMBER SET PWD = '111';

UPDATE MEMBER SET PWD = '2222' WHERE ID = 'newlec11';

INSERT INTO MEMBER(ID,PWD)
VALUES('TEST','1111');

INSERT INTO MEMBER (ID, PWD)
VALUES ('','1111)

SELECT ID FROM MEMBER;

UPDATE MEMBER SET ID = 'test', PWD = '3333' WHERE ID = 'TEST'

SELECT ID FROM MEMBER WHERE ID = 'test';

DELETE MEMBER WHERE ID = 'test';


 --SELECT!!

--- 트랜잭션 처리르 위한 COMMIT/ROLLBACK

UPDATE MEMBER SET ID = '손민아', PWD = '3323' WHERE ID = 'newlec11'
select * from member
SELECT * FROM NOTICE

INSERT INTO NOTICE 
(ID, TITLE, WRITER_ID, CONTENT, REGDATE, HIT, FILES)
VALUES
(1, 'JDBC는 무엇인가?', 'newlec', 'CONTENT1', '2021-05-07', 0, 'ABC.JPG');

INSERT INTO NOTICE 
(ID, TITLE, WRITER_ID, CONTENT, REGDATE, HIT, FILES)
VALUES
(2, 'JDBC 드라이버 다운로드 방법', 'dragon', 'CONTENT2', '2021-05-07', 0, 'BBC.JPG');

INSERT INTO NOTICE 
(ID, TITLE, WRITER_ID, CONTENT, REGDATE, HIT, FILES)
VALUES
(3, '파라미터를 가지는 문장 실행하기', 'good', 'CONTENT3', '2021-05-07', 0, 'CBC.JPG');

INSERT INTO NOTICE 
(ID, TITLE, WRITER_ID, CONTENT, REGDATE, HIT, FILES)
VALUES
(4, 'JSP에서 JDBC 사용하기', 'gragon', 'CONTENT4', '2021-05-07', 0, 'DBC.JPG');

INSERT INTO NOTICE 
(ID, TITLE, WRITER_ID, CONTENT, REGDATE, HIT, FILES)
VALUES
(5, 'Service 계층 추가하기', 'good', 'CONTENT5', '2021-05-07', 0, 'EBC.JPG');

INSERT INTO NOTICE
VALUES
(1234,'WOWOW','AAAA','BBBBBBBB','2021-05-07',1111,'SSSS');

INSERT INTO NOTICE
VALUES
(1111,'WW','HHHH','IIIIIIIIIII','2021-05-07',101,'SSSH');

INSERT INTO NOTICE
VALUES
(4444,'YUI','AIA','KKKKKKKKK','2021-05-07',2222,'SHHHH');

UPDATE NOTICE SET  '5555'
WHERE ID = '1234';

DELETE NOTICE 
WHERE ID = '444';

SELECT HIT + 1 FROM NOTICE;
SELECT '0' +1 FROM DUAL;
SELECT 0 +'1' FROM DUAL;
SELECT '0' || 1 FROM DUAL; -- 숫자 붙이기 가능
SELECT 0 + '1' FROM DUAL;

--이름(ID)
SELECT '이름' || '(ID)' FROM DUAL;
SELECT WRITER_ID || '(' || ID || ')' FROM NOTICE; 

-- != <> ^=

SELECT * FROM NOTICE
SELECT * FROM NOTICE WHERE WRITER_ID = 'newlec11';

SELECT * FROM NOTICE WHERE WRITER_ID <> 'newlec11';
SELECT * FROM NOTICE WHERE WRITER_ID != 'newlec11';
SELECT * FROM NOTICE WHERE ID ^= '1234';

UPDATE NOTICE SET  = ' 2222 '

UPDATE NOTICE SET HIT = 33 WHERE ID 

DELETE NOTICE 
WHERE ID = '4444';

SELECT * FROM NOTICE WHERE HIT != 2;

-- = 'NULL', != NULL, IS NULL, IS NOT NULL
UPDATE NOTICE SET CONTENT = NULL WHERE ID = 1234;
UPDATE NOTICE SET CONTENT = '' WHERE ID = 1111;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
SELECT * FROM NOTICE WHERE CONTENT = 'NULL' ;
SELECT * FROM NOTICE WHERE CONTENT IS NOT NULL ;

-- AND , OR, NOT IN , BETWEEN
ID가 1234 이고 HIT 이 1111

SELECT * FROM NOTICE WHERE ID = '1234' AND HIT >= 1111 ;
SELECT * FROM NOTICE WHERE HIT = 1111 OR ID = '1111' OR CONTENT IS NULL;

SELECT * FROM NOTICE WHERE HIT BETWEEN 101 AND 1111 ;
SELECT * FROM NOTICE WHERE HIT >=0 AND HIT <= 1111 ;

-- 패턴 연산자  LIKE , %, _ (글자수)
SELECT * 
FROM NOTICE 
WHERE ID LIKE 'AA%';
---TITLE에 JTBC 가 포함된 글만 조회
SELECT * FROM NOTICE WHERE TITLE LIKE 'JD%';
SELECT * FROM NOTICE WHERE TITLE LIKE '%JD%';
SELECT * FROM NOTICE WHERE TITLE LIKE '%JD';

SELECT * FROM NOTICE WHERE TITLE LIKE 'J__________';

alter user hr account unlock identified by hr;


