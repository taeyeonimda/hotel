<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp"%>
<!DOCTYPE html>
<head>
<title>환불 목록</title>
<meta charset="utf-8">
</head>
<style>
.title span {
	font-size: 21px;
	color: #d2d2d2;
	font-weight: 500;
	letter-spacing: 0em;
	margin-left: 3px;
}

.location li {
	float: left;
	margin: 10px 0px 10px -35px;
	list-style: none;
	font-size: 18px;
	font-weight: 700;
}

.location li::before {
	color: #6E6E6E;
	content: "〉";
	padding-right: 10px;
}

.page_wrap {
	text-align: center;
	font-size: 0;
}

.page_nation {
	display: inline-block;
}

.page_nation .none {
	display: none;
}

.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.table th, td {
	text-align: center;
	height-aling: center;
}

th {
	background-color: #343a40;
	color: white;
}

a {
	text-decoration: none;
}
</style>
<script>
function noRefund(){
    if($('#refundList').find('tr').length == 0){
       $('#noRefund').show();
    }else{
       $('#noRefund').hide();
    }
 }


$(()=>{
 noRefund();

 
});
</script>
<header>
	<%@ include file="../common/header.jsp"%>
</header>
<body>
	<div class="container">
		<br>
		<br>
		<br>
		<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 게시판 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
		<ul class='location'>
			<li>환불 목록</li>
		</ul>
		<table class='table' style="margin: auto;">
			<thead class='thead-dark' style="padding: 15px;">
				<tr id="tr" style="vertical-align: middle; text-size: 20px;">
					<th style="padding: 15px;">환불번호</th>
					<th style="vertical-align: middle;">회원 정보</th>
					<th style="vertical-align: middle;">환불 날짜</th>
					<th style="vertical-align: middle;">환불 상태</th>
				</tr>
			</thead>

			<tbody id="refundList">
				<c:forEach var="refund" items="${refunds}">
					<tr>
						<td style="padding: 15px;">${refund.refundNum}</td>
						<td style="vertical-align: middle;">
							<ul class='list-unstyled' id='info'
								onclick="location.href='./refundInfo?refundNum=${refund.refundNum}'">
								<li><strong style='font-size: 16px'>${refund.userId}</strong></li>
							</ul>
						</td>
						<td style="vertical-align: middle;">${refund.refundDate}</td>
						<td style="vertical-align: middle;">${refund.refundStatus}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id='noRefund' align="center">
			<h3>환불내역이 없습니다.</h3>
		</div>
		<div style="display: block; text-align: center;">
			<nav class='Page'>
				<ul class='pagination'>
					<c:if test="${paging.startPage != 1 }">
						<li class="page-item"><a class="page-link"
							href="./refundList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
						var="p">
						<c:choose>

							<c:when test="${p == paging.nowPage }">
								<li class="page-item"><a class="page-link"
									style='font-weight: bold;'>${p }</a></li>
							</c:when>

							<c:when test="${p != paging.nowPage }">
								<li class="page-item"><a class="page-link"
									href="./refundList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
							</c:when>

						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<li class="page-item"><a class="page-link"
							href="./refundList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
	<!-- 페이징 끝-->
	<!-- END END END END END END END END 게시판 END END END END END END END -->
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
</body>