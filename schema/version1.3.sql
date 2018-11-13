-----------------Table create----------------
--������ table create
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

--ȸ�� table create
CREATE TABLE MEMBER(
    MEMBER_ID VARCHAR2(20 CHAR) PRIMARY KEY,
    MEMBER_PWD VARCHAR2(20 CHAR) NOT NULL,
    MEMBER_NAME VARCHAR2(10 CHAR) NOT NULL,
    MEMBER_PHONE VARCHAR2(20 CHAR) NOT NULL,
    MEMBER_GENDER VARCHAR2(5 CHAR) NOT NULL CHECK(MEMBER_GENDER IN('��','��')),
    MEMBER_EMAIL VARCHAR2(50 CHAR)
);

--���� table create
CREATE TABLE REVIEW(
    REVIEW_ID NUMBER(5) PRIMARY KEY,
    REVIEW_TITLE VARCHAR2(50 CHAR) NOT NULL,
    REVIEW_CONTENTS VARCHAR2(200 CHAR),
    REVIEW_DATE DATE NOT NULL,
    MEMBER_ID VARCHAR2(20 CHAR) NOT NULL REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,
    RES_ID NUMBER(10) NOT NULL REFERENCES RESTAURANT(RES_ID) ON DELETE CASCADE,
    RES_NAME VARCHAR2(30 CHAR) NOT NULL,
    REVIEW_IMG1 VARCHAR2(100 CHAR),
    REVIEW_IMG2 VARCHAR2(100 CHAR),
    REVIEW_IMG3 VARCHAR2(100 CHAR),
    REVIEW_ISLIKE VARCHAR2(5) NOT NULL CHECK(REVIEW_ISlIKE IN('true','false'))
);

--�ϸ�ũ(���ã��) table create
CREATE TABLE BOOKMARK(
    BOOKMARK_ID NUMBER(5) PRIMARY KEY,
    MEMBER_ID VARCHAR2(20 CHAR) NOT NULL REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,
    RES_ID NUMBER(10) NOT NULL REFERENCES RESTAURANT(RES_ID) ON DELETE CASCADE
);

--���� ���ƿ� table create
CREATE TABLE RECOMMEND(
    RECOMMEND_ID NUMBER(10) PRIMARY KEY,
    MEMBER_ID VARCHAR2(20 CHAR) NOT NULL REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,
    REVIEW_ID NUMBER(5) REFERENCES REVIEW(REVIEW_ID) ON DELETE CASCADE
);

--������
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

===================================================================================================================================

-------------- drop table---------------------
drop table RECOMMEND;
drop table BOOKMARK;
drop table REVIEW;
drop table MEMBER;
drop table RESTAURANT;

drop SEQUENCE REVIEW_SEQ;
drop SEQUENCE BOOKMARK_SEQ;
drop SEQUENCE RECOMMEND_SEQ;

===================================================================================================================================

-------------- delete table---------------------
--�ȿ� �� ���� delete
delete from review;
delete from bookmark;
delete from recommend;

===================================================================================================================================
select * from restaurant where res_category like '�н�'
select * from member
SELECT RES_ID, RES_NAME,REVIEW_IMG1 FROM REVIEW WHERE member_id='aaa'
------------- ȸ�� insert �� -----------------------
--ȸ�����̺� insert 10��
insert into member values('aaa', 'aaa', '������', '010-8875-8253', 
   	'��', '8253jang@daum.net');
insert into member values('bbb', 'bbb', '�̼���', '010-2770-9755', 
   	'��', 'heartrecycle95@gmail.com');
insert into member values('ccc', 'ccc', '���ѳ�', '010-2629-1085', 
   	'��', 'tngus1085@naver.com');
insert into member values('ddd', 'ddd', '������', '010-9105-2466', 
	'��', 'eoun24@gmail.com');
insert into member values('eee', 'eee', '��ȣ��', '010-3403-9195', 
   	'��', 'ghtnfhf94@naver.com');
insert into member values('fff', 'fff', '�輺ȣ', '010-1111-1111', 
   	'��', 'power16230@gmail.com');
insert into member values('ggg', 'ggg', '���ÿ�', '010-1111-1111', 
   	'��', 'nsw9211@naver.com');
insert into member values('hhh', 'hhh', '������', '010-1111-1111', 
   	'��', 'hhh@gmail.com');
insert into member values('iii', 'iii', '�ڼ���', '010-7190-1214', 
   	'��', 'iii@gmail.com');
insert into member values('jjj', 'jjj', '������', '010-1111-1111', 
   	'��', 'jjj@gmail.com');

   	
===================================================================================================================================

-------------  ���� insert �� -----------------------
   	
--�ѽ� ���� insert
----12482031	���¸��δ��

select * from review where review_id=60;

insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�� �δ�� ���� ���־��!', '���� �ְ� ���� ������� ��湮 �ǻ� ������ �ֽ��ϴ�~', sysdate, 'aaa', 12482031, '���¸��δ��', 
   'reviewPics/hansick1.png','reviewPics/hansick2.JPG','reviewPics/hansick3.png','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���߾��', '���ƾƾƤ� �� �� ���� �;��!', sysdate, 'bbb', 12482031, '���¸��δ��', 
   'reviewPics/hansick4.jpg','reviewPics/hansick5.bmp',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ����ʹµ�...', '������� ä���ִ� �� ���� �Ļ翴���ϴ�.', sysdate, 'ccc', 12482031, '���¸��δ��', 
   'reviewPics/hansick6.png', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����!', '������ ���� �������� ������!! �̰� 4�λ��̶�°� �ϰ�������?? ���� �� �Ծ����ϴ�~', sysdate, 'ddd', 12482031, '���¸��δ��', 
   'reviewPics/hansick7.jpg', null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��...', '����ߴ� ���� �ƴϾ ���Ŵϴ�.', sysdate, 'eee', 12482031, '���¸��δ��', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'soso', '�ٽ� �� ������ ���� �� ���ƿ� ��', sysdate, 'fff', 12482031, '���¸��δ��', 
   null, null, null,'false');


----12489990	�����������屹
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���屹 �±�', '�Բ� ������ �����鵵 ���ְ� ���屹 ������ ���������� ���� ��õ�� �帮�� ���� ���̿���~', sysdate, 'aaa', 12489990, '�����������屹', 
   'reviewPics/hansick8.png','reviewPics/hansick9.png','reviewPics/hansick10','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�� �� �ް� ���� �����߿� ���� ���־����ϴ�!', sysdate, 'eee', 12489990, '�����������屹', 
   'reviewPics/hansick11.jpg','reviewPics/hansick12.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���ƿ�', '���� �� ���Ҿ��', sysdate, 'ccc', 12489990, '�����������屹', 
   'reviewPics/hansick13.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�״�..', 'Ư���Ѱ� �������ϴ�.', sysdate, 'ggg', 12489990, '�����������屹', 
   'reviewPics/hansick14.jpg', null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�׳� �׷���', '���� ���ο��� ������� ģ���ϼ̾��', sysdate, 'aaa', 12489990, '�����������屹', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ����', '�� ���ְ� ���� �Ļ縦 ����?', sysdate, 'fff', 12489990, '�����������屹', 
   null, null, null,'false');

----12492426	�����¡��
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ����', '������ �����⿴���ϴ�.. �ò������� ���� �Ⱦ��ϴºе鲲 ��õ�帳�ϴ�.', sysdate, 'aaa', 12492426, '�����¡��', 
   'reviewPics/hansick15.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�ٸ� ü�����̶� ����߽��ϴ�.', sysdate, 'eee', 12492426, '�����¡��', 
   'reviewPics/hansick16.jpg','reviewPics/hansick17.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������', '��簡 �ȵǴ� ������ �˰���', sysdate, 'hhh', 12492426, '�����¡��', 
   'reviewPics/hansick18.JPG', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��..', 'ģ���� �������� �����µ� ��и� �������׿�.. ���� ���������� ������!!', sysdate, 'ggg', 12492426, '�����¡��', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �����մϴ�', '�� ���� ��簡 �� �� �ǳ���? ������������ �����ִٰ� �����淡 ���µ� ��.. �ð��� �ǵ����� �;��', sysdate, 'jjj', 12492426, '�����¡��', 
   'reviewPics/hansick19.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�մ��� ���� ���̺� ��..', sysdate, 'fff', 12492426, '�����¡��', 
   null, null, null,'false');
   
