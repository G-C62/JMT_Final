-----------------Table create----------------
--음식점 table create
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


--회원 table create
CREATE TABLE MEMBER(
    MEMBER_ID VARCHAR2(20 CHAR) PRIMARY KEY,
    MEMBER_PWD VARCHAR2(20 CHAR) NOT NULL,
    MEMBER_NAME VARCHAR2(10 CHAR) NOT NULL,
    MEMBER_PHONE VARCHAR2(20 CHAR) NOT NULL,
    MEMBER_GENDER VARCHAR2(5 CHAR) NOT NULL CHECK(MEMBER_GENDER IN('남','여')),
    MEMBER_EMAIL VARCHAR2(50 CHAR)
);

--리뷰 table create
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

--북마크(즐겨찾기) table create
CREATE TABLE BOOKMARK(
    BOOKMARK_ID NUMBER(5) PRIMARY KEY,
    MEMBER_ID VARCHAR2(20 CHAR) NOT NULL REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,
    RES_ID NUMBER(10) NOT NULL REFERENCES RESTAURANT(RES_ID) ON DELETE CASCADE
);

--리뷰 좋아요 table create
CREATE TABLE RECOMMEND(
    RECOMMEND_ID NUMBER(10) PRIMARY KEY,
    MEMBER_ID VARCHAR2(20 CHAR) NOT NULL REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,
    REVIEW_ID NUMBER(5) REFERENCES REVIEW(REVIEW_ID) ON DELETE CASCADE
);

--시퀀스
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
--안에 값 전부 delete
delete from review;
delete from bookmark;
delete from recommend;

===================================================================================================================================

------------- 회원 insert 문 -----------------------
--회원테이블 insert 10개
insert into member values('aaa', 'aaa', '장희정', '010-8875-8253', 
   	'여', '8253jang@daum.net');
insert into member values('bbb', 'bbb', '이수현', '010-2770-9755', 
   	'여', 'heartrecycle95@gmail.com');
insert into member values('ccc', 'ccc', '이한나', '010-2629-1085', 
   	'여', 'tngus1085@naver.com');
insert into member values('ddd', 'ddd', '김지혜', '010-9105-2466', 
	'여', 'eoun24@gmail.com');
insert into member values('eee', 'eee', '김호수', '010-3403-9195', 
   	'남', 'ghtnfhf94@naver.com');
insert into member values('fff', 'fff', '김성호', '010-1111-1111', 
   	'남', 'power16230@gmail.com');
insert into member values('ggg', 'ggg', '남시욱', '010-1111-1111', 
   	'남', 'nsw9211@naver.com');
insert into member values('hhh', 'hhh', '김지성', '010-1111-1111', 
   	'남', 'hhh@gmail.com');
insert into member values('iii', 'iii', '박선정', '010-7190-1214', 
   	'여', 'iii@gmail.com');
insert into member values('jjj', 'jjj', '이태희', '010-1111-1111', 
   	'남', 'jjj@gmail.com');

   	
===================================================================================================================================

-------------  리뷰 insert 문 -----------------------
   	
--한식 리뷰 insert
----12482031	이태리부대찌개

select * from review where review_id=60;

insert into review  
   values (REVIEW_SEQ.NEXTVAL,'이 부대찌개 정말 맛있어요!', '맛도 있고 집도 가까워서 재방문 의사 백프로 있습니다~', sysdate, 'aaa', 12482031, '이태리부대찌개', 
   'reviewPics/hansick1.png','reviewPics/hansick2.JPG','reviewPics/hansick3.png','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'완전 반했어요', '으아아아ㅠ 얼른 또 가고 싶어요!', sysdate, 'bbb', 12482031, '이태리부대찌개', 
   'reviewPics/hansick4.jpg','reviewPics/hansick5.bmp',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'정말 배고팠는데...', '배고픔을 채워주는 딱 좋은 식사였습니다.', sysdate, 'ccc', 12482031, '이태리부대찌개', 
   'reviewPics/hansick6.png', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'만족!', '사진에 반찬 가짓수좀 보세요!! 이게 4인상이라는게 믿겨지세요?? 정말 잘 먹었습니다~', sysdate, 'ddd', 12482031, '이태리부대찌개', 
   'reviewPics/hansick7.jpg', null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'음...', '기대했던 맛이 아니어서 슬픕니다.', sysdate, 'eee', 12482031, '이태리부대찌개', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'soso', '다시 갈 이유는 없을 것 같아요 ㅠ', sysdate, 'fff', 12482031, '이태리부대찌개', 
   null, null, null,'false');


----12489990	원조양평해장국
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'해장국 굿굿', '함께 나오는 반찬들도 맛있고 해장국 종류도 여러가지라서 정말 추천해 드리고 싶은 곳이에요~', sysdate, 'aaa', 12489990, '원조양평해장국', 
   'reviewPics/hansick8.png','reviewPics/hansick9.png','reviewPics/hansick10','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'오오', '요 몇 달간 먹은 음식중에 제일 맛있었습니다!', sysdate, 'eee', 12489990, '원조양평해장국', 
   'reviewPics/hansick11.jpg','reviewPics/hansick12.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'좋아용', '간이 딱 좋았어요', sysdate, 'ccc', 12489990, '원조양평해장국', 
   'reviewPics/hansick13.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그닥..', '특별한게 없었습니다.', sysdate, 'ggg', 12489990, '원조양평해장국', 
   'reviewPics/hansick14.jpg', null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그냥 그래요', '맛은 별로여도 사장님은 친절하셨어요', sysdate, 'aaa', 12489990, '원조양평해장국', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'완전 별로', '이 돈주고 누가 식사를 하죠?', sysdate, 'fff', 12489990, '원조양평해장국', 
   null, null, null,'false');

----12492426	군산오징어
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'나름 괜찮', '조용한 분위기였습니다.. 시끌벅적한 것을 싫어하는분들께 추천드립니다.', sysdate, 'aaa', 12492426, '군산오징어', 
   'reviewPics/hansick15.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'평이', '다른 체인점이랑 비슷했습니다.', sysdate, 'eee', 12492426, '군산오징어', 
   'reviewPics/hansick16.jpg','reviewPics/hansick17.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'맛없음', '장사가 안되는 이유를 알겠음', sysdate, 'hhh', 12492426, '군산오징어', 
   'reviewPics/hansick18.JPG', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'하..', '친구랑 오랜만에 만났는데 기분만 나빠졌네요.. 절대 가지마세요 여러분!!', sysdate, 'ggg', 12492426, '군산오징어', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'완전 비추합니다', '이 가게 장사가 잘 안 되나요? 지나갈때마다 닫혀있다가 열었길래 갔는데 하.. 시간을 되돌리고 싶어요', sysdate, 'jjj', 12492426, '군산오징어', 
   'reviewPics/hansick19.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'껄껄', '손님은 저희 테이블 뿐..', sysdate, 'fff', 12492426, '군산오징어', 
   null, null, null,'false');
   
----12508903	매드피셔맨
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'소문난 맛집!', '줄 서서 기다린 보람이 있게 정말 맛있었어요!! 저희 아이도 정말 잘 먹었답니다~', sysdate, 'aaa', 12508903, '매드피셔맨', 
   'reviewPics/hansick20.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'아주 좋아요', '다음번에 가족들 모두 데리고 올 생각입니다', sysdate, 'bbb', 12508903, '매드피셔맨', 
   'reviewPics/hansick21.JPG','reviewPics/hansick22.png','reviewPics/hansick23.png','true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'역시~~', '역시 맛집은 맛집이네요', sysdate, 'iii', 12508903, '매드피셔맨', 
   'reviewPics/hansick24.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'찾았다 내 사랑', '찾았다 내 사랑~ 내가 찾던 사랑~ ', sysdate, 'ggg', 12508903, '매드피셔맨', 
   null, null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'맛집중 맛집', '전국에서 찾아오는 음식점에 드디어 다녀갑니다', sysdate, 'jjj', 12508903, '매드피셔맨', 
   'reviewPics/hansick25.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'맛은 있는데..', '두 시간이나 기다려서 들어왔어요 ㅠㅠ 그 정도 기다릴 맛은 아니에요..', sysdate, 'fff', 12508903, '매드피셔맨', 
   'reviewPics/hansick26.jpg', null, null,'false');
   
   
