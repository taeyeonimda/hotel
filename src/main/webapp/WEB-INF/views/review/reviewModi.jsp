<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<header><%@ include file="../common/header.jsp"%></header>


<!-- layout import -->
</head>
<script>
$(()=>{
	modi();
	$("#reviewContent").summernote({
	       minHeight: 550,
	       maxHeight: 550,
	       focus: true, 
	       lang : 'ko-KR',
	       toolbar: [
	           // [groupName, [list of button]]
	           ['style', ['bold', 'italic', 'underline', 'clear']],
	           ['font', ['strikethrough', 'superscript', 'subscript']],
	           ['fontsize', ['fontsize']],
	           ['color', ['color']],
	           ['para', ['ul', 'ol', 'paragraph']],
	           ['height', ['height']]
	         ]
	   })
})


function modi(){
	$("#modiBtn").click(()=>{
		
		let reviewNum=$("#reviewNum").val();
	    let reviewTitle = $("#reviewTitle").val();
	    let reviewContent=$("#reviewContent").val();
	    let reviewRating=$("#reviewRating").val();
	    let reviewRoomType=$("#reviewRoomType").val();
	    
	    if(reviewTitle.trim()==""){
	    	alert("제목을 입력해주세요.");
	    	return;
	    }
	    if(reviewContent.trim() == ""){
	    	alert("내용을 입력해주세요.");
	    	return;
	    }	    	
	    	
		$.ajax({
		         url:"./modiReview",
		         data:{
		        	reviewNum: reviewNum,
		            reviewTitle: reviewTitle,
		            reviewContent: reviewContent,
		            reviewRating: reviewRating,
		            reviewRoomType: reviewRoomType,
		         },
		         success: ()=>{	
		        	 alert("수정에 성공하였습니다.")
					 setTimeout('location.href="./reviewList"',1500)
		         },
		         error: () => {alert("수정에 실패했습니다.")}
		      })
	})
}

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

<body>
	<div class="container">
		<h3>후기 수정</h3>
		<c:choose>
			<c:when test="${sessionScope.review != null}">
				<table id="reviewTable" class="table  table-bordered">
					<tbody>
						<tr>
							<th id="reviewTh">번호</th>
							<td id="reviewTd"><input type="text" id="reviewNum" value="${review.reviewNum}" readonly></td>
						</tr>
						<tr>
							<th id="reviewTh">작성자</th>
							<td id="reviewTd">${review.userId}</td>
						</tr>
						<tr>
							<th id="reviewTh">제목</th>
							<td id="reviewTd"><input type="text" class="form-control"
								name="reviewTitle" id="reviewTitle"
								value="${review.reviewTitle}"></td>
						</tr>
						<tr>
							<th id="reviewTh">평점</th>
							<td id="reviewTd"><select name="reviewRating" id="reviewRating">
									<option>5</option>
									<option>4</option>
									<option>3</option>
									<option>2</option>
									<option>1</option>
							</select></td>
						</tr>
						<tr>
							<th id="reviewTh">방타입</th>
							<td><select name="reviewRoomType" id="reviewRoomType">
									<option>스탠다드</option>
									<option>디럭스</option>
									<option>스위트</option>
									<option>로열패밀리</option>
							</select></td>
						</tr>
						<tr>
							<th id="reviewTh">내용</th>
							<td id="reviewTd"><textarea class="form-control" cols="40"
									rows="10" name="reviewContent" id="reviewContent">${review.reviewContent}</textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" name="reviewNum" value="${review.reviewNum}">
				<button type="button" class="btn btn-default"
					onclick="location.href='./reviewContentUser?reviewNum=${review.reviewNum}'"
					style="float: right;">취소</button>
				<button type="button" class="btn btn-default" id="modiBtn"
					style="float: right;">수정완료</button>
			</c:when>
			<c:otherwise>
				<div>선택된 게시물이 없습니다. 뒤로 돌아가시려면 밑에 목록을 눌러주세요.</div>
				<button class="btn btn-default" type="button"
					onclick="location.href = './reviewList' " style="float: right;">목록</button>
			</c:otherwise>
		</c:choose>
	</div>
</body>
<footer> <%@ include file="../common/footer.jsp"%>
</footer>
