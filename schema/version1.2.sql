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

SELECT RES_NAME,REVIEW_IMG1 FROM REVIEW WHERE MEMBER_ID='kim'
SELECT RES_NAME,REVIEW_IMG1 FROM REVIEW
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


----------������
CREATE SEQUENCE RES_SEQ 
START WITH 1
INCREMENT BY 1
NOCACHE;

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