----12510865	세어부의밥상
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'캐캐캐캐캐캐맛있당', '이렇게 맛있을 수 있는건가요? 인생 맛집 찾았습니다.. 번창하세요!!', sysdate, 'bbb', 12510865, '세어부의밥상', 
   'reviewPics/hansick27.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'사장님 잘생겼어요!!!', '여긴 맛보다 사장님 보러 옵니다ㅎㅎㅎ', sysdate, 'ccc', 12510865, '세어부의밥상', 
   'reviewPics/hansick28.jpg','reviewPics/hansick29.jpg', null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천추천', '저번이 더 맛있었기는 하지만 그래도 맛있었어요!', sysdate, 'iii', 12510865, '세어부의밥상', 
   'reviewPics/hansick30.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천은 안해요 ㅠ', '음식 비주얼이 별로에요.. ', sysdate, 'aaa', 12510865, '세어부의밥상', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그냥 저냥 그래요', '사장님은 잘생기셨습니다', sysdate, 'eee', 12510865, '세어부의밥상', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'머리카락 나왔습니다', '항의했는데 저를 진상 취급하더라고요? 다신 안 갑니다.', sysdate, 'fff', 12510865, '세어부의밥상', 
   null , null, null,'false');
   
   
----12515776	박가부대찌개
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'존맛!', '어제 다녀왔는데 오늘 또 가고 싶어요!!', sysdate, 'bbb', 12515776, '박가부대찌개', 
   'reviewPics/hansick31.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'서비스 감사합니다!', '맛있게 잘 먹고 갑니다~', sysdate, 'ddd', 12515776, '박가부대찌개', 
   'reviewPics/hansick32.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그냥 sns맛집', '가보니 별게 없네요', sysdate, 'hhh', 12515776, '박가부대찌개', 
   'reviewPics/hansick33.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천은 안해요 ㅠ', '음식 비주얼이 별로에요.. ', sysdate, 'aaa', 12515776, '박가부대찌개', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'우물우물,,,', '입이 삼킬 생각을 안 하는 음식이었습니다...', sysdate, 'eee', 12515776, '박가부대찌개', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'사장님이 별로에요', '카드 결제 한다고 하니까 궁시렁 궁시렁...', sysdate, 'ccc', 12515776, '박가부대찌개', 
   null , null, null,'false');
   
----12518533	국수의진수
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'딱 제 취향!', '취향 저격 당했어요~~ 비법좀 알려주세요!!', sysdate, 'bbb', 12518533, '국수의진수', 
   'reviewPics/hansick34.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'엄마가 좋아해요!', '집에 와서 엄마가 계속 맛있다고 하시네요ㅎㅎ 감사합니다!!', sysdate, 'aaa', 12518533, '국수의진수', 
   'reviewPics/hansick35.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'가격이 괜찮아요', '비쌀줄 알았는데 가격이 저렴해서 놀랐어요', sysdate, 'fff', 12518533, '국수의진수', 
   'reviewPics/hansick36.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'딱 예상 되는 맛', '흔히 아는 그런 맛이에요. 기대는 하지 마시길', sysdate, 'jjj', 12518533, '국수의진수', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'양이 왜 이렇게 적죠?', '누구 코에 붙이라고 이렇게 적게 주신건지..', sysdate, 'eee', 12518533, '국수의진수', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'평-범', '찾아가지는 않을 맛이에요', sysdate, 'ccc', 12518533, '국수의진수', 
   null , null, null,'false');
   
   
----12520860	양선생
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'너무 맛있어요~~', '쿠폰 벌써 다 모았어요! 조만간 가서 사이드메뉴 받을게요~', sysdate, 'bbb', 12520860, '양선생', 
   'reviewPics/hansick37.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'입맛 없을 때 딱이에요', '요 며칠 없었던 입맛이 돌아왔어요ㅎㅎ', sysdate, 'hhh', 12520860, '양선생', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'너무 짜요', '잘못해서 소금을 부으신 것 아닌가요?', sysdate, 'ggg', 12520860, '양선생', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'혀가 마비 되는 것 같아요', '정말 정말 자극적이에요 ㅠㅠ 애들은 못 먹겠어요', sysdate, 'jjj', 12520860, '양선생', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'실망..', '저번엔 괜찮았는데 이번에는 맛이 없네요ㅠㅠ', sysdate, 'eee', 12520860, '양선생', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'복불복', '여기 음식은 맛이 복불복인 것 같아요..', sysdate, 'ccc', 12520860, '양선생', 
   null , null, null,'false');

   
----12521964	아부
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'집 앞 맛집', '가까운 거리 때문인지 자주 오게 될 것 같네요~', sysdate, 'aaa', 12521964, '아부', 
   'reviewPics/hansick38.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천해요!', '아주 맛있지는 않아도 먹을만해요~', sysdate, 'bbb', 12521964, '아부', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'장점이 없는 곳', '우연히 방문했는데 정말 장점이 하나도 없는 곳이었어요..', sysdate, 'ggg', 12521964, '아부', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'청결 엉망이에요!', '여기저기 벌레들도 보이고 먼지도 굴러 다니고... 음식 파는 곳 맞나요?', sysdate, 'fff', 12521964, '아부', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'우웩', '사장님.. 이건 아닌 것 같아요', sysdate, 'eee', 12521964, '아부', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'하...', '돈 아깝습니다 정말', sysdate, 'ccc', 12521964, '아부', 
   null , null, null,'false');
   
----12523192	전설의골뱅이
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'전설의 맛', '너무 맛있는거 아닌가요?', sysdate, 'ddd', 12523192, '전설의골뱅이', 
   'reviewPics/hansick39.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'인테리어가 예뻐요!', '플레이팅도 굿굿', sysdate, 'bbb', 12523192, '전설의골뱅이', 
   'reviewPics/hansick40.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'남알바생 완전 무례해요', '대답도 안 하고 계속 폰만 보고 있던데 교육을 다시 시켜야 할 것 같아요', sysdate, 'ggg', 12523192, '전설의골뱅이', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'오잉', '대체 이게 무슨 맛인거죠???', sysdate, 'iii', 12523192, '전설의골뱅이', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'알바생 싸가지...', '엄청 무례하고 일도 안 하고 통화는 왜 그렇게 오래 하는지...', sysdate, 'eee', 12523192, '전설의골뱅이', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'별로에요', '예쁜 것 뿐 그 이상은 바라지 않는게 좋아요', sysdate, 'ccc', 12523192, '전설의골뱅이', 
   null , null, null,'false');

   

   	
-- 패스트푸드 리뷰 insert
11978126	써브웨이
11982599	에뽕버거
12044056	델리아메리칸
12044153	명동피자익스프레스
12075614	루키버거
12097387	그집피자
12115686	JBLIAB
12115833	KERVAN
12115836	Mody-Dick
-12115881	마스터치킨

----11978126	써브웨이

select * from review;

insert into review  
   values (REVIEW_SEQ.NEXTVAL,'정말 맛있어요!', '맛도 있고 집도 가까워서 재방문 의사 백프로 있습니다~', sysdate, 'ggg', 11978126, '써브웨이', 
   'reviewPics/fastfood1.jpg','reviewPics/fastfood2.jpg','reviewPics/fastfood3.jpg','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'완전 반했어요', '으아아아ㅠ 얼른 또 가고 싶어요!', sysdate, 'aaa', 11978126, '써브웨이', 
   'reviewPics/fastfood4.jpg','reviewPics/fastfood5.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'정말 배고팠는데...', '배고픔을 채워주는 딱 좋은 식사였습니다.', sysdate, 'ccc', 11978126, '써브웨이', 
   'reviewPics/fastfood6.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'만족!', '정말 잘 먹었습니다~', sysdate, 'ddd', 11978126, '써브웨이', 
   'reviewPics/fastfood7.jpg', null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'음...', '기대했던 맛이 아니어서 슬픕니다.', sysdate, 'eee', 11978126, '써브웨이', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'soso', '다시 갈 이유는 없을 것 같아요 ㅠ', sysdate, 'fff', 11978126, '써브웨이', 
   null, null, null,'false');


