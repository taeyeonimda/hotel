<%@ page language='java' contentType='text/html; charset=UTF-8'
   pageEncoding='UTF-8' %>
   <%@ include file="../common/import.jsp" %>
   
<style>
#reviewTable {
   border-collapse: separate;
   border-spacing: 0;
   line-height: 1.5;
   margin: 50px 10px;
}

#reviewTh {
   width: 50px;
   
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
   
   vertical-align: top;
   border-right: 1px solid #ccc;
   border-bottom: 1px solid #ccc;
}
</style>
<script>
$(()=>{
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

   function alert_enroll() {
      if (document.reviewAdd.reviewTitle.value.trim() == '') {
         swal("글 제목을 입력하세요!!");
         document.reviewAdd.reviewTitle.focus();
      } else if (document.reviewAdd.reviewContent.value.trim() == '') {
         swal("내용를 입력하세요!!");
         document.reviewAdd.reviewContent.focus();
         return;
      } else {
         swal({
            title : "등록하시겠습니까?",
            text : "",
            type : "success",
            showCancelButton : true,
            cancelButtonText : "아니요",
            confirmButtonText : "예",
            closeOnConfirm : false
         }, function() {
            swal({
               type : "success",
               title : "게시물이 등록되었습니다.",
               showConfirmButton : false
            });
            setTimeout(function() {
               document.reviewAdd.submit();
            }, 1500)
         });
      }
   }
</script>
<header>
<%@ include file="../common/header.jsp"%>
</header>
<body>
   <form name="reviewAdd" method="post" action="./registerReview.do">
      <div class="container">
         <h3>후기 등록</h3>

         <table id="reviewTable" class="table  table-bordered">
            <tbody>
               <tr>
                  <th id="reviewTh">제목</th>
                  <td id="reviewTd"><input type="text" class="form-control"
                     name="reviewTitle" id="reviewTitle" ></td>
               </tr>
               <tr>
                  <th id="reviewTh">평점</th>
                  <td id="reviewTd"><select name="reviewRating">
                     <option>5</option>
                     <option>4</option>
                     <option>3</option>
                     <option>2</option>
                     <option>1</option>
               </select></td>
               </tr>
               <tr>
                  <th id="reviewTh">방타입</th>
                  <td><select name="reviewRoomType" id="reviewRoomType" >
                        <option>스탠다드</option>
                        <option>디럭스</option>
                        <option>스위트</option>
                        <option>로열패밀리</option>
                  </select></td>
               </tr>
               
               <input type="hidden" name="userId" value="${user.userId}" />
            
               <tr>
                  <th id="reviewTh">내용</th>
                  <td id="reviewTd"><textarea class="form-control" cols="40"
                        rows="10" name="reviewContent" id="reviewContent" ></textarea></td>
               </tr>
            </tbody>
         </table>
         <button type="button" class="btn btn-default" style="float: right;"
            onclick="location.href = './reviewList' ">취소</button>
         <button type="button" class="btn btn-default" onclick="alert_enroll()" style="float: right;">등록</button>
      </div>
   </form>
</body>
<footer>
   <%@ include file="../common/footer.jsp"%>
</footer>