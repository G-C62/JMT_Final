--���� insert
----12482031   ���¸��δ��

select distinct RESTAURANT.RES_ID, RESTAURANT.RES_NAME, REVIEW.REVIEW_IMG1
from review RIGHT join RESTAURANT on review.res_id = RESTAURANT.res_id
WHERE RESTAURANT.RES_CATEGORY like '�н�ƮǪ��'
GROUP BY RESTAURANT.RES_ID, RESTAURANT.RES_NAME, REVIEW.REVIEW_IMG1

select * from review;

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


----12489990   �����������屹
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

----12492426   �����¡��
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
   
----12508903   �ŵ��ǼŸ�
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
   
   
----12510865   ������ǹ��
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
   
   
----12515776   �ڰ��δ��
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