----11982599	에뽕버거
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'굿굿', '함께 나오는 반찬들도 맛있고 종류도 여러가지라서 정말 추천해 드리고 싶은 곳이에요~', sysdate, 'iii', 11982599, '에뽕버거', 
   'reviewPics/fastfood8.jpg','reviewPics/fastfood9.jpg','reviewPics/fastfood10.jpg','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'오오', '요 몇 달간 먹은 음식중에 제일 맛있었습니다!', sysdate, 'eee', 11982599, '에뽕버거', 
   'reviewPics/fastfood11.jpg','reviewPics/fastfood12.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'좋아용', '간이 딱 좋았어요', sysdate, 'ccc', 11982599, '에뽕버거', 
   'reviewPics/fastfood13.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그닥..', '특별한게 없었습니다.', sysdate, 'bbb', 11982599, '에뽕버거', 
   'reviewPics/fastfood14.jpg', null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그냥 그래요', '맛은 별로여도 사장님은 친절하셨어요', sysdate, 'jjj', 11982599, '에뽕버거', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'완전 별로', '이 돈주고 누가 식사를 하죠?', sysdate, 'fff', 11982599, '에뽕버거', 
   null, null, null,'false');

----12044056	델리아메리칸
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'나름 괜찮', '조용한 분위기였습니다.. 시끌벅적한 것을 싫어하는분들께 추천드립니다.', sysdate, 'iii', 12044056, '델리아메리칸', 
   'reviewPics/fastfood15.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'평이', '다른 체인점이랑 비슷했습니다.', sysdate, 'eee', 12044056, '델리아메리칸', 
   'reviewPics/fastfood16.jpg','reviewPics/fastfood17.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'맛없음', '장사가 안되는 이유를 알겠음', sysdate, 'hhh', 12044056, '델리아메리칸', 
   'reviewPics/fastfood18.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'하..', '친구랑 오랜만에 만났는데 기분만 나빠졌네요.. 절대 가지마세요 여러분!!', sysdate, 'ggg', 12044056, '델리아메리칸', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'완전 비추합니다', '이 가게 장사가 잘 안 되나요? 지나갈때마다 닫혀있다가 열었길래 갔는데 하.. 시간을 되돌리고 싶어요', sysdate, 'jjj', 12044056, '델리아메리칸', 
   'reviewPics/fastfood19.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'껄껄', '손님은 저희 테이블 뿐..', sysdate, 'fff', 12044056, '델리아메리칸', 
   null, null, null,'false');
   
----12044153	명동피자익스프레스
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'소문난 맛집!', '줄 서서 기다린 보람이 있게 정말 맛있었어요!! 저희 아이도 정말 잘 먹었답니다~', sysdate, 'ccc', 12044153, '명동피자익스프레스', 
   'reviewPics/fastfood20.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'아주 좋아요', '다음번에 가족들 모두 데리고 올 생각입니다', sysdate, 'bbb', 12044153, '명동피자익스프레스', 
   'reviewPics/fastfood21.jpg','reviewPics/fastfood22.jpg','reviewPics/fastfood23.jpg','true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'역시~~', '역시 맛집은 맛집이네요', sysdate, 'iii', 12044153, '명동피자익스프레스', 
   'reviewPics/fastfood24.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'찾았다 내 사랑', '찾았다 내 사랑~ 내가 찾던 사랑~ ', sysdate, 'ggg', 12044153, '명동피자익스프레스', 
   null, null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'맛집중 맛집', '전국에서 찾아오는 음식점에 드디어 다녀갑니다', sysdate, 'jjj', 12044153, '명동피자익스프레스', 
   'reviewPics/fastfood25.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'맛은 있는데..', '두 시간이나 기다려서 들어왔어요 ㅠㅠ 그 정도 기다릴 맛은 아니에요..', sysdate, 'fff', 12044153, '명동피자익스프레스', 
   'reviewPics/fastfood26.jpg', null, null,'false');
   
   
----12075614	루키버거
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'캐캐캐캐캐캐맛있당', '이렇게 맛있을 수 있는건가요? 인생 맛집 찾았습니다.. 번창하세요!!', sysdate, 'bbb', 12075614, '루키버거', 
   'reviewPics/fastfood27.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'사장님 잘생겼어요!!!', '여긴 맛보다 사장님 보러 옵니다ㅎㅎㅎ', sysdate, 'ccc', 12075614, '루키버거', 
   'reviewPics/fastfood28.jpg','reviewPics/fastfood29.jpg', null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천추천', '저번이 더 맛있었기는 하지만 그래도 맛있었어요!', sysdate, 'iii', 12075614, '루키버거', 
   'reviewPics/fastfood30.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천은 안해요 ㅠ', '음식 비주얼이 별로에요.. ', sysdate, 'jjj', 12075614, '루키버거', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그냥 저냥 그래요', '사장님은 잘생기셨습니다', sysdate, 'aaa', 12075614, '루키버거', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'머리카락 나왔습니다', '항의했는데 저를 진상 취급하더라고요? 다신 안 갑니다.', sysdate, 'fff', 12075614, '루키버거', 
   null , null, null,'false');
   
   
----12097387	그집피자
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'존맛!', '어제 다녀왔는데 오늘 또 가고 싶어요!!', sysdate, 'bbb', 12097387, '그집피자', 
   'reviewPics/fastfood31.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'서비스 감사합니다!', '맛있게 잘 먹고 갑니다~', sysdate, 'ddd', 12097387, '그집피자', 
   'reviewPics/fastfood32.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그냥 sns맛집', '가보니 별게 없네요', sysdate, 'hhh', 12097387, '그집피자', 
   'reviewPics/fastfood33.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천은 안해요 ㅠ', '음식 비주얼이 별로에요.. ', sysdate, 'iii', 12097387, '그집피자', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'우물우물,,,', '입이 삼킬 생각을 안 하는 음식이었습니다...', sysdate, 'eee', 12097387, '그집피자', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'사장님이 별로에요', '카드 결제 한다고 하니까 궁시렁 궁시렁...', sysdate, 'ccc', 12097387, '그집피자', 
   null , null, null,'false');
   
----12115686	JBLIAB
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'딱 제 취향!', '취향 저격 당했어요~~ 비법좀 알려주세요!!', sysdate, 'bbb', 12115686, 'JBLIAB', 
   'reviewPics/fastfood34.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'엄마가 좋아해요!', '집에 와서 엄마가 계속 맛있다고 하시네요ㅎㅎ 감사합니다!!', sysdate, 'ddd', 12115686, 'JBLIAB', 
   'reviewPics/fastfood35.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'가격이 괜찮아요', '비쌀줄 알았는데 가격이 저렴해서 놀랐어요', sysdate, 'fff', 12115686, 'JBLIAB', 
   'reviewPics/fastfood36.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'딱 예상 되는 맛', '흔히 아는 그런 맛이에요. 기대는 하지 마시길', sysdate, 'aaa', 12115686, 'JBLIAB', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'양이 왜 이렇게 적죠?', '누구 코에 붙이라고 이렇게 적게 주신건지..', sysdate, 'eee', 12115686, 'JBLIAB', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'평-범', '찾아가지는 않을 맛이에요', sysdate, 'ccc', 12115686, 'JBLIAB', 
   null , null, null,'false');
   
   
----12115833	KERVAN
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'너무 맛있어요~~', '쿠폰 벌써 다 모았어요! 조만간 가서 사이드메뉴 받을게요~', sysdate, 'bbb', 12115833, 'KERVAN', 
   'reviewPics/fastfood37.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'입맛 없을 때 딱이에요', '요 며칠 없었던 입맛이 돌아왔어요ㅎㅎ', sysdate, 'hhh', 12115833, 'KERVAN', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'너무 짜요', '잘못해서 소금을 부으신 것 아닌가요?', sysdate, 'ggg', 12115833, 'KERVAN', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'혀가 마비 되는 것 같아요', '정말 정말 자극적이에요 ㅠㅠ 애들은 못 먹겠어요', sysdate, 'jjj', 12115833, 'KERVAN', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'실망..', '저번엔 괜찮았는데 이번에는 맛이 없네요ㅠㅠ', sysdate, 'eee', 12115833, 'KERVAN', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'복불복', '여기 음식은 맛이 복불복인 것 같아요..', sysdate, 'ccc', 12115833, 'KERVAN', 
   null , null, null,'false');

   
