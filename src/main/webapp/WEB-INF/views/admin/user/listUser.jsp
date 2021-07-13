<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>트래블하우스 회원리스트</title>

<script>
$(()=>{ 
	$("input[name=userId]").click(()=>{
		let userId = $("input:checked").val();
		 
		let testId = $('#testId').val(userId);
		if(testId==""){
			alert("회원을 선택해주세요");
			return;
		}else{
			joinForm.submit();
		}
		
	})
});

</script>
<style>
body {background: linear-gradient(to right, #169ac9, white);}
.login-form {width: 700px; margin: 50px auto;}
.login-form form {margin-bottom: 20px; background: white; box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.5);padding: 30px;}
.login-form h2 {margin: 0 0 15px;}
.form-control, .btn {min-height: 40px; border-radius: 2px;}
.btn {font-size: 15px; font-weight: bold;}
</style>
</head>
<body>
<header>
<%@ include file="../common/header.jsp" %>
</header>
<div class='container'>
		<div class="login-form">
			<form name="joinForm" action='./userInfo' >
				<br>
				<h2 class="text-center">
					<b class='font-kr' style='font-size: 50px;'>회원목록</b>
				</h2>
				<br>
				<table class="table table-hover text-center">
					<thead>
						<tr>
							<th>선택</th>
							<th class="text-center">회원 ID</th>
							<th class="text-center">이름</th>
							<th class="text-center">생년월일</th>
							<th class="text-center">등급</th>
						</tr>
					</thead>
						
					<tbody>
				<c:forEach var="users" items="${users}">
					<tr>
						<td><input type='radio' name='userId' id='userId' value='${users.userId }'></td>
						<td>${users.userId}</td>
   						<td> <c:out value="${users.userName}"/></td>
    					<td><c:out value="${users.userBirth}"/></td>
  						<td> <c:out value="${users.userClass}"/></td>
					</tr>
				</c:forEach>	
					</tbody>
				</table>
				<input type='hidden' id='testId' name='testId'>
		
				<br>
				<br>
				<p class="text-left font-kr" style='font-size: 20px;'>회원을 선택하세요.</p>
			
			<div style="display: block; text-align: center;">
      <nav class='Page'>    
      <ul class='pagination'>
      <c:if test="${paging.startPage != 1 }">
         <li class="page-item" ><a class="page-link" href="/hotel/admin/user/listUser?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
      </c:if>
      <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
         <c:choose>
            
            <c:when test="${p == paging.nowPage }">
               <li class="page-item" ><a class="page-link" style='font-weight:bold;'>${p }</a></li>
            </c:when>
            
            <c:when test="${p != paging.nowPage }">
               <li class="page-item"  ><a class="page-link" href="/hotel/admin/user/listUser?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
            </c:when>
            
         </c:choose>
      </c:forEach>
      <c:if test="${paging.endPage != paging.lastPage}">
         <li class="page-item"  ><a class="page-link" href="/hotel/admin/user/listUser?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
      </c:if>
      </ul> 
      </nav> 
   </div>
			
			</form>

		</div>
		
		

	</div>
</body>
<footer>
<%@ include file="../common/footer.jsp" %>
</footer>