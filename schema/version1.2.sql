
select * from REVIEW where member_id = 'aaa';

insert into member values('aaa', 'aaa', '������', '010-1111-1111', 
   '��', 'aaa@gmail.com');
   insert into member values('bbb', 'bbb', '������', '010-1111-1111', 
   '��', 'bbb@gmail.com');
   insert into member values('ccc', 'ccc', '�ٴٴ�', '010-1111-1111', 
   '��', 'ccc@gmail.com');
   insert into member values('ddd', 'ddd', '����', '010-1111-1111', 
   '��', 'ddd@gmail.com');
   insert into member values('eee', 'eee', '������', '010-1111-1111', 
   '��', 'eee@gmail.com');

   
   insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'��õ', '���� ��õ!', 
         sysdate, 'aaa', 25398530, '���츮������', 'true');
insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'��õ', '���� ��õ!', 
         sysdate, 'aaa', 25398490,'���Ľ�Ÿ', 'true');
         insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'��õ', '���� ��õ!', 
         sysdate, 'aaa',25396526,'�ְ������5��«��', 'true');
insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'��õ', '���� ��õ!', 
         sysdate, 'aaa', 25392838,'����', 'true');
insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'��õ', '���� ��õ!', 
         sysdate, 'aaa', 25392296,'�߳�ȭ��', 'true');
         
   
   insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'����', '���� ����!', 
         sysdate, 'bbb', 25398530, '���츮������', 'false');
insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'����', '���� ����!', 
         sysdate, 'bbb', 25398490,'���Ľ�Ÿ', 'false');
         insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'����', '���� ����!', 
         sysdate, 'bbb',25396526,'�ְ������5��«��', 'false');
insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'����', '���� ����!', 
         sysdate, 'bbb', 25392838,'����', 'false');
insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'����', '���� ����!', 
         sysdate, 'bbb', 25392296,'�߳�ȭ��', 'false');
         

   insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'��õ��', '���� ��õ��!', 
         sysdate, 'ccc', 25398530, '���츮������', 'true');
insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'��õ��', '���� ��õ��!', 
         sysdate, 'ccc', 25398490,'���Ľ�Ÿ', 'true');
         insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'��õ��', '���� ��õ��!', 
         sysdate, 'ccc',25396526,'�ְ������5��«��', 'true');
insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'��õ��', '���� ��õ��!', 
         sysdate, 'ccc', 25392838,'����', 'true');
insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'��õ��', '���� ��õ��!', 
         sysdate, 'ccc', 25392296,'�߳�ȭ��', 'true');
         
         
   insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'���', '���� ���!', 
         sysdate, 'ddd', 25398530, '���츮������', 'false');
insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'���', '���� ���!', 
         sysdate, 'ddd', 25398490,'���Ľ�Ÿ', 'false');
         insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'���', '���� ���!', 
         sysdate, 'ddd',25396526,'�ְ������5��«��', 'false');
insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'���', '���� ���!', 
         sysdate, 'ddd', 25392838,'����', 'false');
insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'���', '���� ���!', 
         sysdate, 'ddd', 25392296,'�߳�ȭ��', 'false');
         
insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'¯', '���� ¯!', 
         sysdate, 'eee', 25398530, '���츮������', 'true');
insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'¯', '���� ¯!', 
         sysdate, 'eee', 25398490,'���Ľ�Ÿ', 'true');
         insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'¯', '���� ¯!', 
         sysdate, 'eee',25396526,'�ְ������5��«��', 'true');
insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'¯', '���� ¯!', 
         sysdate, 'eee', 25392838,'����', 'true');
insert into review (REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENTS, 
   REVIEW_DATE, MEMBER_ID, RES_ID, RES_NAME, REVIEW_ISLIKE)  values (REVIEW_SEQ.NEXTVAL,'¯', '���� ¯!', 
         sysdate, 'eee', 25392296,'�߳�ȭ��', 'true');

         

insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 56);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 57);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 58);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 59);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 60);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 61);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 62);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 63);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 64);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 65);

insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 66);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 67);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 68);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 69);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 70);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 71);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 72);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 73);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 74);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 75);

insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 76);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 63);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 78);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 79);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 80);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 56);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 57);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 58);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 59);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 60);

insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 61);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 62);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 63);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 64);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 65);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 66);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 67);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 68);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 69);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 70);

insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'eee', 71);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'eee', 72);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'eee', 73);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'eee', 74);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'eee', 75);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'eee', 80);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'eee', 59);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'eee', 61);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'eee', 60);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'eee', 62);