----12115836	Mody-Dick
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'집 앞 맛집', '가까운 거리 때문인지 자주 오게 될 것 같네요~', sysdate, 'ddd', 12115836, 'Mody-Dick', 
   'reviewPics/fastfood38.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천해요!', '아주 맛있지는 않아도 먹을만해요~', sysdate, 'bbb', 12115836, 'Mody-Dick', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'장점이 없는 곳', '우연히 방문했는데 정말 장점이 하나도 없는 곳이었어요..', sysdate, 'ggg', 12115836, 'Mody-Dick', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'청결 엉망이에요!', '여기저기 벌레들도 보이고 먼지도 굴러 다니고... 음식 파는 곳 맞나요?', sysdate, 'fff', 12115836, 'Mody-Dick', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'우웩', '사장님.. 이건 아닌 것 같아요', sysdate, 'eee', 12115836, 'Mody-Dick', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'하...', '돈 아깝습니다 정말', sysdate, 'ccc', 12115836, 'Mody-Dick', 
   null , null, null,'false');
   
----12115881	마스터치킨
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'전설의 맛', '너무 맛있는거 아닌가요?', sysdate, 'ddd', 12115881, '마스터치킨', 
   'reviewPics/fastfood39.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'인테리어가 예뻐요!', '플레이팅도 굿굿', sysdate, 'bbb', 12115881, '마스터치킨', 
   'reviewPics/fastfood40.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'남알바생 완전 무례해요', '대답도 안 하고 계속 폰만 보고 있던데 교육을 다시 시켜야 할 것 같아요', sysdate, 'ggg', 12115881, '마스터치킨', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'오잉', '대체 이게 무슨 맛인거죠???', sysdate, 'iii', 12115881, '마스터치킨', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'알바생 싸가지...', '엄청 무례하고 일도 안 하고 통화는 왜 그렇게 오래 하는지...', sysdate, 'eee', 12115881, '마스터치킨', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'별로에요', '예쁜 것 뿐 그 이상은 바라지 않는게 좋아요', sysdate, 'ccc', 12115881, '마스터치킨', 
   null , null, null,'false');

--중식 리뷰 insert
19947716	뽕신
20092017	락앤웍
20252806	칭따오
20295124	베이징스토리
20601752	이것이짬뽕
23315062	더가든
23354843	일공이육
23386721	해무리
23387779	센트럴차이나
23680479	엠비즈스타차이나


----19947716	뽕신

select * from review;

insert into review  
   values (REVIEW_SEQ.NEXTVAL,'정말 맛있어요!', '맛도 있고 집도 가까워서 재방문 의사 백프로 있습니다~', sysdate, 'ggg', 19947716, '뽕신', 
   'reviewPics/china1.jpg','reviewPics/china2.jpg','reviewPics/china3.jpg','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'완전 반했어요', '으아아아ㅠ 얼른 또 가고 싶어요!', sysdate, 'iii', 19947716, '뽕신', 
   'reviewPics/china4.jpg','reviewPics/china5.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'정말 배고팠는데...', '배고픔을 채워주는 딱 좋은 식사였습니다.', sysdate, 'ccc', 19947716, '뽕신', 
   'reviewPics/china6.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'만족!', '정말 잘 먹었습니다~', sysdate, 'ddd', 19947716, '뽕신', 
   'reviewPics/china7.jpg', null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'음...', '기대했던 맛이 아니어서 슬픕니다.', sysdate, 'eee', 19947716, '뽕신', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'soso', '다시 갈 이유는 없을 것 같아요 ㅠ', sysdate, 'fff', 19947716, '뽕신', 
   null, null, null,'false');


----20092017	락앤웍
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'굿굿', '함께 나오는 반찬들도 맛있고 종류도 여러가지라서 정말 추천해 드리고 싶은 곳이에요~', sysdate, 'iii', 20092017, '락앤웍', 
   'reviewPics/china8.jpg','reviewPics/china9.jpg','reviewPics/china10.jpg','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'오오', '요 몇 달간 먹은 음식중에 제일 맛있었습니다!', sysdate, 'eee', 20092017, '락앤웍', 
   'reviewPics/china11.jpg','reviewPics/china12.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'좋아용', '간이 딱 좋았어요', sysdate, 'ccc', 20092017, '락앤웍', 
   'reviewPics/china13.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그닥..', '특별한게 없었습니다.', sysdate, 'bbb', 20092017, '락앤웍', 
   'reviewPics/china14.jpg', null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그냥 그래요', '맛은 별로여도 사장님은 친절하셨어요', sysdate, 'jjj', 20092017, '락앤웍', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'완전 별로', '이 돈주고 누가 식사를 하죠?', sysdate, 'fff', 20092017, '락앤웍', 
   null, null, null,'false');

----20252806	칭따오
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'나름 괜찮', '조용한 분위기였습니다.. 시끌벅적한 것을 싫어하는분들께 추천드립니다.', sysdate, 'iii', 20252806, '칭따오', 
   'reviewPics/china15.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'평이', '다른 체인점이랑 비슷했습니다.', sysdate, 'eee', 20252806, '칭따오', 
   'reviewPics/china16.jpg','reviewPics/china17.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'맛없음', '장사가 안되는 이유를 알겠음', sysdate, 'hhh', 20252806, '칭따오', 
   'reviewPics/china18.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'하..', '친구랑 오랜만에 만났는데 기분만 나빠졌네요.. 절대 가지마세요 여러분!!', sysdate, 'ggg', 20252806, '칭따오', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'완전 비추합니다', '이 가게 장사가 잘 안 되나요? 지나갈때마다 닫혀있다가 열었길래 갔는데 하.. 시간을 되돌리고 싶어요', sysdate, 'jjj', 20252806, '칭따오', 
   'reviewPics/china19.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'껄껄', '손님은 저희 테이블 뿐..', sysdate, 'fff', 20252806, '칭따오', 
   null, null, null,'false');
   
----20295124	베이징스토리
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'소문난 맛집!', '줄 서서 기다린 보람이 있게 정말 맛있었어요!! 저희 아이도 정말 잘 먹었답니다~', sysdate, 'ccc', 20295124, '베이징스토리', 
   'reviewPics/china20.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'아주 좋아요', '다음번에 가족들 모두 데리고 올 생각입니다', sysdate, 'bbb', 20295124, '베이징스토리', 
   'reviewPics/china21.jpg','reviewPics/china22.jpg','reviewPics/china23.jpg','true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'역시~~', '역시 맛집은 맛집이네요', sysdate, 'iii', 20295124, '베이징스토리', 
   'reviewPics/china24.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'찾았다 내 사랑', '찾았다 내 사랑~ 내가 찾던 사랑~ ', sysdate, 'ggg', 20295124, '베이징스토리', 
   null, null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'맛집중 맛집', '전국에서 찾아오는 음식점에 드디어 다녀갑니다', sysdate, 'jjj', 20295124, '베이징스토리', 
   'reviewPics/china25.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'맛은 있는데..', '두 시간이나 기다려서 들어왔어요 ㅠㅠ 그 정도 기다릴 맛은 아니에요..', sysdate, 'fff', 20295124, '베이징스토리', 
   'reviewPics/china26.jpg', null, null,'false');
   
   
