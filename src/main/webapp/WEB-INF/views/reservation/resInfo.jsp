<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>
<!DOCTYPE html>
<head>
<title>예약 내용</title>
<meta charset="utf-8">
<style>
body {background: linear-gradient(to right, pink, white);}
.login-form {width: 500px; margin: 50px auto;}
.login-form form {margin-bottom: 20px; background: white; box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.5); padding: 30px; }
.login-form h2 {margin: 0 0 15px;}
.form-control, .btn {min-height: 40px; border-radius: 2px;}
.btn {font-size: 15px; font-weight: bold;}
</style>
</head>
<header>
	<%@ include file="../common/header.jsp" %>
</header>
<body>
<div class = 'container'><!-- 화면 여백 -->
   <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 회원가입 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
   <div class="login-form">
      <form name="joinForm" method="post">
      
         <h2 class="text-center">
            <b class='font-kr' style='font-size:50px;'>예약 정보</b>
         </h2>
         <br><br>
         
         <table>
            <tr>
               <th style="font-size: 15px; padding-left: 90px;"> - 예약자 정보</th>
            </tr>
            <tr>
               <td>&nbsp;</td>
            </tr>
            <tr>
               <td style="padding-left: 70px;" width="200">
                  <label>아이디</label>
               </td>
               <td width="200">
                  ${reservation.userId}
               </td>
               
           </tr>
            <tr>
               <td style="padding-left: 70px;">
                  <label>예약자 성명</label>
               </td>
               <td>
                  	${reservation.resPername }
               </td>
            </tr>
            <tr>
               <td style="padding-left: 70px;">
                  <label>이메일</label>
               </td>
               <td>
                  ${reservation.resEmail}
               </td>
            </tr>
            <tr>
               <td style="padding-left: 70px;">
                  <label>연락처</label>
               </td>
               <td>
                  ${reservation.resTel}
              </td>
           </tr>
         </table>
         
         <hr>
         <br>
      
         <table>
            <tr>
               <th style="font-size: 15px; padding-left: 90px;"> - 예약상세 정보</th>
            </tr>
            <tr>
               <td>&nbsp;</td>
            </tr>
            <tr>
               <td style="padding-left: 70px;" width="200">
                  <label>객실번호</label>
               </td>
               <td width="200">
                  ${reservation.roomNum}호
               </td>
               
           </tr>
            <tr>
               <td style="padding-left: 70px;">
                  <label>객실종류</label>
               </td>
               <td>
                 		 스탠다드
               </td>
            </tr>
            <tr>
               <td style="padding-left: 70px;">
                  <label>체크인</label>
               </td>
               <td>
                  ${reservation.resChkin}
               </td>
            </tr>
            <tr>
               <td style="padding-left: 70px;">
                  <label>체크아웃</label>
               </td>
               <td>
                  ${reservation.resChkout}
              </td>
           </tr>
           <tr>
               <td style="padding-left: 70px;">
                  <label>인원수</label>
               </td>
               <td>
                  ${reservation.resPernum}명
              </td>
           </tr>
           <tr>
               <td style="padding-left: 70px;">
                  <label>결제방식</label>
               </td>
               <td>
                  	${reservation.resPay}
              </td>
           </tr>
           <tr>
               <td style="padding-left: 70px;">
                  <label>총 결제금액</label>
               </td>
               <td>
                  ${reservation.resPrice}원
              </td>
           </tr>
           <tr>
              <td>&nbsp;</td>
           </tr>
           <tr>
              <td>&nbsp;</td>
           </tr>
           <tr>
              <td colspan="2" align="center">
                 <button type="button" class="btn btn-info" onclick="location.href='./resMy'">예약내역</button>
                 <button type="button" class="btn btn-info" onclick="location.href='../refund/refundWrite?resNum=${reservation.resNum}'">예약취소 신청</button>
              </td>
           </tr>
         </table>
      </form>
   </div>
   <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 회원가입 끝 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
</div><!-- 화면 여백 끝 --><br><br><br><br><br>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>