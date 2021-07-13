<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./common/import.jsp" %>
<meta charset='utf-8'>
<title>트래블 하우스 관리자 메인</title>
<style>
.today_status{width:40%; float:left; height:250px; margin-left:8%;}
.inquiry_status{width:40%; height:250px; margin-left:52%;}
</style>
<script>
$(()=>{
   registBanner();
});

function registBanner(){
   $('#attachFile').change(function(){ 
      imgView(this);
   })
   
   $('#sendBtn').click(()=>{
      let data = new FormData($('form')[0]);
      
      if( $("#attachFile").val() != "" ){ 
         let ext = $('#attachFile').val().split('.').pop().toLowerCase(); //확장자만 추출
         
         if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) { //확장자확인
            $('#registMsg').text('gif, png, jpg, jpeg 파일만 첨부할 수 있습니다');
         return;
         }
      }else if($("#attachFile").val()==""){ //첨부된 파일이 없을때
         $('#registMsg').text('파일을 첨부해 주세요');
         return;
      }
      
      $.ajax({
         url:'admin/bannerRegistProc',
         method:'post',
         data:data,
         processData:false,
         contentType:false,
         success:(result)=>{
            if(result){
               $('#registMsg').text('배너등록이 완료되었습니다');
            }else{
               $('#registMsg').text('등록실패');
            }
         },
      });
   });
}

function imgView(input){
   if(input.files && input.files[0]){
      let reader = new FileReader();
      reader.addEventListener('load', ()=>{
         $('#previewImg').attr('src', reader.result);
      },false);
      reader.readAsDataURL(input.files[0]);
   }
}

</script>
<style>
.roomImg{
   width: 700px;
   height: 280px;
}

#myCarousel{
   width: 700px;
   margin: auto;
}
.img_btn{
   padding-top: 220px;
   padding-left: 500px;
}   

.col-form-label{
   font-size: 16px;
   padding-top: 5px;
   padding-left: 50px;
}

.totalBox{
   padding-left: 20%;
   padding-top: 30px;
   padding-bottom: 30px;
}

#roomType{
   margin: 5px 15px 8px 0px;
   width: 380px;
}

</style>
<header><%@ include file="./common/header.jsp" %></header>
<br><br>
<div class="container center-block text-center">
   
<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 배너 등록 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->   
<form>
   <table class='table'>
      <tr>
         <th>배너 이미지</th>
         <td><input type='file' id='attachFile' name='attachFile' />
            <div></div><br><img id='previewImg' /></td>
      </tr>
   </table>

   <div class='button' style='text-align: right;'>
      <span id='registMsg' style='color: red'></span>
      <button type='button' class='btn btn-primary' id='sendBtn'>등록</button>
   </div>
</form>
<!-- END END END END END END END END 배너등록 END END END END END END END -->
   
      <div class="container-fluid">
         <div class="today_status">
         
            <h4 class='font-kr' style='font-size:20px; text-align:left;'>Today</h4>
            <table class="table table-bordered">
               <colgroup>
                  <col width="50%" class="col1">
                  <col width="50%" class="col2">
               </colgroup>
               <tbody>
                  <tr><th scope="row" style="text-align:center;">입금 대기</th><td><p>00 건</p></td></tr>
                  <tr><th scope="row" style="text-align:center;">결제 완료</th><td><p>00 명</p></td></tr>
                  <tr><th scope="row" style="text-align:center;">남은 객실 수</th><td><p>00 명</p></td></tr>
                  <tr><th scope="row" style="text-align:center;">회원 가입 수</th><td><p>${todayCnt} 명</p></td></tr>
                  <tr><th scope="row" style="text-align:center;">회원 탈퇴 수</th><td><p>00 건</p></td></tr>
                  <tr><th scope="row" style="text-align:center;">환불 접수</th><td><p>00 건</p></td></tr>
               </tbody>
            </table>
         </div>
         <div class="inquiry_status">
         <h4 class='font-kr' style='font-size:20px; text-align:left;'>문의&nbsp;/&nbsp;답변관리</h4>
            <table class="table table-bordered">
               <colgroup>
                  <col width="50%" class="col1">
                  <col width="50%" class="col2">
               </colgroup>
                  <tr><th scope="row" style="text-align:center;">후기</th><td><p>00 건</p></td></tr>
                  <tr><th scope="row" style="text-align:center;">환불 문의</th><td><p>00 명</p></td></tr>
                  <tr><th scope="row" style="text-align:center;">1:1 문의</th><td><p>00 명</p></td></tr>
                  <tr><th scope="row" style="text-align:center;">청소업소 문의</th><td><p>00 건</p></td></tr>
            </table>
         </div>
      </div>
   <br><br><br><br><br><br><br>
      <div class="container">
         <div class="question">
            <h4 id='query' class='font-kr' style="font-size:30px; text-align:left; width:90%; float:left">| 문의사항</h4>
            <table id ='queryTable' class="table table-bordered table-hover">
                  <tr>
                     <th scope="row" width="65%">제목</th>
                     <th scope="row" width="15%">유저명</th>
                     <th scope="row" width="20%">내용</th>
                  </tr>
                     <c:forEach var="query" items="${querys}">
                  <tr>
                     <td>${query.queryTitle}</td>
                     <td>${query.userId}</td>
                     <td>${query.queryContent}</td>
                  </tr>
               </c:forEach>
            </table>
         </div>
      </div>
   </div>
   <br><br><br>
<!-- 끝 -->
<footer><%@ include file="./common/footer.jsp" %></footer>