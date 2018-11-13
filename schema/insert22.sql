--리뷰 insert
----12482031   이태리부대찌개

select distinct RESTAURANT.RES_ID, RESTAURANT.RES_NAME, REVIEW.REVIEW_IMG1
from review RIGHT join RESTAURANT on review.res_id = RESTAURANT.res_id
WHERE RESTAURANT.RES_CATEGORY like '패스트푸드'
GROUP BY RESTAURANT.RES_ID, RESTAURANT.RES_NAME, REVIEW.REVIEW_IMG1

select * from review;

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


----12489990   원조양평해장국
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

----12492426   군산오징어
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
   
----12508903   매드피셔맨
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
   
   
----12510865   세어부의밥상
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
   
   
----12515776   박가부대찌개
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