----12508903	�ŵ��ǼŸ�
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�ҹ��� ����!', '�� ���� ��ٸ� ������ �ְ� ���� ���־����!! ���� ���̵� ���� �� �Ծ���ϴ�~', sysdate, 'aaa', 12508903, '�ŵ��ǼŸ�', 
   'reviewPics/hansick20.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���ƿ�', '�������� ������ ��� ������ �� �����Դϴ�', sysdate, 'bbb', 12508903, '�ŵ��ǼŸ�', 
   'reviewPics/hansick21.JPG','reviewPics/hansick22.png','reviewPics/hansick23.png','true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����~~', '���� ������ �����̳׿�', sysdate, 'iii', 12508903, '�ŵ��ǼŸ�', 
   'reviewPics/hansick24.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'ã�Ҵ� �� ���', 'ã�Ҵ� �� ���~ ���� ã�� ���~ ', sysdate, 'ggg', 12508903, '�ŵ��ǼŸ�', 
   null, null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ ����', '�������� ã�ƿ��� �������� ���� �ٳ఩�ϴ�', sysdate, 'jjj', 12508903, '�ŵ��ǼŸ�', 
   'reviewPics/hansick25.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �ִµ�..', '�� �ð��̳� ��ٷ��� ���Ծ�� �Ф� �� ���� ��ٸ� ���� �ƴϿ���..', sysdate, 'fff', 12508903, '�ŵ��ǼŸ�', 
   'reviewPics/hansick26.jpg', null, null,'false');
   
   
----12510865	������ǹ��
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'ĳĳĳĳĳĳ���ִ�', '�̷��� ������ �� �ִ°ǰ���? �λ� ���� ã�ҽ��ϴ�.. ��â�ϼ���!!', sysdate, 'bbb', 12510865, '������ǹ��', 
   'reviewPics/hansick27.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����� �߻�����!!!', '���� ������ ����� ���� �ɴϴ٤�����', sysdate, 'ccc', 12510865, '������ǹ��', 
   'reviewPics/hansick28.jpg','reviewPics/hansick29.jpg', null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ��õ', '������ �� ���־���� ������ �׷��� ���־����!', sysdate, 'iii', 12510865, '������ǹ��', 
   'reviewPics/hansick30.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ�� ���ؿ� ��', '���� ���־��� ���ο���.. ', sysdate, 'aaa', 12510865, '������ǹ��', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�׳� ���� �׷���', '������� �߻���̽��ϴ�', sysdate, 'eee', 12510865, '������ǹ��', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�Ӹ�ī�� ���Խ��ϴ�', '�����ߴµ� ���� ���� ����ϴ�����? �ٽ� �� ���ϴ�.', sysdate, 'fff', 12510865, '������ǹ��', 
   null , null, null,'false');
   
   
----12515776	�ڰ��δ��
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����!', '���� �ٳ�Դµ� ���� �� ���� �;��!!', sysdate, 'bbb', 12515776, '�ڰ��δ��', 
   'reviewPics/hansick31.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �����մϴ�!', '���ְ� �� �԰� ���ϴ�~', sysdate, 'ddd', 12515776, '�ڰ��δ��', 
   'reviewPics/hansick32.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�׳� sns����', '������ ���� ���׿�', sysdate, 'hhh', 12515776, '�ڰ��δ��', 
   'reviewPics/hansick33.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ�� ���ؿ� ��', '���� ���־��� ���ο���.. ', sysdate, 'aaa', 12515776, '�ڰ��δ��', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�칰�칰,,,', '���� ��ų ������ �� �ϴ� �����̾����ϴ�...', sysdate, 'eee', 12515776, '�ڰ��δ��', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������� ���ο���', 'ī�� ���� �Ѵٰ� �ϴϱ� �ý÷� �ý÷�...', sysdate, 'ccc', 12515776, '�ڰ��δ��', 
   null , null, null,'false');
   
----12518533	����������
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�� �� ����!', '���� ���� ���߾��~~ ����� �˷��ּ���!!', sysdate, 'bbb', 12518533, '����������', 
   'reviewPics/hansick34.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ �����ؿ�!', '���� �ͼ� ������ ��� ���ִٰ� �Ͻó׿䤾�� �����մϴ�!!', sysdate, 'aaa', 12518533, '����������', 
   'reviewPics/hansick35.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ �����ƿ�', '����� �˾Ҵµ� ������ �����ؼ� ������', sysdate, 'fff', 12518533, '����������', 
   'reviewPics/hansick36.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�� ���� �Ǵ� ��', '���� �ƴ� �׷� ���̿���. ���� ���� ���ñ�', sysdate, 'jjj', 12518533, '����������', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �� �̷��� ����?', '���� �ڿ� ���̶�� �̷��� ���� �ֽŰ���..', sysdate, 'eee', 12518533, '����������', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��-��', 'ã�ư����� ���� ���̿���', sysdate, 'ccc', 12518533, '����������', 
   null , null, null,'false');
   
   
----12520860	�缱��
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�ʹ� ���־��~~', '���� ���� �� ��Ҿ��! ������ ���� ���̵�޴� �����Կ�~', sysdate, 'bbb', 12520860, '�缱��', 
   'reviewPics/hansick37.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�Ը� ���� �� ���̿���', '�� ��ĥ ������ �Ը��� ���ƿԾ�䤾��', sysdate, 'hhh', 12520860, '�缱��', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�ʹ� ¥��', '�߸��ؼ� �ұ��� ������ �� �ƴѰ���?', sysdate, 'ggg', 12520860, '�缱��', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���� �Ǵ� �� ���ƿ�', '���� ���� �ڱ����̿��� �Ф� �ֵ��� �� �԰ھ��', sysdate, 'jjj', 12520860, '�缱��', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�Ǹ�..', '������ �����Ҵµ� �̹����� ���� ���׿�Ф�', sysdate, 'eee', 12520860, '�缱��', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���Һ�', '���� ������ ���� ���Һ��� �� ���ƿ�..', sysdate, 'ccc', 12520860, '�缱��', 
   null , null, null,'false');

   
----12521964	�ƺ�
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�� �� ����', '����� �Ÿ� �������� ���� ���� �� �� ���׿�~', sysdate, 'aaa', 12521964, '�ƺ�', 
   'reviewPics/hansick38.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ�ؿ�!', '���� �������� �ʾƵ� �������ؿ�~', sysdate, 'bbb', 12521964, '�ƺ�', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ ���� ��', '�쿬�� �湮�ߴµ� ���� ������ �ϳ��� ���� ���̾����..', sysdate, 'ggg', 12521964, '�ƺ�', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'û�� �����̿���!', '�������� �����鵵 ���̰� ������ ���� �ٴϰ�... ���� �Ĵ� �� �³���?', sysdate, 'fff', 12521964, '�ƺ�', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�����.. �̰� �ƴ� �� ���ƿ�', sysdate, 'eee', 12521964, '�ƺ�', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��...', '�� �Ʊ����ϴ� ����', sysdate, 'ccc', 12521964, '�ƺ�', 
   null , null, null,'false');
   
----12523192	�����ǰ����
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ ��', '�ʹ� ���ִ°� �ƴѰ���?', sysdate, 'ddd', 12523192, '�����ǰ����', 
   'reviewPics/hansick39.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���׸�� ������!', '�÷����õ� �±�', sysdate, 'bbb', 12523192, '�����ǰ����', 
   'reviewPics/hansick40.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���˹ٻ� ���� �����ؿ�', '��䵵 �� �ϰ� ��� ���� ���� �ִ��� ������ �ٽ� ���Ѿ� �� �� ���ƿ�', sysdate, 'ggg', 12523192, '�����ǰ����', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '��ü �̰� ���� ���ΰ���???', sysdate, 'iii', 12523192, '�����ǰ����', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�˹ٻ� �ΰ���...', '��û �����ϰ� �ϵ� �� �ϰ� ��ȭ�� �� �׷��� ���� �ϴ���...', sysdate, 'eee', 12523192, '�����ǰ����', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���ο���', '���� �� �� �� �̻��� �ٶ��� �ʴ°� ���ƿ�', sysdate, 'ccc', 12523192, '�����ǰ����', 
   null , null, null,'false');

   

   	
-- �н�ƮǪ�� ���� insert
11978126	������
11982599	���͹���
12044056	�����Ƹ޸�ĭ
12044153	�������ͽ�������
12075614	��Ű����
12097387	��������
12115686	JBLIAB
12115833	KERVAN
12115836	Mody-Dick
-12115881	������ġŲ

----11978126	������

select * from review;

insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���־��!', '���� �ְ� ���� ������� ��湮 �ǻ� ������ �ֽ��ϴ�~', sysdate, 'ggg', 11978126, '������', 
   'reviewPics/fastfood1.jpg','reviewPics/fastfood2.jpg','reviewPics/fastfood3.jpg','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���߾��', '���ƾƾƤ� �� �� ���� �;��!', sysdate, 'aaa', 11978126, '������', 
   'reviewPics/fastfood4.jpg','reviewPics/fastfood5.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ����ʹµ�...', '������� ä���ִ� �� ���� �Ļ翴���ϴ�.', sysdate, 'ccc', 11978126, '������', 
   'reviewPics/fastfood6.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����!', '���� �� �Ծ����ϴ�~', sysdate, 'ddd', 11978126, '������', 
   'reviewPics/fastfood7.jpg', null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��...', '����ߴ� ���� �ƴϾ ���Ŵϴ�.', sysdate, 'eee', 11978126, '������', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'soso', '�ٽ� �� ������ ���� �� ���ƿ� ��', sysdate, 'fff', 11978126, '������', 
   null, null, null,'false');


----11982599	���͹���
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�±�', '�Բ� ������ �����鵵 ���ְ� ������ ���������� ���� ��õ�� �帮�� ���� ���̿���~', sysdate, 'iii', 11982599, '���͹���', 
   'reviewPics/fastfood8.jpg','reviewPics/fastfood9.jpg','reviewPics/fastfood10.jpg','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�� �� �ް� ���� �����߿� ���� ���־����ϴ�!', sysdate, 'eee', 11982599, '���͹���', 
   'reviewPics/fastfood11.jpg','reviewPics/fastfood12.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���ƿ�', '���� �� ���Ҿ��', sysdate, 'ccc', 11982599, '���͹���', 
   'reviewPics/fastfood13.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�״�..', 'Ư���Ѱ� �������ϴ�.', sysdate, 'bbb', 11982599, '���͹���', 
   'reviewPics/fastfood14.jpg', null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�׳� �׷���', '���� ���ο��� ������� ģ���ϼ̾��', sysdate, 'jjj', 11982599, '���͹���', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ����', '�� ���ְ� ���� �Ļ縦 ����?', sysdate, 'fff', 11982599, '���͹���', 
   null, null, null,'false');

----12044056	�����Ƹ޸�ĭ
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ����', '������ �����⿴���ϴ�.. �ò������� ���� �Ⱦ��ϴºе鲲 ��õ�帳�ϴ�.', sysdate, 'iii', 12044056, '�����Ƹ޸�ĭ', 
   'reviewPics/fastfood15.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�ٸ� ü�����̶� ����߽��ϴ�.', sysdate, 'eee', 12044056, '�����Ƹ޸�ĭ', 
   'reviewPics/fastfood16.jpg','reviewPics/fastfood17.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������', '��簡 �ȵǴ� ������ �˰���', sysdate, 'hhh', 12044056, '�����Ƹ޸�ĭ', 
   'reviewPics/fastfood18.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��..', 'ģ���� �������� �����µ� ��и� �������׿�.. ���� ���������� ������!!', sysdate, 'ggg', 12044056, '�����Ƹ޸�ĭ', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �����մϴ�', '�� ���� ��簡 �� �� �ǳ���? ������������ �����ִٰ� �����淡 ���µ� ��.. �ð��� �ǵ����� �;��', sysdate, 'jjj', 12044056, '�����Ƹ޸�ĭ', 
   'reviewPics/fastfood19.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�մ��� ���� ���̺� ��..', sysdate, 'fff', 12044056, '�����Ƹ޸�ĭ', 
   null, null, null,'false');
   
----12044153	�������ͽ�������
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�ҹ��� ����!', '�� ���� ��ٸ� ������ �ְ� ���� ���־����!! ���� ���̵� ���� �� �Ծ���ϴ�~', sysdate, 'ccc', 12044153, '�������ͽ�������', 
   'reviewPics/fastfood20.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���ƿ�', '�������� ������ ��� ������ �� �����Դϴ�', sysdate, 'bbb', 12044153, '�������ͽ�������', 
   'reviewPics/fastfood21.jpg','reviewPics/fastfood22.jpg','reviewPics/fastfood23.jpg','true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����~~', '���� ������ �����̳׿�', sysdate, 'iii', 12044153, '�������ͽ�������', 
   'reviewPics/fastfood24.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'ã�Ҵ� �� ���', 'ã�Ҵ� �� ���~ ���� ã�� ���~ ', sysdate, 'ggg', 12044153, '�������ͽ�������', 
   null, null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ ����', '�������� ã�ƿ��� �������� ���� �ٳ఩�ϴ�', sysdate, 'jjj', 12044153, '�������ͽ�������', 
   'reviewPics/fastfood25.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �ִµ�..', '�� �ð��̳� ��ٷ��� ���Ծ�� �Ф� �� ���� ��ٸ� ���� �ƴϿ���..', sysdate, 'fff', 12044153, '�������ͽ�������', 
   'reviewPics/fastfood26.jpg', null, null,'false');
   
   
----12075614	��Ű����
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'ĳĳĳĳĳĳ���ִ�', '�̷��� ������ �� �ִ°ǰ���? �λ� ���� ã�ҽ��ϴ�.. ��â�ϼ���!!', sysdate, 'bbb', 12075614, '��Ű����', 
   'reviewPics/fastfood27.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����� �߻�����!!!', '���� ������ ����� ���� �ɴϴ٤�����', sysdate, 'ccc', 12075614, '��Ű����', 
   'reviewPics/fastfood28.jpg','reviewPics/fastfood29.jpg', null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ��õ', '������ �� ���־���� ������ �׷��� ���־����!', sysdate, 'iii', 12075614, '��Ű����', 
   'reviewPics/fastfood30.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ�� ���ؿ� ��', '���� ���־��� ���ο���.. ', sysdate, 'jjj', 12075614, '��Ű����', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�׳� ���� �׷���', '������� �߻���̽��ϴ�', sysdate, 'aaa', 12075614, '��Ű����', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�Ӹ�ī�� ���Խ��ϴ�', '�����ߴµ� ���� ���� ����ϴ�����? �ٽ� �� ���ϴ�.', sysdate, 'fff', 12075614, '��Ű����', 
   null , null, null,'false');
   
   
----12097387	��������
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����!', '���� �ٳ�Դµ� ���� �� ���� �;��!!', sysdate, 'bbb', 12097387, '��������', 
   'reviewPics/fastfood31.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �����մϴ�!', '���ְ� �� �԰� ���ϴ�~', sysdate, 'ddd', 12097387, '��������', 
   'reviewPics/fastfood32.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�׳� sns����', '������ ���� ���׿�', sysdate, 'hhh', 12097387, '��������', 
   'reviewPics/fastfood33.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ�� ���ؿ� ��', '���� ���־��� ���ο���.. ', sysdate, 'iii', 12097387, '��������', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�칰�칰,,,', '���� ��ų ������ �� �ϴ� �����̾����ϴ�...', sysdate, 'eee', 12097387, '��������', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������� ���ο���', 'ī�� ���� �Ѵٰ� �ϴϱ� �ý÷� �ý÷�...', sysdate, 'ccc', 12097387, '��������', 
   null , null, null,'false');
   
----12115686	JBLIAB
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�� �� ����!', '���� ���� ���߾��~~ ����� �˷��ּ���!!', sysdate, 'bbb', 12115686, 'JBLIAB', 
   'reviewPics/fastfood34.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ �����ؿ�!', '���� �ͼ� ������ ��� ���ִٰ� �Ͻó׿䤾�� �����մϴ�!!', sysdate, 'ddd', 12115686, 'JBLIAB', 
   'reviewPics/fastfood35.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ �����ƿ�', '����� �˾Ҵµ� ������ �����ؼ� ������', sysdate, 'fff', 12115686, 'JBLIAB', 
   'reviewPics/fastfood36.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�� ���� �Ǵ� ��', '���� �ƴ� �׷� ���̿���. ���� ���� ���ñ�', sysdate, 'aaa', 12115686, 'JBLIAB', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �� �̷��� ����?', '���� �ڿ� ���̶�� �̷��� ���� �ֽŰ���..', sysdate, 'eee', 12115686, 'JBLIAB', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��-��', 'ã�ư����� ���� ���̿���', sysdate, 'ccc', 12115686, 'JBLIAB', 
   null , null, null,'false');
   
   
----12115833	KERVAN
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�ʹ� ���־��~~', '���� ���� �� ��Ҿ��! ������ ���� ���̵�޴� �����Կ�~', sysdate, 'bbb', 12115833, 'KERVAN', 
   'reviewPics/fastfood37.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�Ը� ���� �� ���̿���', '�� ��ĥ ������ �Ը��� ���ƿԾ�䤾��', sysdate, 'hhh', 12115833, 'KERVAN', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�ʹ� ¥��', '�߸��ؼ� �ұ��� ������ �� �ƴѰ���?', sysdate, 'ggg', 12115833, 'KERVAN', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���� �Ǵ� �� ���ƿ�', '���� ���� �ڱ����̿��� �Ф� �ֵ��� �� �԰ھ��', sysdate, 'jjj', 12115833, 'KERVAN', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�Ǹ�..', '������ �����Ҵµ� �̹����� ���� ���׿�Ф�', sysdate, 'eee', 12115833, 'KERVAN', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���Һ�', '���� ������ ���� ���Һ��� �� ���ƿ�..', sysdate, 'ccc', 12115833, 'KERVAN', 
   null , null, null,'false');

   
