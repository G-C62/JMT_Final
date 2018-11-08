<%@page import="jmt.mvc.model.dto.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<h1>요청결과 : </h1>
<c:forEach items="${listMyBookMark}" var="bookMark" varStatus = "state">
    <h2>${state.count}번째 즐겨찾기한 음식점</h2>  
    음식점 이름 : ${bookMark.resName} <br>
    <c:if test="${bookMark.review_img1}==null">${bookMark.review_img1}=<%=request.getParameter("1") %></c:if>
    
    음식점 사진 : <img src='${bookMark.review_img1}'><br>
    
 </c:forEach>
</body>
</html>