----20601752	이것이짬뽕
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'캐캐캐캐캐캐맛있당', '이렇게 맛있을 수 있는건가요? 인생 맛집 찾았습니다.. 번창하세요!!', sysdate, 'bbb', 20601752, '이것이짬뽕', 
   'reviewPics/china27.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'사장님 잘생겼어요!!!', '여긴 맛보다 사장님 보러 옵니다ㅎㅎㅎ', sysdate, 'ccc', 20601752, '이것이짬뽕', 
   'reviewPics/china28.jpg','reviewPics/china29.jpg', null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천추천', '저번이 더 맛있었기는 하지만 그래도 맛있었어요!', sysdate, 'iii', 20601752, '이것이짬뽕', 
   'reviewPics/china30.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천은 안해요 ㅠ', '음식 비주얼이 별로에요.. ', sysdate, 'jjj', 20601752, '이것이짬뽕', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그냥 저냥 그래요', '사장님은 잘생기셨습니다', sysdate, 'ggg', 20601752, '이것이짬뽕', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'머리카락 나왔습니다', '항의했는데 저를 진상 취급하더라고요? 다신 안 갑니다.', sysdate, 'fff', 20601752, '이것이짬뽕', 
   null , null, null,'false');
   
   
----23315062	더가든
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'존맛!', '어제 다녀왔는데 오늘 또 가고 싶어요!!', sysdate, 'bbb', 23315062, '더가든', 
   'reviewPics/china31.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'서비스 감사합니다!', '맛있게 잘 먹고 갑니다~', sysdate, 'ddd', 23315062, '더가든', 
   'reviewPics/china32.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그냥 sns맛집', '가보니 별게 없네요', sysdate, 'hhh', 23315062, '더가든', 
   'reviewPics/china33.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천은 안해요 ㅠ', '음식 비주얼이 별로에요.. ', sysdate, 'iii', 23315062, '더가든', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'우물우물,,,', '입이 삼킬 생각을 안 하는 음식이었습니다...', sysdate, 'eee', 23315062, '더가든', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'사장님이 별로에요', '카드 결제 한다고 하니까 궁시렁 궁시렁...', sysdate, 'ccc', 23315062, '더가든', 
   null , null, null,'false');
   
----23354843	일공이육
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'딱 제 취향!', '취향 저격 당했어요~~ 비법좀 알려주세요!!', sysdate, 'bbb', 23354843, '일공이육', 
   'reviewPics/china34.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'엄마가 좋아해요!', '집에 와서 엄마가 계속 맛있다고 하시네요ㅎㅎ 감사합니다!!', sysdate, 'ddd', 23354843, '일공이육', 
   'reviewPics/china35.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'가격이 괜찮아요', '비쌀줄 알았는데 가격이 저렴해서 놀랐어요', sysdate, 'fff', 23354843, '일공이육', 
   'reviewPics/china36.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'딱 예상 되는 맛', '흔히 아는 그런 맛이에요. 기대는 하지 마시길', sysdate, 'ggg', 23354843, '일공이육', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'양이 왜 이렇게 적죠?', '누구 코에 붙이라고 이렇게 적게 주신건지..', sysdate, 'eee', 23354843, '일공이육', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'평-범', '찾아가지는 않을 맛이에요', sysdate, 'ccc', 23354843, '일공이육', 
   null , null, null,'false');
   
   
----23386721	해무리
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'너무 맛있어요~~', '쿠폰 벌써 다 모았어요! 조만간 가서 사이드메뉴 받을게요~', sysdate, 'bbb', 23386721, '해무리', 
   'reviewPics/china37.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'입맛 없을 때 딱이에요', '요 며칠 없었던 입맛이 돌아왔어요ㅎㅎ', sysdate, 'hhh', 23386721, '해무리', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'너무 짜요', '잘못해서 소금을 부으신 것 아닌가요?', sysdate, 'ggg', 23386721, '해무리', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'혀가 마비 되는 것 같아요', '정말 정말 자극적이에요 ㅠㅠ 애들은 못 먹겠어요', sysdate, 'jjj', 23386721, '해무리', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'실망..', '저번엔 괜찮았는데 이번에는 맛이 없네요ㅠㅠ', sysdate, 'eee', 23386721, '해무리', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'복불복', '여기 음식은 맛이 복불복인 것 같아요..', sysdate, 'ccc', 23386721, '해무리', 
   null , null, null,'false');

   
----23387779	센트럴차이나
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'집 앞 맛집', '가까운 거리 때문인지 자주 오게 될 것 같네요~', sysdate, 'ddd', 23387779, '센트럴차이나', 
   'reviewPics/china38.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천해요!', '아주 맛있지는 않아도 먹을만해요~', sysdate, 'bbb', 23387779, '센트럴차이나', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'장점이 없는 곳', '우연히 방문했는데 정말 장점이 하나도 없는 곳이었어요..', sysdate, 'ggg', 23387779, '센트럴차이나', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'청결 엉망이에요!', '여기저기 벌레들도 보이고 먼지도 굴러 다니고... 음식 파는 곳 맞나요?', sysdate, 'fff', 23387779, '센트럴차이나', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'우웩', '사장님.. 이건 아닌 것 같아요', sysdate, 'eee', 23387779, '센트럴차이나', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'하...', '돈 아깝습니다 정말', sysdate, 'ccc', 23387779, '센트럴차이나', 
   null , null, null,'false');
   
----23680479	엠비즈스타차이나
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'전설의 맛', '너무 맛있는거 아닌가요?', sysdate, 'ddd', 23680479, '엠비즈스타차이나', 
   'reviewPics/china39.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'인테리어가 예뻐요!', '플레이팅도 굿굿', sysdate, 'bbb', 23680479, '엠비즈스타차이나', 
   'reviewPics/china40.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'남알바생 완전 무례해요', '대답도 안 하고 계속 폰만 보고 있던데 교육을 다시 시켜야 할 것 같아요', sysdate, 'ggg', 23680479, '엠비즈스타차이나', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'오잉', '대체 이게 무슨 맛인거죠???', sysdate, 'iii', 23680479, '엠비즈스타차이나', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'알바생 싸가지...', '엄청 무례하고 일도 안 하고 통화는 왜 그렇게 오래 하는지...', sysdate, 'eee', 23680479, '엠비즈스타차이나', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'별로에요', '예쁜 것 뿐 그 이상은 바라지 않는게 좋아요', sysdate, 'ccc', 23680479, '엠비즈스타차이나', 
   null , null, null,'false');

   
   
   
   
   
--일식/수산물 insert
11765479	행복참치
11795084	송옥
11795380	미타니야
11921125	문어집
11958020	문어앤치킨
12039136	라운드어바웃
12046493	투뿔참치
12054957	스시가오
12060882	통통낙지
12072220	참치더테이블

----11765479	행복참치
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'정말 맛있어요!', '맛도 있고 집도 가까워서 재방문 의사 백프로 있습니다~', sysdate, 'ggg', 11765479, '행복참치', 
   'reviewPics/ilsick1.png','reviewPics/ilsick2.JPG','reviewPics/ilsick3.jpg','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'완전 반했어요', '으아아아ㅠ 얼른 또 가고 싶어요!', sysdate, 'iii', 11765479, '행복참치', 
   'reviewPics/ilsick4.jpg','reviewPics/ilsick5.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'정말 배고팠는데...', '배고픔을 채워주는 딱 좋은 식사였습니다.', sysdate, 'ccc', 11765479, '행복참치', 
   'reviewPics/ilsick6.JPG', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'만족!', '정말 잘 먹었습니다~', sysdate, 'ddd', 11765479, '행복참치', 
   'reviewPics/ilsick7.JPG', null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'음...', '기대했던 맛이 아니어서 슬픕니다.', sysdate, 'eee', 11765479, '행복참치', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'soso', '다시 갈 이유는 없을 것 같아요 ㅠ', sysdate, 'fff', 11765479, '행복참치', 
   null, null, null,'false');


----11795084	송옥
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'굿굿', '함께 나오는 반찬들도 맛있고 종류도 여러가지라서 정말 추천해 드리고 싶은 곳이에요~', sysdate, 'iii', 11795084, '송옥', 
   'reviewPics/ilsick8.png','reviewPics/ilsick9.JPG','reviewPics/ilsick10.JPG','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'오오', '요 몇 달간 먹은 음식중에 제일 맛있었습니다!', sysdate, 'eee', 11795084, '송옥', 
   'reviewPics/ilsick11.JPG','reviewPics/ilsick12.JPG',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'좋아용', '간이 딱 좋았어요', sysdate, 'ccc', 11795084, '송옥', 
   'reviewPics/ilsick13.JPG', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그닥..', '특별한게 없었습니다.', sysdate, 'bbb', 11795084, '송옥', 
   'reviewPics/ilsick14.JPG', null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그냥 그래요', '맛은 별로여도 사장님은 친절하셨어요', sysdate, 'jjj', 11795084, '송옥', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'완전 별로', '이 돈주고 누가 식사를 하죠?', sysdate, 'fff', 11795084, '송옥', 
   null, null, null,'false');