----12115836	Mody-Dick
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�� �� ����', '����� �Ÿ� �������� ���� ���� �� �� ���׿�~', sysdate, 'ddd', 12115836, 'Mody-Dick', 
   'reviewPics/fastfood38.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ�ؿ�!', '���� �������� �ʾƵ� �������ؿ�~', sysdate, 'bbb', 12115836, 'Mody-Dick', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ ���� ��', '�쿬�� �湮�ߴµ� ���� ������ �ϳ��� ���� ���̾����..', sysdate, 'ggg', 12115836, 'Mody-Dick', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'û�� �����̿���!', '�������� �����鵵 ���̰� ������ ���� �ٴϰ�... ���� �Ĵ� �� �³���?', sysdate, 'fff', 12115836, 'Mody-Dick', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�����.. �̰� �ƴ� �� ���ƿ�', sysdate, 'eee', 12115836, 'Mody-Dick', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��...', '�� �Ʊ����ϴ� ����', sysdate, 'ccc', 12115836, 'Mody-Dick', 
   null , null, null,'false');
   
----12115881	������ġŲ
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ ��', '�ʹ� ���ִ°� �ƴѰ���?', sysdate, 'ddd', 12115881, '������ġŲ', 
   'reviewPics/fastfood39.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���׸�� ������!', '�÷����õ� �±�', sysdate, 'bbb', 12115881, '������ġŲ', 
   'reviewPics/fastfood40.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���˹ٻ� ���� �����ؿ�', '��䵵 �� �ϰ� ��� ���� ���� �ִ��� ������ �ٽ� ���Ѿ� �� �� ���ƿ�', sysdate, 'ggg', 12115881, '������ġŲ', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '��ü �̰� ���� ���ΰ���???', sysdate, 'iii', 12115881, '������ġŲ', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�˹ٻ� �ΰ���...', '��û �����ϰ� �ϵ� �� �ϰ� ��ȭ�� �� �׷��� ���� �ϴ���...', sysdate, 'eee', 12115881, '������ġŲ', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���ο���', '���� �� �� �� �̻��� �ٶ��� �ʴ°� ���ƿ�', sysdate, 'ccc', 12115881, '������ġŲ', 
   null , null, null,'false');

--�߽� ���� insert
19947716	�ͽ�
20092017	���ؿ�
20252806	Ī����
20295124	����¡���丮
20601752	�̰���«��
23315062	������
23354843	�ϰ�����
23386721	�ع���
23387779	��Ʈ�����̳�
23680479	�����Ÿ���̳�


----19947716	�ͽ�

select * from review;

insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���־��!', '���� �ְ� ���� ������� ��湮 �ǻ� ������ �ֽ��ϴ�~', sysdate, 'ggg', 19947716, '�ͽ�', 
   'reviewPics/china1.jpg','reviewPics/china2.jpg','reviewPics/china3.jpg','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���߾��', '���ƾƾƤ� �� �� ���� �;��!', sysdate, 'iii', 19947716, '�ͽ�', 
   'reviewPics/china4.jpg','reviewPics/china5.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ����ʹµ�...', '������� ä���ִ� �� ���� �Ļ翴���ϴ�.', sysdate, 'ccc', 19947716, '�ͽ�', 
   'reviewPics/china6.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����!', '���� �� �Ծ����ϴ�~', sysdate, 'ddd', 19947716, '�ͽ�', 
   'reviewPics/china7.jpg', null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��...', '����ߴ� ���� �ƴϾ ���Ŵϴ�.', sysdate, 'eee', 19947716, '�ͽ�', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'soso', '�ٽ� �� ������ ���� �� ���ƿ� ��', sysdate, 'fff', 19947716, '�ͽ�', 
   null, null, null,'false');


----20092017	���ؿ�
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�±�', '�Բ� ������ �����鵵 ���ְ� ������ ���������� ���� ��õ�� �帮�� ���� ���̿���~', sysdate, 'iii', 20092017, '���ؿ�', 
   'reviewPics/china8.jpg','reviewPics/china9.jpg','reviewPics/china10.jpg','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�� �� �ް� ���� �����߿� ���� ���־����ϴ�!', sysdate, 'eee', 20092017, '���ؿ�', 
   'reviewPics/china11.jpg','reviewPics/china12.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���ƿ�', '���� �� ���Ҿ��', sysdate, 'ccc', 20092017, '���ؿ�', 
   'reviewPics/china13.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�״�..', 'Ư���Ѱ� �������ϴ�.', sysdate, 'bbb', 20092017, '���ؿ�', 
   'reviewPics/china14.jpg', null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�׳� �׷���', '���� ���ο��� ������� ģ���ϼ̾��', sysdate, 'jjj', 20092017, '���ؿ�', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ����', '�� ���ְ� ���� �Ļ縦 ����?', sysdate, 'fff', 20092017, '���ؿ�', 
   null, null, null,'false');

----20252806	Ī����
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ����', '������ �����⿴���ϴ�.. �ò������� ���� �Ⱦ��ϴºе鲲 ��õ�帳�ϴ�.', sysdate, 'iii', 20252806, 'Ī����', 
   'reviewPics/china15.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�ٸ� ü�����̶� ����߽��ϴ�.', sysdate, 'eee', 20252806, 'Ī����', 
   'reviewPics/china16.jpg','reviewPics/china17.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������', '��簡 �ȵǴ� ������ �˰���', sysdate, 'hhh', 20252806, 'Ī����', 
   'reviewPics/china18.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��..', 'ģ���� �������� �����µ� ��и� �������׿�.. ���� ���������� ������!!', sysdate, 'ggg', 20252806, 'Ī����', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �����մϴ�', '�� ���� ��簡 �� �� �ǳ���? ������������ �����ִٰ� �����淡 ���µ� ��.. �ð��� �ǵ����� �;��', sysdate, 'jjj', 20252806, 'Ī����', 
   'reviewPics/china19.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�մ��� ���� ���̺� ��..', sysdate, 'fff', 20252806, 'Ī����', 
   null, null, null,'false');
   
----20295124	����¡���丮
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�ҹ��� ����!', '�� ���� ��ٸ� ������ �ְ� ���� ���־����!! ���� ���̵� ���� �� �Ծ���ϴ�~', sysdate, 'ccc', 20295124, '����¡���丮', 
   'reviewPics/china20.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���ƿ�', '�������� ������ ��� ������ �� �����Դϴ�', sysdate, 'bbb', 20295124, '����¡���丮', 
   'reviewPics/china21.jpg','reviewPics/china22.jpg','reviewPics/china23.jpg','true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����~~', '���� ������ �����̳׿�', sysdate, 'iii', 20295124, '����¡���丮', 
   'reviewPics/china24.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'ã�Ҵ� �� ���', 'ã�Ҵ� �� ���~ ���� ã�� ���~ ', sysdate, 'ggg', 20295124, '����¡���丮', 
   null, null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ ����', '�������� ã�ƿ��� �������� ���� �ٳ఩�ϴ�', sysdate, 'jjj', 20295124, '����¡���丮', 
   'reviewPics/china25.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �ִµ�..', '�� �ð��̳� ��ٷ��� ���Ծ�� �Ф� �� ���� ��ٸ� ���� �ƴϿ���..', sysdate, 'fff', 20295124, '����¡���丮', 
   'reviewPics/china26.jpg', null, null,'false');
   
   
----20601752	�̰���«��
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'ĳĳĳĳĳĳ���ִ�', '�̷��� ������ �� �ִ°ǰ���? �λ� ���� ã�ҽ��ϴ�.. ��â�ϼ���!!', sysdate, 'bbb', 20601752, '�̰���«��', 
   'reviewPics/china27.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����� �߻�����!!!', '���� ������ ����� ���� �ɴϴ٤�����', sysdate, 'ccc', 20601752, '�̰���«��', 
   'reviewPics/china28.jpg','reviewPics/china29.jpg', null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ��õ', '������ �� ���־���� ������ �׷��� ���־����!', sysdate, 'iii', 20601752, '�̰���«��', 
   'reviewPics/china30.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ�� ���ؿ� ��', '���� ���־��� ���ο���.. ', sysdate, 'jjj', 20601752, '�̰���«��', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�׳� ���� �׷���', '������� �߻���̽��ϴ�', sysdate, 'ggg', 20601752, '�̰���«��', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�Ӹ�ī�� ���Խ��ϴ�', '�����ߴµ� ���� ���� ����ϴ�����? �ٽ� �� ���ϴ�.', sysdate, 'fff', 20601752, '�̰���«��', 
   null , null, null,'false');
   
   
