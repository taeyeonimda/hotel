<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp"%>
<!DOCTYPE html>
<head>
<title>예약 목록</title>
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
function noRes(){
    if($('#resList').find('tr').length == 0){
       $('#noRes').show();
    }else{
       $('#noRes').hide();
    }
 }


$(()=>{
 noRes();

 
});
</script>
<div class="container">
	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
	<br>
	<br>
	<br>
	<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 예약내역 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
	<ul class='location'>
		<li>예약 목록</li>
	</ul>
	<table class='table' style="margin: auto;">
		<thead class='thead-dark' style="padding: 15px;">
			<tr id="tr" style="vertical-align: middle; text-size: 20px;">
				<th style="padding: 15px;">예약 번호</th>
				<th style="vertical-align: middle;">예약 날짜</th>
				<th style="vertical-align: middle;">예약 정보</th>
				<th style="vertical-align: middle;">결제 상태</th>
			</tr>
		</thead>

		<tbody id="resList">
			<c:forEach var="res" items="${reservations}">
				<tr>
					<td style="padding: 15px;">${res.resNum}</td>
					<td style="vertical-align: middle;">${res.resDate}</td>
					<td style="vertical-align: middle;">
						<ul class='list-unstyled' id='info'
							onclick="location.href='./resInfo?resNum=${res.resNum}'">
							<li><strong style='font-size: 16px'>호수 :
									${res.roomNum}</strong></li>
							<li><small style='color: #777777'>인원 :
									${res.resPernum}명</small></li>
							<li><small style='color: #777777'>가격 :
									${res.resPrice}원</small></li>
						</ul>
					</td>
					<td style="vertical-align: middle;">결제완료</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id='noRes' align="center">
		<h3>예약이 없습니다.</h3>
	</div>
	<div style="display: block; text-align: center;">
		<nav class='Page'>
			<ul class='pagination'>
				<c:if test="${paging.startPage != 1 }">
					<li class="page-item"><a class="page-link"
						href="./resList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
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
								href="./resList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
						</c:when>

					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<li class="page-item"><a class="page-link"
						href="./resList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
	<!-- 페이징 끝-->
	<!-- END END END END END END END END 예약내역 END END END END END END END -->
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
</body>
<footer>
	<%@ include file="../common/footer.jsp"%>
</footer>