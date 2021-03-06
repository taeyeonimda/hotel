<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>프로필 정보</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {background: linear-gradient(to right, white, pink);}
.login-form {width: 500px; margin: 50px auto;}
.login-form form {margin-bottom: 20px; background: white; box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.5);padding: 30px;}
.login-form h2 {margin: 0 0 15px;}
.form-control, .btn {min-height: 40px; border-radius: 2px;}
.btn {font-size: 15px; font-weight: bold;}

.title span{font-size: 21px; color: #d2d2d2; font-weight: 500; letter-spacing: 0em; margin-left: 3px;}
.location li{float: left; margin : 10px 0px 10px -35px; list-style: none; font-size: 18px; font-weight: 700;}
.location li::before{color: #6E6E6E; content: "〉"; padding-right: 10px;}
.page_wrap {text-align:center; font-size:0;}
.page_nation {display:inline-block;}
.page_nation .none {display:none;}
.page_nation a.active {background-color:#42454c; color:#fff; border:1px solid #42454c;}
.page_nation a {display:block; margin:0 3px; float:left; border:1px solid #e6e6e6;  width:28px; height:28px; line-height:28px; text-align:center; background-color:#fff; font-size:13px; color:#999999; text-decoration:none;}
.table th, td{text-align: center; height-aling: center;}
th {background-color: #343a40; color: white;}
a  {text-decoration: none;}
</style>
</head>
<body>
<header>
	<%@ include file="../common/header.jsp" %>
</header> 
<div class = 'container'><!-- 화면 여백 -->

<div class="login-form">
    <form>
        <h1 class="text-center"><b class='font-kr' style='font-size:50px;'>회원정보</b></h1><br>
        <p class="text-left font-kr" style='font-size:20px;'>회원님의 정보입니다.</p>
        <div class="form-group"><input class="form-control" value = "${sessionScope.userInfo.userId}"readonly></div>
        <div class="form-group"><input class="form-control" value = "${sessionScope.userInfo.userName}"readonly></div>    
        <div class="form-group"><input class="form-control" value ="${sessionScope.userInfo.userBirth}"readonly></div>
        <div class="form-group"><input class="form-control" value = "${sessionScope.userInfo.userTel}"readonly></div>
        <div class="form-group"><input class="form-control" value = "${sessionScope.userInfo.userEmail}"readonly></div>
        <div class="form-group"><input class="form-control" value = "${sessionScope.userInfo.userAddr}"readonly></div>
    <br><br>
    <div class="text-center"><button type="button" class="btn btn-info" style="width: 50%"onclick="location.href='./modUser' ">수정</button></div><br>
    </form>
</div><br><br><!-- END END END END END END END END 회원정보 END END END END END END END END -->
</div>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>