----23315062	������
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����!', '���� �ٳ�Դµ� ���� �� ���� �;��!!', sysdate, 'bbb', 23315062, '������', 
   'reviewPics/china31.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �����մϴ�!', '���ְ� �� �԰� ���ϴ�~', sysdate, 'ddd', 23315062, '������', 
   'reviewPics/china32.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�׳� sns����', '������ ���� ���׿�', sysdate, 'hhh', 23315062, '������', 
   'reviewPics/china33.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ�� ���ؿ� ��', '���� ���־��� ���ο���.. ', sysdate, 'iii', 23315062, '������', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�칰�칰,,,', '���� ��ų ������ �� �ϴ� �����̾����ϴ�...', sysdate, 'eee', 23315062, '������', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������� ���ο���', 'ī�� ���� �Ѵٰ� �ϴϱ� �ý÷� �ý÷�...', sysdate, 'ccc', 23315062, '������', 
   null , null, null,'false');
   
----23354843	�ϰ�����
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�� �� ����!', '���� ���� ���߾��~~ ����� �˷��ּ���!!', sysdate, 'bbb', 23354843, '�ϰ�����', 
   'reviewPics/china34.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ �����ؿ�!', '���� �ͼ� ������ ��� ���ִٰ� �Ͻó׿䤾�� �����մϴ�!!', sysdate, 'ddd', 23354843, '�ϰ�����', 
   'reviewPics/china35.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ �����ƿ�', '����� �˾Ҵµ� ������ �����ؼ� ������', sysdate, 'fff', 23354843, '�ϰ�����', 
   'reviewPics/china36.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�� ���� �Ǵ� ��', '���� �ƴ� �׷� ���̿���. ���� ���� ���ñ�', sysdate, 'ggg', 23354843, '�ϰ�����', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �� �̷��� ����?', '���� �ڿ� ���̶�� �̷��� ���� �ֽŰ���..', sysdate, 'eee', 23354843, '�ϰ�����', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��-��', 'ã�ư����� ���� ���̿���', sysdate, 'ccc', 23354843, '�ϰ�����', 
   null , null, null,'false');
   
   
----23386721	�ع���
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�ʹ� ���־��~~', '���� ���� �� ��Ҿ��! ������ ���� ���̵�޴� �����Կ�~', sysdate, 'bbb', 23386721, '�ع���', 
   'reviewPics/china37.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�Ը� ���� �� ���̿���', '�� ��ĥ ������ �Ը��� ���ƿԾ�䤾��', sysdate, 'hhh', 23386721, '�ع���', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�ʹ� ¥��', '�߸��ؼ� �ұ��� ������ �� �ƴѰ���?', sysdate, 'ggg', 23386721, '�ع���', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���� �Ǵ� �� ���ƿ�', '���� ���� �ڱ����̿��� �Ф� �ֵ��� �� �԰ھ��', sysdate, 'jjj', 23386721, '�ع���', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�Ǹ�..', '������ �����Ҵµ� �̹����� ���� ���׿�Ф�', sysdate, 'eee', 23386721, '�ع���', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���Һ�', '���� ������ ���� ���Һ��� �� ���ƿ�..', sysdate, 'ccc', 23386721, '�ع���', 
   null , null, null,'false');

   
----23387779	��Ʈ�����̳�
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�� �� ����', '����� �Ÿ� �������� ���� ���� �� �� ���׿�~', sysdate, 'ddd', 23387779, '��Ʈ�����̳�', 
   'reviewPics/china38.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ�ؿ�!', '���� �������� �ʾƵ� �������ؿ�~', sysdate, 'bbb', 23387779, '��Ʈ�����̳�', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ ���� ��', '�쿬�� �湮�ߴµ� ���� ������ �ϳ��� ���� ���̾����..', sysdate, 'ggg', 23387779, '��Ʈ�����̳�', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'û�� �����̿���!', '�������� �����鵵 ���̰� ������ ���� �ٴϰ�... ���� �Ĵ� �� �³���?', sysdate, 'fff', 23387779, '��Ʈ�����̳�', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�����.. �̰� �ƴ� �� ���ƿ�', sysdate, 'eee', 23387779, '��Ʈ�����̳�', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��...', '�� �Ʊ����ϴ� ����', sysdate, 'ccc', 23387779, '��Ʈ�����̳�', 
   null , null, null,'false');
   
----23680479	�����Ÿ���̳�
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ ��', '�ʹ� ���ִ°� �ƴѰ���?', sysdate, 'ddd', 23680479, '�����Ÿ���̳�', 
   'reviewPics/china39.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���׸�� ������!', '�÷����õ� �±�', sysdate, 'bbb', 23680479, '�����Ÿ���̳�', 
   'reviewPics/china40.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���˹ٻ� ���� �����ؿ�', '��䵵 �� �ϰ� ��� ���� ���� �ִ��� ������ �ٽ� ���Ѿ� �� �� ���ƿ�', sysdate, 'ggg', 23680479, '�����Ÿ���̳�', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '��ü �̰� ���� ���ΰ���???', sysdate, 'iii', 23680479, '�����Ÿ���̳�', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�˹ٻ� �ΰ���...', '��û �����ϰ� �ϵ� �� �ϰ� ��ȭ�� �� �׷��� ���� �ϴ���...', sysdate, 'eee', 23680479, '�����Ÿ���̳�', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���ο���', '���� �� �� �� �̻��� �ٶ��� �ʴ°� ���ƿ�', sysdate, 'ccc', 23680479, '�����Ÿ���̳�', 
   null , null, null,'false');

   
   
   
   
   
--�Ͻ�/���깰 insert
11765479	�ູ��ġ
11795084	�ۿ�
11795380	��Ÿ�Ͼ�
11921125	������
11958020	�����ġŲ
12039136	�����ٿ�
12046493	������ġ
12054957	���ð���
12060882	���볫��
12072220	��ġ�����̺�

----11765479	�ູ��ġ
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���־��!', '���� �ְ� ���� ������� ��湮 �ǻ� ������ �ֽ��ϴ�~', sysdate, 'ggg', 11765479, '�ູ��ġ', 
   'reviewPics/ilsick1.png','reviewPics/ilsick2.JPG','reviewPics/ilsick3.jpg','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���߾��', '���ƾƾƤ� �� �� ���� �;��!', sysdate, 'iii', 11765479, '�ູ��ġ', 
   'reviewPics/ilsick4.jpg','reviewPics/ilsick5.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ����ʹµ�...', '������� ä���ִ� �� ���� �Ļ翴���ϴ�.', sysdate, 'ccc', 11765479, '�ູ��ġ', 
   'reviewPics/ilsick6.JPG', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����!', '���� �� �Ծ����ϴ�~', sysdate, 'ddd', 11765479, '�ູ��ġ', 
   'reviewPics/ilsick7.JPG', null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��...', '����ߴ� ���� �ƴϾ ���Ŵϴ�.', sysdate, 'eee', 11765479, '�ູ��ġ', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'soso', '�ٽ� �� ������ ���� �� ���ƿ� ��', sysdate, 'fff', 11765479, '�ູ��ġ', 
   null, null, null,'false');


----11795084	�ۿ�
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�±�', '�Բ� ������ �����鵵 ���ְ� ������ ���������� ���� ��õ�� �帮�� ���� ���̿���~', sysdate, 'iii', 11795084, '�ۿ�', 
   'reviewPics/ilsick8.png','reviewPics/ilsick9.JPG','reviewPics/ilsick10.JPG','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�� �� �ް� ���� �����߿� ���� ���־����ϴ�!', sysdate, 'eee', 11795084, '�ۿ�', 
   'reviewPics/ilsick11.JPG','reviewPics/ilsick12.JPG',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���ƿ�', '���� �� ���Ҿ��', sysdate, 'ccc', 11795084, '�ۿ�', 
   'reviewPics/ilsick13.JPG', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�״�..', 'Ư���Ѱ� �������ϴ�.', sysdate, 'bbb', 11795084, '�ۿ�', 
   'reviewPics/ilsick14.JPG', null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�׳� �׷���', '���� ���ο��� ������� ģ���ϼ̾��', sysdate, 'jjj', 11795084, '�ۿ�', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ����', '�� ���ְ� ���� �Ļ縦 ����?', sysdate, 'fff', 11795084, '�ۿ�', 
   null, null, null,'false');

