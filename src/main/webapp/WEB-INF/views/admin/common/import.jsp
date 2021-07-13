<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix ='c' uri='http://java.sun.com/jsp/jstl/core'%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"><!-- logo -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet"><!-- fonts.google.com 한글폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Caveat:wght@700&display=swap" rel="stylesheet"><!--  fonts.google.com 영어폰트 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- 다음지도 -->
<script src="<c:url value="/js/daum.js"/>" ></script> 
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css' />
<script src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js'></script>
<script>
function alert(text){
	   swal({
	        title: "",
	        text, 
	        icon:"",
	        timer:1000,
	        buttons:false,
	      });
	}
</script>

<body>
<c:choose>
<c:when test="${sessionScope.user.userId =='admin'}">
</c:when>
<c:when test="${sessionScope.user.userId !='admin'}">
<c:redirect url='/user/logout'/>
</c:when>
</c:choose>
</body>