-------------------------------

insert into BOOKMARK values(BOOKMARK_SEQ.NEXTVAL, 'aaa', 25398530);
insert into BOOKMARK values(BOOKMARK_SEQ.NEXTVAL, 'aaa', 25398530);
insert into BOOKMARK values(BOOKMARK_SEQ.NEXTVAL, 'aaa', 25398530);
insert into BOOKMARK values(BOOKMARK_SEQ.NEXTVAL, 'aaa', 25398530);
insert into BOOKMARK values(BOOKMARK_SEQ.NEXTVAL, 'aaa', 25398530);

-

select * from member;
select * from review;
select * from RECOMMEND;
select * from bookmark;

select * from REVIEW;

delete from review ;
delete from MEMBER;
delete from RECOMMEND;
----------




CREATE TABLE RESTAURANT(
    RES_ID NUMBER(10) PRIMARY KEY,
    RES_NAME VARCHAR2(30 CHAR) NOT NULL,
    RES_CHAIN_NAME VARCHAR2(10 CHAR),
    RES_CATEGORY VARCHAR2(10 CHAR),
    RES_SUB_CATEGORY VARCHAR2(10 CHAR),
    RES_DONG VARCHAR2(5 CHAR),
    RES_ADDR VARCHAR2(100 CHAR),
    RES_FLOOR VARCHAR2(5 CHAR),
    RES_HO VARCHAR2(5 CHAR),
    RES_LONG NUMBER(12,9),
    RES_LAT NUMBER(13,10)
);

CREATE TABLE MEMBER(
    MEMBER_ID VARCHAR2(20 CHAR) PRIMARY KEY,
    MEMBER_PWD VARCHAR2(20 CHAR) NOT NULL,
    MEMBER_NAME VARCHAR2(10 CHAR) NOT NULL,
    MEMBER_PHONE VARCHAR2(20 CHAR) NOT NULL,
    MEMBER_GENDER VARCHAR2(5 CHAR) NOT NULL CHECK(MEMBER_GENDER IN('��','��')),
    MEMBER_EMAIL VARCHAR2(50 CHAR)
);
 
CREATE TABLE REVIEW(
    REVIEW_ID NUMBER(5) PRIMARY KEY,
    REVIEW_TITLE VARCHAR2(50 CHAR) NOT NULL,
    REVIEW_CONTENTS VARCHAR2(200 CHAR),
    REVIEW_DATE DATE NOT NULL,
    MEMBER_ID VARCHAR2(20 CHAR) NOT NULL REFERENCES MEMBER(MEMBER_ID),
    RES_ID NUMBER(10) NOT NULL REFERENCES RESTAURANT(RES_ID),
    RES_NAME VARCHAR2(30 CHAR) NOT NULL,
    REVIEW_IMG1 VARCHAR2(100 CHAR),
    REVIEW_IMG2 VARCHAR2(100 CHAR),
    REVIEW_IMG3 VARCHAR2(100 CHAR),
    REVIEW_ISLIKE VARCHAR2(5) NOT NULL CHECK(REVIEW_ISlIKE IN('true','false'))
);

CREATE TABLE BOOKMARK(
    BOOKMARK_ID NUMBER(5) PRIMARY KEY,
    MEMBER_ID VARCHAR2(20 CHAR) NOT NULL REFERENCES MEMBER(MEMBER_ID),
    RES_ID NUMBER(10) NOT NULL REFERENCES RESTAURANT(RES_ID)
);

CREATE TABLE RECOMMEND(
    RECOMMEND_ID NUMBER(10) PRIMARY KEY,
    MEMBER_ID VARCHAR2(20 CHAR) NOT NULL REFERENCES MEMBER(MEMBER_ID),
    REVIEW_ID NUMBER(5) REFERENCES REVIEW(REVIEW_ID)
);


select * from restaurant;
delete from restaurant;
----------������

CREATE SEQUENCE REVIEW_SEQ 
START WITH 1
INCREMENT BY 1
NOCACHE; 

CREATE SEQUENCE BOOKMARK_SEQ 
START WITH 1
INCREMENT BY 1
NOCACHE; 

CREATE SEQUENCE RECOMMEND_SEQ 
START WITH 1
INCREMENT BY 1
NOCACHE; 



drop SEQUENCE RES_SEQ;
drop SEQUENCE REVIEW_SEQ;
drop SEQUENCE BOOKMARK_SEQ;
drop SEQUENCE RECOMMEND_SEQ;

CREATE SEQUENCE REVIEW_SEQ;

