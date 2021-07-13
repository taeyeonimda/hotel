<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../common/import.jsp"%>
<title>후기내용</title>
</head>
<script>
	function alert_del() {
		swal(
				{
					title : "삭제하시겠습니까?",
					text : "삭제한 후기는 복구되지 않습니다",
					type : "warning",
					showCancelButton : true,
					cancelButtonText : "아니요",
					confirmButtonText : "예",
					closeOnConfirm : false
				},
				function() {
					swal({
						type : "success",
						title : "게시물이 삭제되었습니다.",
						showConfirmButton : false
					});
					setTimeout(
							function() {
								location.href = './removeReview.do?reviewNum=${review.reviewNum}'
							}, 1500)
				});
	};
	
	$(()=>{
		$("#modiBtn").click(()=>{
			location.href='./reviewModi';
		})
		 
	})
</script>

<style>
#reviewTable {
	border-collapse: separate;
	border-spacing: 0;
	line-height: 1.5;
	margin: 50px 10px;
}

#reviewTh {
	width: 50px;
	padding: 10px;
	font-weight: bold;
	align: center;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #fff;
	border-left: 1px solid #fff;
	background: #eee;
}

#reviewTd {
	width: 150px;
	padding: 10px;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}
</style>
<header><%@ include file="../common/header.jsp"%></header>
<body>
	<div class="container">
		<h3>후기 내용</h3>
		<c:choose>
			<c:when test="${sessionScope.review!=null}">
				<table id="reviewTable" class="table  table-bordered">
					<tbody>
						<tr>
							<th id="reviewTh">번호</th>
							<td id="reviewTd">${review.reviewNum}</td>
						</tr>
						<tr>
							<th id="reviewTh">작성자</th>
							<td id="reviewTd">${review.userId}</td>
						</tr>
						<tr>
							<th id="reviewTh">제목</th>
							<td id="reviewTd">${review.reviewTitle}</td>
						</tr>
						<tr>
							<th id="reviewTh">평점</th>
							<td id="reviewTd">${review.reviewRating}점</td>
						</tr>
						<tr>
							<th id="reviewTh">방타입</th>
							<td id="reviewTd">${review.reviewRoomType}</td>
						</tr>
						<tr>
							<th id="reviewTh">내용</th>
							<td id="reviewTd">${review.reviewContent}</td>
						</tr>
					</tbody>
				</table>
				<c:if test="${sessionScope.user.userId == 'admin'}">
					<button type="button" class="btn btn-danger" onclick="alert_del()">삭제</button>
				</c:if>
			</c:when>
			<c:otherwise>
				<div>선택된 게시물이 없습니다. 뒤로 돌아가시려면 밑에 목록을 눌러주세요</div>
			</c:otherwise>
		</c:choose>

		<button class="btn btn-default"
			onclick="location.href = './reviewList' " style="float: right;">목록</button>
	</div>

</body>
<footer> <%@ include file="../common/footer.jsp"%>
</footer>
