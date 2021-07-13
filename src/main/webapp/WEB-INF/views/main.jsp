<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./common/import.jsp" %>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script><!-- google map -->
<!DOCTYPE html>
<meta charset='utf-8'>
<title> 트래블하우스 user main </title>
<style>
.title{text-align: center; font-size: 16px; color: #2E2E2E; padding: 50px 10px;}
.description{padding: 50px 15px 20px 15px; font-size: 14px; line-height: 25px; text-align: center;}
</style>
<header>
   <%@ include file="./common/header.jsp" %>
</header>

<c:if test="${sessionScope.user.userId == 'admin' }">
   <c:redirect url="./admin"/>
</c:if>      
<body>

<div class='title'>
   <p>TRAVEL HOUSE</p>
</div>

<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ pics $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
<img style='width:100%; height:100%; margin: 0 auto;' src='<c:url value="attach/banner/banner.jpg" />' />
</body>
<br><br><br><br><br>
<footer><%@ include file="./common/footer.jsp" %></footer>