----11795380	��Ÿ�Ͼ�
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ����', '������ �����⿴���ϴ�.. �ò������� ���� �Ⱦ��ϴºе鲲 ��õ�帳�ϴ�.', sysdate, 'iii', 11795380, '��Ÿ�Ͼ�', 
   'reviewPics/ilsick15.JPG', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�ٸ� ü�����̶� ����߽��ϴ�.', sysdate, 'eee', 11795380, '��Ÿ�Ͼ�', 
   'reviewPics/ilsick16.png','reviewPics/ilsick17.JPG',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������', '��簡 �ȵǴ� ������ �˰���', sysdate, 'hhh', 11795380, '��Ÿ�Ͼ�', 
   'reviewPics/ilsick18.JPG', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��..', 'ģ���� �������� �����µ� ��и� �������׿�.. ���� ���������� ������!!', sysdate, 'ggg', 11795380, '��Ÿ�Ͼ�', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �����մϴ�', '�� ���� ��簡 �� �� �ǳ���? ������������ �����ִٰ� �����淡 ���µ� ��.. �ð��� �ǵ����� �;��', sysdate, 'jjj', 11795380, '��Ÿ�Ͼ�', 
   'reviewPics/ilsick19.JPG', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�մ��� ���� ���̺� ��..', sysdate, 'fff', 11795380, '��Ÿ�Ͼ�', 
   null, null, null,'false');
   
----11921125	������
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�ҹ��� ����!', '�� ���� ��ٸ� ������ �ְ� ���� ���־����!! ���� ���̵� ���� �� �Ծ���ϴ�~', sysdate, 'ccc', 11921125, '������', 
   'reviewPics/ilsick20.JPG', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���ƿ�', '�������� ������ ��� ������ �� �����Դϴ�', sysdate, 'bbb', 11921125, '������', 
   'reviewPics/ilsick21.JPG','reviewPics/ilsick22.JPG','reviewPics/ilsick23.JPG','true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����~~', '���� ������ �����̳׿�', sysdate, 'iii', 11921125, '������', 
   'reviewPics/ilsick24.JPG', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'ã�Ҵ� �� ���', 'ã�Ҵ� �� ���~ ���� ã�� ���~ ', sysdate, 'ggg', 11921125, '������', 
   null, null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ ����', '�������� ã�ƿ��� �������� ���� �ٳ఩�ϴ�', sysdate, 'jjj', 11921125, '������', 
   'reviewPics/ilsick25.JPG', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �ִµ�..', '�� �ð��̳� ��ٷ��� ���Ծ�� �Ф� �� ���� ��ٸ� ���� �ƴϿ���..', sysdate, 'fff', 11921125, '������', 
   'reviewPics/ilsick26.JPG', null, null,'false');
   
   
----11958020	�����ġŲ
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'ĳĳĳĳĳĳ���ִ�', '�̷��� ������ �� �ִ°ǰ���? �λ� ���� ã�ҽ��ϴ�.. ��â�ϼ���!!', sysdate, 'bbb', 11958020, '�����ġŲ', 
   'reviewPics/ilsick27.JPG', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����� �߻�����!!!', '���� ������ ����� ���� �ɴϴ٤�����', sysdate, 'ccc', 11958020, '�����ġŲ', 
   'reviewPics/ilsick28.JPG','reviewPics/ilsick29.JPG', null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ��õ', '������ �� ���־���� ������ �׷��� ���־����!', sysdate, 'iii', 11958020, '�����ġŲ', 
   'reviewPics/ilsick30.JPG', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ�� ���ؿ� ��', '���� ���־��� ���ο���.. ', sysdate, 'jjj', 11958020, '�����ġŲ', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�׳� ���� �׷���', '������� �߻���̽��ϴ�', sysdate, 'ggg', 11958020, '�����ġŲ', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�Ӹ�ī�� ���Խ��ϴ�', '�����ߴµ� ���� ���� ����ϴ�����? �ٽ� �� ���ϴ�.', sysdate, 'fff', 11958020, '�����ġŲ', 
   null , null, null,'false');
   
   
----12039136	�����ٿ�
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����!', '���� �ٳ�Դµ� ���� �� ���� �;��!!', sysdate, 'bbb', 12039136, '�����ٿ�', 
   'reviewPics/ilsick31.JPG', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �����մϴ�!', '���ְ� �� �԰� ���ϴ�~', sysdate, 'ddd', 12039136, '�����ٿ�', 
   'reviewPics/ilsick32.JPG', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�׳� sns����', '������ ���� ���׿�', sysdate, 'hhh', 12039136, '�����ٿ�', 
   'reviewPics/ilsick33.JPG', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ�� ���ؿ� ��', '���� ���־��� ���ο���.. ', sysdate, 'iii', 12039136, '�����ٿ�', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�칰�칰,,,', '���� ��ų ������ �� �ϴ� �����̾����ϴ�...', sysdate, 'eee', 12039136, '�����ٿ�', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������� ���ο���', 'ī�� ���� �Ѵٰ� �ϴϱ� �ý÷� �ý÷�...', sysdate, 'ccc', 12039136, '�����ٿ�', 
   null , null, null,'false');
   
----12046493	������ġ
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�� �� ����!', '���� ���� ���߾��~~ ����� �˷��ּ���!!', sysdate, 'bbb', 12046493, '������ġ', 
   'reviewPics/ilsick34.JPG', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ �����ؿ�!', '���� �ͼ� ������ ��� ���ִٰ� �Ͻó׿䤾�� �����մϴ�!!', sysdate, 'ddd', 12046493, '������ġ', 
   'reviewPics/ilsick35.JPG', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ �����ƿ�', '����� �˾Ҵµ� ������ �����ؼ� ������', sysdate, 'fff', 12046493, '������ġ', 
   'reviewPicsilsick36.JPG', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�� ���� �Ǵ� ��', '���� �ƴ� �׷� ���̿���. ���� ���� ���ñ�', sysdate, 'ggg', 12046493, '������ġ', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �� �̷��� ����?', '���� �ڿ� ���̶�� �̷��� ���� �ֽŰ���..', sysdate, 'eee', 12046493, '������ġ', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��-��', 'ã�ư����� ���� ���̿���', sysdate, 'ccc', 12046493, '������ġ', 
   null , null, null,'false');
   
   
----12054957	���ð���
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�ʹ� ���־��~~', '���� ���� �� ��Ҿ��! ������ ���� ���̵�޴� �����Կ�~', sysdate, 'bbb', 12054957, '���ð���', 
   'reviewPics/ilsick37.JPG', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�Ը� ���� �� ���̿���', '�� ��ĥ ������ �Ը��� ���ƿԾ�䤾��', sysdate, 'hhh', 12054957, '���ð���', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�ʹ� ¥��', '�߸��ؼ� �ұ��� ������ �� �ƴѰ���?', sysdate, 'ggg', 12054957, '���ð���', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���� �Ǵ� �� ���ƿ�', '���� ���� �ڱ����̿��� �Ф� �ֵ��� �� �԰ھ��', sysdate, 'jjj', 12054957, '���ð���', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�Ǹ�..', '������ �����Ҵµ� �̹����� ���� ���׿�Ф�', sysdate, 'eee', 12054957, '���ð���', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���Һ�', '���� ������ ���� ���Һ��� �� ���ƿ�..', sysdate, 'ccc', 12054957, '���ð���', 
   null , null, null,'false');

   
----12060882	���볫��
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�� �� ����', '����� �Ÿ� �������� ���� ���� �� �� ���׿�~', sysdate, 'ddd', 12060882, '���볫��', 
   'reviewPics/ilsick38.JPG', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ�ؿ�!', '���� �������� �ʾƵ� �������ؿ�~', sysdate, 'bbb', 12060882, '���볫��', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ ���� ��', '�쿬�� �湮�ߴµ� ���� ������ �ϳ��� ���� ���̾����..', sysdate, 'ggg', 12060882, '���볫��', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'û�� �����̿���!', '�������� �����鵵 ���̰� ������ ���� �ٴϰ�... ���� �Ĵ� �� �³���?', sysdate, 'fff', 12060882, '���볫��', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�����.. �̰� �ƴ� �� ���ƿ�', sysdate, 'eee', 12060882, '���볫��', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��...', '�� �Ʊ����ϴ� ����', sysdate, 'ccc', 12060882, '���볫��', 
   null , null, null,'false');
   
