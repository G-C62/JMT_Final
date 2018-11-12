<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 a{text-decoration: none}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-3.3.1.min.js"></script>
<script>
   $(function(){
      
      //location.href="../jmt?command=restaurant.selectFive";
      
      $("select[name=order]").on("change" , function(){
          $.ajax({
             url : "${pageContext.request.contextPath}/orderRestaurantAjaxServle", //서버 요청 주소
             type : "post", //get or post 요청방식
             dataType : "json", //서버가 보내오는 데이터 타입(text,html,json,xml)
             data : "category=${param.category}&orderby="+$(this).val(), //서버에게 보내는 parameter 정보
             success : function(result){
               
                var str = "";
                                
                $.each(result, function(index, item){
                   str += "<h3>" + (index+1) + "번째 음식점</h3> ";
                   str += "음식점 이름 : " + item.resName + " <br>";
                }); 
                
                $("#allRestaurant").empty();
                $("#allRestaurant").append(str);
                
             },
             error : function(err){
                alert(err + "=> 예외발생!!");
             }            
        }); 
      });
      //자동완성
      $("#keyWord").keyup(function(){
         if($(this).val()==""){
             $("#suggest").hide();
             return;
          }
         $.ajax({
             url:"${pageContext.request.contextPath}/autoCompleteRestaurant",      //서버주소
             type:"post",   //요청방식
             dataType:"json",//서버가 보내준 데이터 타입 text,json,xml,html
             data:"keyWord="+$(this).val(),   //서버에게 보내는 파라미터 정보
             success:function(result){   //성공했을 시 함수
                var str="";
                $.each(result, function(index, item){
                   console.log(item.resName);
                   str+="<a href='#'>"+item.resName+"</a><br>";
                })
                $("#suggest").html(str);
                $("#suggest").show();
             },   
             error:function(err){
                console.log(err+" --> 발생함 ");
             }    //실패했을 시 함수
          });
         if($(this).val()==""){
             $("#suggest").hide();
             return;
          }
      });
      $(document).on("click", "a", function(){
          $("#keyWord").val($(this).text());
          $("#suggest").hide();
       });
      
      
      $("#bookmark").on("click" , function(){       
          var starImg = document.getElementById('starImg');
          var flag = 'insert';
           if (starImg.src.indexOf('_fill') == -1) 
           { //_fill이라는 단어가 존재하지 않으면 star.png을 보여줌
              starImg.src = starImg.src.replace('.png', '_fill.png');
           } else 
           {
              starImg.src = starImg.src.replace('_fill.png', '.png');
               flag = 'delete';
           }
           $.ajax({
               url : "${pageContext.request.contextPath}/bookMarkToggleAjaxServlet", //서버 요청 주소
                type : "post", //get or post 요청방식
                dataType : "text", //서버가 보내오는 데이터 타입(text,html,json,xml)
                data : "resId=${requestScope.resId}&memberId=${requestScope.memberId}&flag="+flag, 
                //아이디를 고정해 주었지만 합치면 application에서 꺼내 와야 함
                success : function(result){ //0, 1
                   //alert(result);
        
                },
                error : function(err){
                   alert(err + "=> 예외발생!!");
                }       
           });
         });
   });
</script>   
</head>
<body>
<a href="jmt?command=member.myBookmark">눌러</a>


<form name="search" id="search">
   <input type="text" maxlength="10" name="keyWord" id="keyWord"/>
   <input type="button" value="검색"/>
</form>
<!--제시어 단어 출력부분 -->
<div id=suggest></div>


<%-- <c:forEach items="${RestaurantFiveSelect}" var="Five" varStatus = "state">
    <br>
    음식점 이름 : ${Five.resName}<br>
    음식점 사진 : ${Five.reviewImg1}
</c:forEach> --%>


<form id="hansick">
<c:forEach items="${hansickFiveSelect}" var="hansickFive" varStatus = "state">
    <br>
    한식음식점 이름 : ${hansickFive.resName}<br>
    음식점 사진 : <img src='${hansickFive.reviewImg1 }'>
</c:forEach>
<input type="button" value="더 보기" onclick="location.href='jmt?command=restaurant.selectAllRestaurant&category=한식'">
</form>
<form id="ilsik">
<c:forEach items="${ilsickFiveSelect}" var="ilsickFive" varStatus = "state">
    <br>
    일식음식점 이름 : ${ilsickFive.resName}<br>
    음식점 사진 : <img src='${ilsickFive.reviewImg1 }'>
</c:forEach>
<input type="button" value="더 보기" onclick="location.href='jmt?command=restaurant.selectAllRestaurant&category=일식'">
</form>
<form id="jungsik">
<c:forEach items="${jungsickFiveSelect}" var="jungFive" varStatus = "state">
    <br>
    중식음식점 이름 : ${jungFive.resName}<br>
    음식점 사진 : <img src='${jungFive.reviewImg1 }'>
</c:forEach>
<input type="button" value="더 보기" onclick="location.href='jmt?command=restaurant.selectAllRestaurant&category=중식'">
</form>

<!-- 더 보기 눌렀을때 전체 음식점 뿌려주는 곳. -->
<form id="allRestaurants">
<select name="order">
     <option value="최신순" selected="selected">추천순</option>
     <option value="좋아요순">가나다순</option>
</select>
<div id="allRestaurant">
<c:forEach items="${selectAllRestaurant}" var="allRestaurant" varStatus = "state">
    <br>
    음식점 이름 : ${allRestaurant.resName}<br>
</c:forEach>
</div>
</form>

       <div id="bookmark">
          <c:choose>
             <c:when test="${requestScope.bookMarkYesOrNo==false}">
              <img src="${pageContext.request.contextPath}/img/star.png"
                   id="starImg" style="cursor: pointer" />
          </c:when>
          <c:otherwise> 
            <img src="${pageContext.request.contextPath}/img/star_fill.png"
                   id="starImg" style="cursor: pointer" />
         </c:otherwise>
      </c:choose>
       </div>
  
   
   ${requestScope.bookMarkYesOrNo}<br>
   
   
</body>
</html>