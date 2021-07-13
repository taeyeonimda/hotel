<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>

<%
	String resChkin = request.getParameter("resChkin");
	System.out.println(resChkin);
	
	String resChkout = request.getParameter("resChkout");
	System.out.println(resChkout);
	
	String roomNum = request.getParameter("roomNum");
	System.out.println(roomNum);
	
	String userId = (String)session.getAttribute("userId");
	System.out.println(userId);
%>
<!DOCTYPE html>
<head>
<title>예약 결제</title>
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
      <form name="joinForm" method="post" action="./registerResInfo.do">
      
         <h2 class="text-center">
            <b class='font-kr' style='font-size:50px;'>예약 결제</b>
         </h2>
         <br><br>
         
         <table>
            <tr>
               <th style="font-size: 15px; padding-left: 90px;" width="200"> - 예약자 정보</th>
            </tr>
            <tr>
               <td>&nbsp;</td>
            </tr>
            <tr>
               <td style="padding-left: 70px;">
                  <label>아이디</label>
               </td>
               <td width="200">
                  ${sessionScope.user.userId}
               </td>
               
           </tr>
            <tr>
               <td style="padding-left: 70px;">
                  <label>예약자 성명</label>
                 
               </td>
               <td>
                  	${param.resPername}
               </td>
            </tr>
            <tr>
               <td style="padding-left: 70px;">
                  <label>이메일</label>
               </td>
               <td>
                  ${param.resEmail}
               </td>
            </tr>
            <tr>
               <td style="padding-left: 70px;">
                  <label>연락처</label>
               </td>
               <td>
                  ${param.resTel}
              </td>
           </tr>
         </table>
         
         <hr>
         <br>
      
         <table>
            <tr>
               <th style="font-size: 15px; padding-left: 90px;" width="200"> - 예약상세 정보</th>
            </tr>
            <tr>
               <td>&nbsp;</td>
            </tr>
            <tr>
               <td style="padding-left: 70px;">
                  <label>객실번호</label>
               </td>
               <td width="200">
                  ${param.roomNum}호
               </td>
               
           </tr>
            <tr>
               <td style="padding-left: 70px;">
                  <label>객실종류</label>
               </td>
               <td>
                  	${roomType.roomType}
               </td>
            </tr>
            <tr>
               <td style="padding-left: 70px;">
                  <label>체크인</label>
               </td>
               <td>
                  ${param.resChkin}
               </td>
            </tr>
            <tr>
               <td style="padding-left: 70px;">
                  <label>체크아웃</label>
               </td>
               <td>
                  ${param.resChkout}
              </td>
           </tr>
           <tr>
               <td style="padding-left: 70px;">
                  <label>인원수</label>
               </td>
               <td>
                  ${param.resPernum}명
              </td>
           </tr>
           
           
         </table>
         
         <hr>
         <br>
         
         <table>
            <tr>
               <th style="font-size: 15px; padding-left: 90px;" width="200"> - 예약 결제</th>
            </tr>
            <tr>
               <td>&nbsp;</td>
            </tr>
            <tr>
               <td style="padding-left: 70px;">
                  <label>결제방식</label>
               </td>
               <td width="200">
                  <input type="radio" name="resPay" value="신용카드" checked />
                     신용카드 &nbsp;&nbsp;
                  <input type="radio" name="resPay" value="휴대폰"/>
                     휴대폰
              </td>
           </tr>
           <tr>
               <td style="padding-left: 70px;">
                  <label>총 결제금액</label>
               </td>
               <td>
                  ${roomType.roomPrice}원
                  <input type="hidden" name="resPrice" value="${roomType.roomPrice}" />
              </td>
           </tr>
           <tr>
              <td>&nbsp;</td>
           </tr>
           <tr>
              <td>&nbsp;</td>
           </tr>
           <tr>
           		<td>
           			<input type="hidden" name="resPername" value="${param.resPername}" />
           			<input type="hidden" name="resEmail" value="${param.resEmail}" />
           			<input type="hidden" name="resTel" value="${param.resTel}" />
           			<input type="hidden" name="resPernum" value="${param.resPernum}" />
           			<input type="hidden" name="resChkin" value="${param.resChkin}" />
           			<input type="hidden" name="resChkout" value="${param.resChkout}" />
           			<input type="hidden" name="roomNum" value="${param.roomNum}" />
           			<input type="hidden" name="userId" value="${sessionScope.user.userId}" />
           		</td>
           </tr>
           <tr>
              <td colspan="2" align="center">
                 <button type="submit" class="btn btn-info">예약 신청</button>
                 <button type="button" class="btn btn-info" onclick="location.href='./resWrite'">예약 취소</button>
              </td>
           </tr>
         </table>
      </form>
   </div>
   <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 회원가입 끝 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
</div><!-- 화면 여백 끝 --><br><br><br><br><br>
</body>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>