----12072220	��ġ�����̺�
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ ��', '�ʹ� ���ִ°� �ƴѰ���?', sysdate, 'ddd', 12072220, '��ġ�����̺�', 
   'reviewPics/ilsick39.JPG', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���׸�� ������!', '�÷����õ� �±�', sysdate, 'bbb', 12072220, '��ġ�����̺�', 
   'reviewPics/ilsick40.JPG', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���˹ٻ� ���� �����ؿ�', '��䵵 �� �ϰ� ��� ���� ���� �ִ��� ������ �ٽ� ���Ѿ� �� �� ���ƿ�', sysdate, 'ggg', 12072220, '��ġ�����̺�', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '��ü �̰� ���� ���ΰ���???', sysdate, 'iii', 12072220, '��ġ�����̺�', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�˹ٻ� �ΰ���...', '��û �����ϰ� �ϵ� �� �ϰ� ��ȭ�� �� �׷��� ���� �ϴ���...', sysdate, 'eee', 12072220, '��ġ�����̺�', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���ο���', '���� �� �� �� �̻��� �ٶ��� �ʴ°� ���ƿ�', sysdate, 'ccc', 12072220, '��ġ�����̺�', 
   null , null, null,'false');
   
   
--��� ���� insert
12117128	����Ǫ��
12117339	����Ʈ����
12444335	����������
12448901	������غ���
12490565	��罺����ũ
12512013	������ũ���̺�
12548610	���������̼�
12585092	ī�򸶸�
12609192	�úξ��ǾƳ�
12612437	��Ƽ��1988

----12117128	����Ǫ��
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���־��!', '���� �ְ� ���� ������� ��湮 �ǻ� ������ �ֽ��ϴ�~', sysdate, 'ggg', 12117128, '����Ǫ��', 
   'reviewPics/yangsick1.jpg','reviewPics/yangsick2.jpg','reviewPics/yangsick3.jpg','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���߾��', '���ƾƾƤ� �� �� ���� �;��!', sysdate, 'iii', 12117128, '����Ǫ��', 
   'reviewPics/yangsick4.jpg','reviewPics/yangsick5.png',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ����ʹµ�...', '������� ä���ִ� �� ���� �Ļ翴���ϴ�.', sysdate, 'ccc', 12117128, '����Ǫ��', 
   'reviewPics/yangsick6.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����!', '���� �� �Ծ����ϴ�~', sysdate, 'ddd', 12117128, '����Ǫ��', 
   'reviewPics/yangsick7.jpg', null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��...', '����ߴ� ���� �ƴϾ ���Ŵϴ�.', sysdate, 'eee', 12117128, '����Ǫ��', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'soso', '�ٽ� �� ������ ���� �� ���ƿ� ��', sysdate, 'fff', 12117128, '����Ǫ��', 
   null, null, null,'false');


----12117339	����Ʈ����
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�±�', '�Բ� ������ �����鵵 ���ְ� ������ ���������� ���� ��õ�� �帮�� ���� ���̿���~', sysdate, 'iii', 12117339, '����Ʈ����', 
   'reviewPics/yangsick8.jpg','reviewPics/yangsick9.jpg','reviewPics/yangsick10.jpg','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�� �� �ް� ���� �����߿� ���� ���־����ϴ�!', sysdate, 'eee', 12117339, '����Ʈ����', 
   'reviewPics/yangsick11.jpg','reviewPics/yangsick12.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���ƿ�', '���� �� ���Ҿ��', sysdate, 'ccc', 12117339, '����Ʈ����', 
   'reviewPics/yangsick13.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�״�..', 'Ư���Ѱ� �������ϴ�.', sysdate, 'bbb', 12117339, '����Ʈ����', 
   'reviewPics/yangsick14.jpg', null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�׳� �׷���', '���� ���ο��� ������� ģ���ϼ̾��', sysdate, 'jjj', 12117339, '����Ʈ����', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ����', '�� ���ְ� ���� �Ļ縦 ����?', sysdate, 'fff', 12117339, '����Ʈ����', 
   null, null, null,'false');

----12444335	����������
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ����', '������ �����⿴���ϴ�.. �ò������� ���� �Ⱦ��ϴºе鲲 ��õ�帳�ϴ�.', sysdate, 'iii', 12444335, '����������', 
   'reviewPics/yangsick15.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�ٸ� ü�����̶� ����߽��ϴ�.', sysdate, 'eee', 12444335, '����������', 
   'reviewPics/yangsick16.jpg','reviewPics/yangsick17.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������', '��簡 �ȵǴ� ������ �˰���', sysdate, 'hhh', 12444335, '����������', 
   'reviewPics/yangsick18.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��..', 'ģ���� �������� �����µ� ��и� �������׿�.. ���� ���������� ������!!', sysdate, 'ggg', 12444335, '����������', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �����մϴ�', '�� ���� ��簡 �� �� �ǳ���? ������������ �����ִٰ� �����淡 ���µ� ��.. �ð��� �ǵ����� �;��', sysdate, 'jjj', 12444335, '����������', 
   'reviewPics/yangsick19.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�մ��� ���� ���̺� ��..', sysdate, 'fff', 12444335, '����������', 
   null, null, null,'false');
   
----12448901	������غ���
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�ҹ��� ����!', '�� ���� ��ٸ� ������ �ְ� ���� ���־����!! ���� ���̵� ���� �� �Ծ���ϴ�~', sysdate, 'ccc', 12448901, '������غ���', 
   'reviewPics/yangsick20.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���ƿ�', '�������� ������ ��� ������ �� �����Դϴ�', sysdate, 'bbb', 12448901, '������غ���', 
   'reviewPics/yangsick21.jpg','reviewPics/yangsick22.jpg','reviewPics/yangsick23.jpg','true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����~~', '���� ������ �����̳׿�', sysdate, 'iii', 12448901, '������غ���', 
   'reviewPics/yangsick24.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'ã�Ҵ� �� ���', 'ã�Ҵ� �� ���~ ���� ã�� ���~ ', sysdate, 'ggg', 12448901, '������غ���', 
   null, null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ ����', '�������� ã�ƿ��� �������� ���� �ٳ఩�ϴ�', sysdate, 'jjj', 12448901, '������غ���', 
   'reviewPics/yangsick25.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �ִµ�..', '�� �ð��̳� ��ٷ��� ���Ծ�� �Ф� �� ���� ��ٸ� ���� �ƴϿ���..', sysdate, 'fff', 12448901, '������غ���', 
   'reviewPics/yangsick26.jpg', null, null,'false');
   
   
----12490565	��罺����ũ
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'ĳĳĳĳĳĳ���ִ�', '�̷��� ������ �� �ִ°ǰ���? �λ� ���� ã�ҽ��ϴ�.. ��â�ϼ���!!', sysdate, 'bbb', 12490565, '��罺����ũ', 
   'reviewPics/yangsick27.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����� �߻�����!!!', '���� ������ ����� ���� �ɴϴ٤�����', sysdate, 'ccc', 12490565, '��罺����ũ', 
   'reviewPics/yangsick28.jpg','reviewPics/yangsick29.jpg', null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ��õ', '������ �� ���־���� ������ �׷��� ���־����!', sysdate, 'iii', 12490565, '��罺����ũ', 
   'reviewPics/yangsick30.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ�� ���ؿ� ��', '���� ���־��� ���ο���.. ', sysdate, 'jjj', 12490565, '��罺����ũ', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�׳� ���� �׷���', '������� �߻���̽��ϴ�', sysdate, 'ggg', 12490565, '��罺����ũ', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�Ӹ�ī�� ���Խ��ϴ�', '�����ߴµ� ���� ���� ����ϴ�����? �ٽ� �� ���ϴ�.', sysdate, 'fff', 12490565, '��罺����ũ', 
   null , null, null,'false');
   
   
----12512013	������ũ���̺�
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����!', '���� �ٳ�Դµ� ���� �� ���� �;��!!', sysdate, 'bbb', 12512013, '������ũ���̺�', 
   'reviewPics/yangsick31.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �����մϴ�!', '���ְ� �� �԰� ���ϴ�~', sysdate, 'ddd', 12512013, '������ũ���̺�', 
   'reviewPics/yangsick32.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�׳� sns����', '������ ���� ���׿�', sysdate, 'hhh', 12512013, '������ũ���̺�', 
   'reviewPics/yangsick33.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ�� ���ؿ� ��', '���� ���־��� ���ο���.. ', sysdate, 'iii', 12512013, '������ũ���̺�', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�칰�칰,,,', '���� ��ų ������ �� �ϴ� �����̾����ϴ�...', sysdate, 'eee', 12512013, '������ũ���̺�', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������� ���ο���', 'ī�� ���� �Ѵٰ� �ϴϱ� �ý÷� �ý÷�...', sysdate, 'ccc', 12512013, '������ũ���̺�', 
   null , null, null,'false');
   