----11795380	미타니야
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'나름 괜찮', '조용한 분위기였습니다.. 시끌벅적한 것을 싫어하는분들께 추천드립니다.', sysdate, 'iii', 11795380, '미타니야', 
   'reviewPics/ilsick15.JPG', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'평이', '다른 체인점이랑 비슷했습니다.', sysdate, 'eee', 11795380, '미타니야', 
   'reviewPics/ilsick16.png','reviewPics/ilsick17.JPG',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'맛없음', '장사가 안되는 이유를 알겠음', sysdate, 'hhh', 11795380, '미타니야', 
   'reviewPics/ilsick18.JPG', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'하..', '친구랑 오랜만에 만났는데 기분만 나빠졌네요.. 절대 가지마세요 여러분!!', sysdate, 'ggg', 11795380, '미타니야', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'완전 비추합니다', '이 가게 장사가 잘 안 되나요? 지나갈때마다 닫혀있다가 열었길래 갔는데 하.. 시간을 되돌리고 싶어요', sysdate, 'jjj', 11795380, '미타니야', 
   'reviewPics/ilsick19.JPG', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'껄껄', '손님은 저희 테이블 뿐..', sysdate, 'fff', 11795380, '미타니야', 
   null, null, null,'false');
   
----11921125	문어집
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'소문난 맛집!', '줄 서서 기다린 보람이 있게 정말 맛있었어요!! 저희 아이도 정말 잘 먹었답니다~', sysdate, 'ccc', 11921125, '문어집', 
   'reviewPics/ilsick20.JPG', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'아주 좋아요', '다음번에 가족들 모두 데리고 올 생각입니다', sysdate, 'bbb', 11921125, '문어집', 
   'reviewPics/ilsick21.JPG','reviewPics/ilsick22.JPG','reviewPics/ilsick23.JPG','true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'역시~~', '역시 맛집은 맛집이네요', sysdate, 'iii', 11921125, '문어집', 
   'reviewPics/ilsick24.JPG', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'찾았다 내 사랑', '찾았다 내 사랑~ 내가 찾던 사랑~ ', sysdate, 'ggg', 11921125, '문어집', 
   null, null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'맛집중 맛집', '전국에서 찾아오는 음식점에 드디어 다녀갑니다', sysdate, 'jjj', 11921125, '문어집', 
   'reviewPics/ilsick25.JPG', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'맛은 있는데..', '두 시간이나 기다려서 들어왔어요 ㅠㅠ 그 정도 기다릴 맛은 아니에요..', sysdate, 'fff', 11921125, '문어집', 
   'reviewPics/ilsick26.JPG', null, null,'false');
   
   
----11958020	문어앤치킨
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'캐캐캐캐캐캐맛있당', '이렇게 맛있을 수 있는건가요? 인생 맛집 찾았습니다.. 번창하세요!!', sysdate, 'bbb', 11958020, '문어앤치킨', 
   'reviewPics/ilsick27.JPG', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'사장님 잘생겼어요!!!', '여긴 맛보다 사장님 보러 옵니다ㅎㅎㅎ', sysdate, 'ccc', 11958020, '문어앤치킨', 
   'reviewPics/ilsick28.JPG','reviewPics/ilsick29.JPG', null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천추천', '저번이 더 맛있었기는 하지만 그래도 맛있었어요!', sysdate, 'iii', 11958020, '문어앤치킨', 
   'reviewPics/ilsick30.JPG', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천은 안해요 ㅠ', '음식 비주얼이 별로에요.. ', sysdate, 'jjj', 11958020, '문어앤치킨', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그냥 저냥 그래요', '사장님은 잘생기셨습니다', sysdate, 'ggg', 11958020, '문어앤치킨', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'머리카락 나왔습니다', '항의했는데 저를 진상 취급하더라고요? 다신 안 갑니다.', sysdate, 'fff', 11958020, '문어앤치킨', 
   null , null, null,'false');
   
   
----12039136	라운드어바웃
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'존맛!', '어제 다녀왔는데 오늘 또 가고 싶어요!!', sysdate, 'bbb', 12039136, '라운드어바웃', 
   'reviewPics/ilsick31.JPG', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'서비스 감사합니다!', '맛있게 잘 먹고 갑니다~', sysdate, 'ddd', 12039136, '라운드어바웃', 
   'reviewPics/ilsick32.JPG', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그냥 sns맛집', '가보니 별게 없네요', sysdate, 'hhh', 12039136, '라운드어바웃', 
   'reviewPics/ilsick33.JPG', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천은 안해요 ㅠ', '음식 비주얼이 별로에요.. ', sysdate, 'iii', 12039136, '라운드어바웃', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'우물우물,,,', '입이 삼킬 생각을 안 하는 음식이었습니다...', sysdate, 'eee', 12039136, '라운드어바웃', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'사장님이 별로에요', '카드 결제 한다고 하니까 궁시렁 궁시렁...', sysdate, 'ccc', 12039136, '라운드어바웃', 
   null , null, null,'false');
   
----12046493	투뿔참치
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'딱 제 취향!', '취향 저격 당했어요~~ 비법좀 알려주세요!!', sysdate, 'bbb', 12046493, '투뿔참치', 
   'reviewPics/ilsick34.JPG', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'엄마가 좋아해요!', '집에 와서 엄마가 계속 맛있다고 하시네요ㅎㅎ 감사합니다!!', sysdate, 'ddd', 12046493, '투뿔참치', 
   'reviewPics/ilsick35.JPG', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'가격이 괜찮아요', '비쌀줄 알았는데 가격이 저렴해서 놀랐어요', sysdate, 'fff', 12046493, '투뿔참치', 
   'reviewPicsilsick36.JPG', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'딱 예상 되는 맛', '흔히 아는 그런 맛이에요. 기대는 하지 마시길', sysdate, 'ggg', 12046493, '투뿔참치', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'양이 왜 이렇게 적죠?', '누구 코에 붙이라고 이렇게 적게 주신건지..', sysdate, 'eee', 12046493, '투뿔참치', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'평-범', '찾아가지는 않을 맛이에요', sysdate, 'ccc', 12046493, '투뿔참치', 
   null , null, null,'false');
   
   
----12054957	스시가오
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'너무 맛있어요~~', '쿠폰 벌써 다 모았어요! 조만간 가서 사이드메뉴 받을게요~', sysdate, 'bbb', 12054957, '스시가오', 
   'reviewPics/ilsick37.JPG', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'입맛 없을 때 딱이에요', '요 며칠 없었던 입맛이 돌아왔어요ㅎㅎ', sysdate, 'hhh', 12054957, '스시가오', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'너무 짜요', '잘못해서 소금을 부으신 것 아닌가요?', sysdate, 'ggg', 12054957, '스시가오', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'혀가 마비 되는 것 같아요', '정말 정말 자극적이에요 ㅠㅠ 애들은 못 먹겠어요', sysdate, 'jjj', 12054957, '스시가오', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'실망..', '저번엔 괜찮았는데 이번에는 맛이 없네요ㅠㅠ', sysdate, 'eee', 12054957, '스시가오', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'복불복', '여기 음식은 맛이 복불복인 것 같아요..', sysdate, 'ccc', 12054957, '스시가오', 
   null , null, null,'false');

   
