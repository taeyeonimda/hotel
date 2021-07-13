<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>
<!DOCTYPE html>
<meta charset="utf-8">
<title>환불 내용</title>
<style>
.today_status  {width:40%; float:left; height:250px; margin-left:8%;}
.inquiry_status{width:40%; height:250px; margin-left:52%;}
.today_status th, .inquiry_status th{text-align: center;}
</style>
<header>
	<%@ include file="../common/header.jsp" %>
</header>
<body>
<div class="container center-block text-center">
<div class="container-fluid">
<h2 class="text-center font-kr" style='font-size:50px;'>환불내용</h2>
<hr><br><br>
<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 예약정보 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ --> 
<div class="today_status">
<h2 class="text-left font-kr" style='font-size:30px;'>예약 정보</h2>
	<table class="table table-bordered">
	   <colgroup><col width="50%" class="col1"><col width="50%" class="col2"></colgroup>
	   <tbody>
	   			<tr><th scope="row">아이디</th><td>${res.userId}</td></tr>
	      		<tr><th scope="row">예약자 성명</th><td>${res.resPername}</td></tr>
			      <tr><th scope="row">이메일</th><td>${res.resEmail}</td></tr>
			      <tr><th scope="row">연락처</th><td>${res.resTel}</td></tr>
			      <tr><th scope="row">객실번호</th><td>${res.roomNum}호</td></tr>
			      <tr><th scope="row">객실종류</th><td>스탠다드</td></tr>
			      <tr><th scope="row">체크인</th><td>${res.resChkin}</td></tr>
			      <tr><th scope="row">체크아웃</th><td>${res.resChkout}</td></tr>
			      <tr><th scope="row">인원수</th><td>${res.resPernum}명</td></tr>
			      <tr><th scope="row">결제방식</th><td>${res.resPay}</td></tr>
			      <tr><th scope="row">총 환불금액</th><td>${res.resPrice}원</td></tr>
	   </tbody>
	</table>
</div>
<!-- END END END END END END END END 예약정보 END END END END END END END -->
<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 환불정보 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ --> 
<div class="inquiry_status">
<h2 class="text-left font-kr" style='font-size:30px;'>환불 정보</h2>
	<form action="./updateRefundStatus.do" method="post">
	   <table class="table table-bordered">
	      <colgroup><col width="50%" class="col1"><col width="50%" class="col2"></colgroup>
	      <tbody>
	         <tr><th scope="row">계좌번호</th><td><p>${refund.refundAccountNum}</p></td></tr>
	         <tr><th  height="250px">상세사유</th><td><p>${refund.refundContent}</p></td></tr>
	         <tr>
	         	<th>환불여부</th>
	         	<td width="200">
	                  <input type="radio" name="refundStatus" value="환불완료" checked />
	                     환불완료 &nbsp;&nbsp;
	                  <input type="radio" name="refundStatus" value="환불미완료"/>
	                     환불미완료
	              </td>
	          </tr>
	      </tbody>
	   </table>
	   <input type="hidden" name="refundNum" value="${refund.refundNum}" />
	   <button type='submit' class= 'btn btn-info'>환불처리</button>
	   <button type='button' class= 'btn btn-info' onclick='location.href="./refundList"'>환불목록</button>
	</form>
</div>
<!-- END END END END END END END END 환불정보 END END END END END END END -->
</div>
</div>
</body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>