----12548610	���������̼�
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�� �� ����!', '���� ���� ���߾��~~ ����� �˷��ּ���!!', sysdate, 'bbb', 12548610, '���������̼�', 
   'reviewPics/yangsick34.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ �����ؿ�!', '���� �ͼ� ������ ��� ���ִٰ� �Ͻó׿䤾�� �����մϴ�!!', sysdate, 'ddd', 12548610, '���������̼�', 
   'reviewPics/yangsick35.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ �����ƿ�', '����� �˾Ҵµ� ������ �����ؼ� ������', sysdate, 'fff', 12548610, '���������̼�', 
   'reviewPics/yangsick36.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�� ���� �Ǵ� ��', '���� �ƴ� �׷� ���̿���. ���� ���� ���ñ�', sysdate, 'ggg', 12548610, '���������̼�', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� �� �̷��� ����?', '���� �ڿ� ���̶�� �̷��� ���� �ֽŰ���..', sysdate, 'eee', 12548610, '���������̼�', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��-��', 'ã�ư����� ���� ���̿���', sysdate, 'ccc', 12548610, '���������̼�', 
   null , null, null,'false');
   
   
----12585092	ī�򸶸�
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�ʹ� ���־��~~', '���� ���� �� ��Ҿ��! ������ ���� ���̵�޴� �����Կ�~', sysdate, 'bbb', 12585092, 'ī�򸶸�', 
   'reviewPics/yangsick37.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�Ը� ���� �� ���̿���', '�� ��ĥ ������ �Ը��� ���ƿԾ�䤾��', sysdate, 'hhh', 12585092, 'ī�򸶸�', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�ʹ� ¥��', '�߸��ؼ� �ұ��� ������ �� �ƴѰ���?', sysdate, 'ggg', 12585092, 'ī�򸶸�', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���� ���� �Ǵ� �� ���ƿ�', '���� ���� �ڱ����̿��� �Ф� �ֵ��� �� �԰ھ��', sysdate, 'jjj', 12585092, 'ī�򸶸�', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�Ǹ�..', '������ �����Ҵµ� �̹����� ���� ���׿�Ф�', sysdate, 'eee', 12585092, 'ī�򸶸�', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���Һ�', '���� ������ ���� ���Һ��� �� ���ƿ�..', sysdate, 'ccc', 12585092, 'ī�򸶸�', 
   null , null, null,'false');

   
----12609192	�úξ��ǾƳ�
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�� �� ����', '����� �Ÿ� �������� ���� ���� �� �� ���׿�~', sysdate, 'ddd', 12609192, '�úξ��ǾƳ�', 
   'reviewPics/yangsick38.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��õ�ؿ�!', '���� �������� �ʾƵ� �������ؿ�~', sysdate, 'bbb', 12609192, '�úξ��ǾƳ�', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ ���� ��', '�쿬�� �湮�ߴµ� ���� ������ �ϳ��� ���� ���̾����..', sysdate, 'ggg', 12609192, '�úξ��ǾƳ�', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'û�� �����̿���!', '�������� �����鵵 ���̰� ������ ���� �ٴϰ�... ���� �Ĵ� �� �³���?', sysdate, 'fff', 12609192, '�úξ��ǾƳ�', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '�����.. �̰� �ƴ� �� ���ƿ�', sysdate, 'eee', 12609192, '�úξ��ǾƳ�', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'��...', '�� �Ʊ����ϴ� ����', sysdate, 'ccc', 12609192, '�úξ��ǾƳ�', 
   null , null, null,'false');
   
----12612437	��Ƽ��1988
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'������ ��', '�ʹ� ���ִ°� �ƴѰ���?', sysdate, 'ddd', 12612437, '��Ƽ��1988', 
   'reviewPics/yangsick39.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���׸�� ������!', '�÷����õ� �±�', sysdate, 'bbb', 12612437, '��Ƽ��1988', 
   'reviewPics/yangsick40.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���˹ٻ� ���� �����ؿ�', '��䵵 �� �ϰ� ��� ���� ���� �ִ��� ������ �ٽ� ���Ѿ� �� �� ���ƿ�', sysdate, 'ggg', 12612437, '��Ƽ��1988', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'����', '��ü �̰� ���� ���ΰ���???', sysdate, 'iii', 12612437, '��Ƽ��1988', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'�˹ٻ� �ΰ���...', '��û �����ϰ� �ϵ� �� �ϰ� ��ȭ�� �� �׷��� ���� �ϴ���...', sysdate, 'eee', 12612437, '��Ƽ��1988', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'���ο���', '���� �� �� �� �̻��� �ٶ��� �ʴ°� ���ƿ�', sysdate, 'ccc', 12612437, '��Ƽ��1988', 
   null , null, null,'false');



===================================================================================================================================
-------------�ϸ�ũ(���ã��) crud------------
select * from bookmark;
delete from bookmark;
select * from bookmark where res_id='25398530' and member_id = 'aaa';
delete from bookmark where res_id='25398530' and member_id = 'aaa';

--memberId�� 'aaa'�� ȸ���� �ϸ�ũ insert
insert into BOOKMARK values(BOOKMARK_SEQ.NEXTVAL, 'aaa', 12482031); --12482031	���¸��δ��
insert into BOOKMARK values(BOOKMARK_SEQ.NEXTVAL, 'aaa', 11982599); --11982599	���͹���
insert into BOOKMARK values(BOOKMARK_SEQ.NEXTVAL, 'aaa', 20252806); --20252806	Ī����
insert into BOOKMARK values(BOOKMARK_SEQ.NEXTVAL, 'aaa', 20295124); --20295124	����¡���丮
insert into BOOKMARK values(BOOKMARK_SEQ.NEXTVAL, 'aaa', 11958020); --11958020	�����ġŲ
insert into BOOKMARK values(BOOKMARK_SEQ.NEXTVAL, 'aaa', 12512013); --12512013	������ũ���̺�


===================================================================================================================================
-------------���信 ���� ���ƿ�------------
select * from recommend;

--���並 ��õ������ �����ֱ� ���� ����ȸ���� ���� ��õ insert
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 2); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 4);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 6);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 8);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 10);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 12); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 14);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 16);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 18);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 20);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 22); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 24);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 26);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 28);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 30);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 32); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 34);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 36);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 38);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 40);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 42); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 44);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 46);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 48);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 50);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 52); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 54);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 56);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 58);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 60);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 62);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 64);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 66);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 68);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 70);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 72); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 74);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 76);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 78);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 80);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 82); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 84);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 86);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 88);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 90);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 92); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 94);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 96);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 98);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 100);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 102); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 104);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 106);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 108);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 110);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 112); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 114);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 116);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 118);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 120);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 122); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 124);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 126);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 128);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 130);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 132); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 134);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 136);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 138);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 140);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 142); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 144);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 146);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 148);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 150);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 152); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 154);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 156);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 158);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 160);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 162); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 164);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 166);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 168);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 170);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 172); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 174);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 176);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 178);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 180);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 182);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 184);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 186);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 188);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 190);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 192); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 194);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 196);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 198);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 200);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 202); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 204);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 206);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 208);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 210);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 212); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 214);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 216);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 218);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 220);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 222); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 224);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 226);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 228);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 230);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 232); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 234);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 236);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 238);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 240);


insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 4);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 6);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 10);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 12); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 16);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 18);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 22); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 24);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 28);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 30);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 34);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 36);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 40);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 42); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 46);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 48);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 52); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 54);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 58);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 60);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 64);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 66);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 70);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 72); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 76);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 78);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 82); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 84);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 88);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 90);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 94);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 96);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 100);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 102); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 106);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 108);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 112); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 114);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 118);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 120);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 124);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 126);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 130);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 132); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 136);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 138);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 142); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 144);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 148);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 150);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 154);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 156);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 160);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 162); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 166);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 168);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 172); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 174);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 178);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 180);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 184);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 186);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 190);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 192); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 196);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 198);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 202); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 204);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 208);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 210);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 214);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 216);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 220);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 222); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 226);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 228);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 232); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 234);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 238);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 240);

insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 6);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 12); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 18);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 24);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 30);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 36);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 42); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 48);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 54);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 60);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 66);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 72); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 78);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 84);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 90);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 96);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 102); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 108);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 114);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 120);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 126);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 132); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 138);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 144);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 150);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 156);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 162); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 168);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 174);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 180);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 186);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 192); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 198);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 204);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 210);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 216);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 222); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 228);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 234);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 240);

--memberId�� 'aaa'�� ȸ���� recommend insert
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 1);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 6);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 11);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 16);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 21);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 26);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 31);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 36);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 41);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 46);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 51);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 56);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 61);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 66);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 71);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 76);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 81);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 86);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 91);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 96);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 101);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 106);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 111);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 116);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 121);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 126);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 131);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 136);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 141);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 146);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 151);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 156);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 161);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 166);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 171);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 176);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 181);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 186);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 191);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 196);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 201);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 206);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 211);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 216);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 221);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 226);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 231);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 236);