----12060882	통통낙지
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'집 앞 맛집', '가까운 거리 때문인지 자주 오게 될 것 같네요~', sysdate, 'ddd', 12060882, '통통낙지', 
   'reviewPics/ilsick38.JPG', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천해요!', '아주 맛있지는 않아도 먹을만해요~', sysdate, 'bbb', 12060882, '통통낙지', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'장점이 없는 곳', '우연히 방문했는데 정말 장점이 하나도 없는 곳이었어요..', sysdate, 'ggg', 12060882, '통통낙지', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'청결 엉망이에요!', '여기저기 벌레들도 보이고 먼지도 굴러 다니고... 음식 파는 곳 맞나요?', sysdate, 'fff', 12060882, '통통낙지', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'우웩', '사장님.. 이건 아닌 것 같아요', sysdate, 'eee', 12060882, '통통낙지', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'하...', '돈 아깝습니다 정말', sysdate, 'ccc', 12060882, '통통낙지', 
   null , null, null,'false');
   
----12072220	참치더테이블
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'전설의 맛', '너무 맛있는거 아닌가요?', sysdate, 'ddd', 12072220, '참치더테이블', 
   'reviewPics/ilsick39.JPG', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'인테리어가 예뻐요!', '플레이팅도 굿굿', sysdate, 'bbb', 12072220, '참치더테이블', 
   'reviewPics/ilsick40.JPG', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'남알바생 완전 무례해요', '대답도 안 하고 계속 폰만 보고 있던데 교육을 다시 시켜야 할 것 같아요', sysdate, 'ggg', 12072220, '참치더테이블', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'오잉', '대체 이게 무슨 맛인거죠???', sysdate, 'iii', 12072220, '참치더테이블', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'알바생 싸가지...', '엄청 무례하고 일도 안 하고 통화는 왜 그렇게 오래 하는지...', sysdate, 'eee', 12072220, '참치더테이블', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'별로에요', '예쁜 것 뿐 그 이상은 바라지 않는게 좋아요', sysdate, 'ccc', 12072220, '참치더테이블', 
   null , null, null,'false');
   
   
--양식 리뷰 insert
12117128	명진푸드
12117339	게이트나인
12444335	끌리마와인
12448901	고릴라펍앤볼링
12490565	써든스테이크
12512013	스테이크레이브
12548610	쉐프스테이션
12585092	카츄마마
12609192	시부야피아노
12612437	빈티지1988

----12117128	명진푸드
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'정말 맛있어요!', '맛도 있고 집도 가까워서 재방문 의사 백프로 있습니다~', sysdate, 'ggg', 12117128, '명진푸드', 
   'reviewPics/yangsick1.jpg','reviewPics/yangsick2.jpg','reviewPics/yangsick3.jpg','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'완전 반했어요', '으아아아ㅠ 얼른 또 가고 싶어요!', sysdate, 'iii', 12117128, '명진푸드', 
   'reviewPics/yangsick4.jpg','reviewPics/yangsick5.png',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'정말 배고팠는데...', '배고픔을 채워주는 딱 좋은 식사였습니다.', sysdate, 'ccc', 12117128, '명진푸드', 
   'reviewPics/yangsick6.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'만족!', '정말 잘 먹었습니다~', sysdate, 'ddd', 12117128, '명진푸드', 
   'reviewPics/yangsick7.jpg', null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'음...', '기대했던 맛이 아니어서 슬픕니다.', sysdate, 'eee', 12117128, '명진푸드', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'soso', '다시 갈 이유는 없을 것 같아요 ㅠ', sysdate, 'fff', 12117128, '명진푸드', 
   null, null, null,'false');


----12117339	게이트나인
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'굿굿', '함께 나오는 반찬들도 맛있고 종류도 여러가지라서 정말 추천해 드리고 싶은 곳이에요~', sysdate, 'iii', 12117339, '게이트나인', 
   'reviewPics/yangsick8.jpg','reviewPics/yangsick9.jpg','reviewPics/yangsick10.jpg','true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'오오', '요 몇 달간 먹은 음식중에 제일 맛있었습니다!', sysdate, 'eee', 12117339, '게이트나인', 
   'reviewPics/yangsick11.jpg','reviewPics/yangsick12.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'좋아용', '간이 딱 좋았어요', sysdate, 'ccc', 12117339, '게이트나인', 
   'reviewPics/yangsick13.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그닥..', '특별한게 없었습니다.', sysdate, 'bbb', 12117339, '게이트나인', 
   'reviewPics/yangsick14.jpg', null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그냥 그래요', '맛은 별로여도 사장님은 친절하셨어요', sysdate, 'jjj', 12117339, '게이트나인', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'완전 별로', '이 돈주고 누가 식사를 하죠?', sysdate, 'fff', 12117339, '게이트나인', 
   null, null, null,'false');

----12444335	끌리마와인
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'나름 괜찮', '조용한 분위기였습니다.. 시끌벅적한 것을 싫어하는분들께 추천드립니다.', sysdate, 'iii', 12444335, '끌리마와인', 
   'reviewPics/yangsick15.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'평이', '다른 체인점이랑 비슷했습니다.', sysdate, 'eee', 12444335, '끌리마와인', 
   'reviewPics/yangsick16.jpg','reviewPics/yangsick17.jpg',null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'맛없음', '장사가 안되는 이유를 알겠음', sysdate, 'hhh', 12444335, '끌리마와인', 
   'reviewPics/yangsick18.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'하..', '친구랑 오랜만에 만났는데 기분만 나빠졌네요.. 절대 가지마세요 여러분!!', sysdate, 'ggg', 12444335, '끌리마와인', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'완전 비추합니다', '이 가게 장사가 잘 안 되나요? 지나갈때마다 닫혀있다가 열었길래 갔는데 하.. 시간을 되돌리고 싶어요', sysdate, 'jjj', 12444335, '끌리마와인', 
   'reviewPics/yangsick19.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'껄껄', '손님은 저희 테이블 뿐..', sysdate, 'fff', 12444335, '끌리마와인', 
   null, null, null,'false');
   
----12448901	고릴라펍앤볼링
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'소문난 맛집!', '줄 서서 기다린 보람이 있게 정말 맛있었어요!! 저희 아이도 정말 잘 먹었답니다~', sysdate, 'ccc', 12448901, '고릴라펍앤볼링', 
   'reviewPics/yangsick20.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'아주 좋아요', '다음번에 가족들 모두 데리고 올 생각입니다', sysdate, 'bbb', 12448901, '고릴라펍앤볼링', 
   'reviewPics/yangsick21.jpg','reviewPics/yangsick22.jpg','reviewPics/yangsick23.jpg','true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'역시~~', '역시 맛집은 맛집이네요', sysdate, 'iii', 12448901, '고릴라펍앤볼링', 
   'reviewPics/yangsick24.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'찾았다 내 사랑', '찾았다 내 사랑~ 내가 찾던 사랑~ ', sysdate, 'ggg', 12448901, '고릴라펍앤볼링', 
   null, null, null,'true');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'맛집중 맛집', '전국에서 찾아오는 음식점에 드디어 다녀갑니다', sysdate, 'jjj', 12448901, '고릴라펍앤볼링', 
   'reviewPics/yangsick25.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'맛은 있는데..', '두 시간이나 기다려서 들어왔어요 ㅠㅠ 그 정도 기다릴 맛은 아니에요..', sysdate, 'fff', 12448901, '고릴라펍앤볼링', 
   'reviewPics/yangsick26.jpg', null, null,'false');
   
   
----12490565	써든스테이크
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'캐캐캐캐캐캐맛있당', '이렇게 맛있을 수 있는건가요? 인생 맛집 찾았습니다.. 번창하세요!!', sysdate, 'bbb', 12490565, '써든스테이크', 
   'reviewPics/yangsick27.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'사장님 잘생겼어요!!!', '여긴 맛보다 사장님 보러 옵니다ㅎㅎㅎ', sysdate, 'ccc', 12490565, '써든스테이크', 
   'reviewPics/yangsick28.jpg','reviewPics/yangsick29.jpg', null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천추천', '저번이 더 맛있었기는 하지만 그래도 맛있었어요!', sysdate, 'iii', 12490565, '써든스테이크', 
   'reviewPics/yangsick30.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천은 안해요 ㅠ', '음식 비주얼이 별로에요.. ', sysdate, 'jjj', 12490565, '써든스테이크', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그냥 저냥 그래요', '사장님은 잘생기셨습니다', sysdate, 'ggg', 12490565, '써든스테이크', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'머리카락 나왔습니다', '항의했는데 저를 진상 취급하더라고요? 다신 안 갑니다.', sysdate, 'fff', 12490565, '써든스테이크', 
   null , null, null,'false');
   
   
----12512013	스테이크레이브
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'존맛!', '어제 다녀왔는데 오늘 또 가고 싶어요!!', sysdate, 'bbb', 12512013, '스테이크레이브', 
   'reviewPics/yangsick31.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'서비스 감사합니다!', '맛있게 잘 먹고 갑니다~', sysdate, 'ddd', 12512013, '스테이크레이브', 
   'reviewPics/yangsick32.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'그냥 sns맛집', '가보니 별게 없네요', sysdate, 'hhh', 12512013, '스테이크레이브', 
   'reviewPics/yangsick33.jpg', null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천은 안해요 ㅠ', '음식 비주얼이 별로에요.. ', sysdate, 'iii', 12512013, '스테이크레이브', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'우물우물,,,', '입이 삼킬 생각을 안 하는 음식이었습니다...', sysdate, 'eee', 12512013, '스테이크레이브', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'사장님이 별로에요', '카드 결제 한다고 하니까 궁시렁 궁시렁...', sysdate, 'ccc', 12512013, '스테이크레이브', 
   null , null, null,'false');
   
----12548610	쉐프스테이션
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'딱 제 취향!', '취향 저격 당했어요~~ 비법좀 알려주세요!!', sysdate, 'bbb', 12548610, '쉐프스테이션', 
   'reviewPics/yangsick34.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'엄마가 좋아해요!', '집에 와서 엄마가 계속 맛있다고 하시네요ㅎㅎ 감사합니다!!', sysdate, 'ddd', 12548610, '쉐프스테이션', 
   'reviewPics/yangsick35.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'가격이 괜찮아요', '비쌀줄 알았는데 가격이 저렴해서 놀랐어요', sysdate, 'fff', 12548610, '쉐프스테이션', 
   'reviewPics/yangsick36.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'딱 예상 되는 맛', '흔히 아는 그런 맛이에요. 기대는 하지 마시길', sysdate, 'ggg', 12548610, '쉐프스테이션', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'양이 왜 이렇게 적죠?', '누구 코에 붙이라고 이렇게 적게 주신건지..', sysdate, 'eee', 12548610, '쉐프스테이션', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'평-범', '찾아가지는 않을 맛이에요', sysdate, 'ccc', 12548610, '쉐프스테이션', 
   null , null, null,'false');
   
   
----12585092	카츄마마
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'너무 맛있어요~~', '쿠폰 벌써 다 모았어요! 조만간 가서 사이드메뉴 받을게요~', sysdate, 'bbb', 12585092, '카츄마마', 
   'reviewPics/yangsick37.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'입맛 없을 때 딱이에요', '요 며칠 없었던 입맛이 돌아왔어요ㅎㅎ', sysdate, 'hhh', 12585092, '카츄마마', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'너무 짜요', '잘못해서 소금을 부으신 것 아닌가요?', sysdate, 'ggg', 12585092, '카츄마마', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'혀가 마비 되는 것 같아요', '정말 정말 자극적이에요 ㅠㅠ 애들은 못 먹겠어요', sysdate, 'jjj', 12585092, '카츄마마', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'실망..', '저번엔 괜찮았는데 이번에는 맛이 없네요ㅠㅠ', sysdate, 'eee', 12585092, '카츄마마', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'복불복', '여기 음식은 맛이 복불복인 것 같아요..', sysdate, 'ccc', 12585092, '카츄마마', 
   null , null, null,'false');

   
----12609192	시부야피아노
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'집 앞 맛집', '가까운 거리 때문인지 자주 오게 될 것 같네요~', sysdate, 'ddd', 12609192, '시부야피아노', 
   'reviewPics/yangsick38.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'추천해요!', '아주 맛있지는 않아도 먹을만해요~', sysdate, 'bbb', 12609192, '시부야피아노', 
   null, null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'장점이 없는 곳', '우연히 방문했는데 정말 장점이 하나도 없는 곳이었어요..', sysdate, 'ggg', 12609192, '시부야피아노', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'청결 엉망이에요!', '여기저기 벌레들도 보이고 먼지도 굴러 다니고... 음식 파는 곳 맞나요?', sysdate, 'fff', 12609192, '시부야피아노', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'우웩', '사장님.. 이건 아닌 것 같아요', sysdate, 'eee', 12609192, '시부야피아노', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'하...', '돈 아깝습니다 정말', sysdate, 'ccc', 12609192, '시부야피아노', 
   null , null, null,'false');
   
----12612437	빈티지1988
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'전설의 맛', '너무 맛있는거 아닌가요?', sysdate, 'ddd', 12612437, '빈티지1988', 
   'reviewPics/yangsick39.jpg', null, null,'true');
 
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'인테리어가 예뻐요!', '플레이팅도 굿굿', sysdate, 'bbb', 12612437, '빈티지1988', 
   'reviewPics/yangsick40.jpg', null, null,'true');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'남알바생 완전 무례해요', '대답도 안 하고 계속 폰만 보고 있던데 교육을 다시 시켜야 할 것 같아요', sysdate, 'ggg', 12612437, '빈티지1988', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'오잉', '대체 이게 무슨 맛인거죠???', sysdate, 'iii', 12612437, '빈티지1988', 
   null, null, null,'false');
  
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'알바생 싸가지...', '엄청 무례하고 일도 안 하고 통화는 왜 그렇게 오래 하는지...', sysdate, 'eee', 12612437, '빈티지1988', 
   null, null, null,'false');
   
insert into review  
   values (REVIEW_SEQ.NEXTVAL,'별로에요', '예쁜 것 뿐 그 이상은 바라지 않는게 좋아요', sysdate, 'ccc', 12612437, '빈티지1988', 
   null , null, null,'false');



===================================================================================================================================
-------------북마크(즐겨찾기) crud------------
select * from bookmark;
delete from bookmark;
select * from bookmark where res_id='25398530' and member_id = 'aaa';
delete from bookmark where res_id='25398530' and member_id = 'aaa';

--memberId가 'aaa'인 회원의 북마크 insert
insert into BOOKMARK values(BOOKMARK_SEQ.NEXTVAL, 'aaa', 12482031); --12482031	이태리부대찌개
insert into BOOKMARK values(BOOKMARK_SEQ.NEXTVAL, 'aaa', 11982599); --11982599	에뽕버거
insert into BOOKMARK values(BOOKMARK_SEQ.NEXTVAL, 'aaa', 20252806); --20252806	칭따오
insert into BOOKMARK values(BOOKMARK_SEQ.NEXTVAL, 'aaa', 20295124); --20295124	베이징스토리
insert into BOOKMARK values(BOOKMARK_SEQ.NEXTVAL, 'aaa', 11958020); --11958020	문어앤치킨
insert into BOOKMARK values(BOOKMARK_SEQ.NEXTVAL, 'aaa', 12512013); --12512013	스테이크레이브


===================================================================================================================================
-------------리뷰에 대한 좋아요------------
select * from recommend;

--리뷰를 추천순으로 보여주기 위한 여러회원의 리뷰 추천 insert
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


insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 242); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 244);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 246);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 248);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 250);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 252); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 254);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 256);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 258);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 260);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 262); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 264);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 266);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 268);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 270);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 272); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 274);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 276);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 278);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 280);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 282); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 284);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 286);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 288);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 290);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 292); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 294);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 296);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 298);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'bbb', 300);

select * from recommend;

commit



-----------------------------------------------------------------
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


insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 242);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 246);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 248);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 252); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 254);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 258);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 260);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 264);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 266);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 270);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 272);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 276);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 278);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 282); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 284);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 288);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 290); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 294);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 296);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ccc', 300);


----------------------------------------------------------------

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


insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 246);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 252);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 258);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 264);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 270);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 276);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 282);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 288); 
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 294);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'ddd', 300);



--memberId가 'aaa'인 회원의 recommend insert
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

insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 241);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 246);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 251);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 256);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 261);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 266);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 271);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 276);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 281);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 286);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 291);
insert into recommend values(RECOMMEND_SEQ.NEXTVAL, 'aaa', 296);


