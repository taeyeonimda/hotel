<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>
<title>관리자 문의조회</title>
</head>
<script>
$(()=>{queryRep()})
    
function queryRep(){ 
   $("#queryModiBtn").click(()=>{

      let queryReply =$("#queryReply").val();
      let queryReplyStat = $("#queryReplyStat").val();
      let queryNum = ${query.queryNum};
      
      if(queryReply ==null || queryReply.trim()==""){
         alert("답변을 입력해주세요");
         return;
      }
      $.ajax({ 
         url:"../query/adminReply", 
         data:{ 
            queryReply: queryReply,
            queryReplayStat: queryReplyStat,
            queryNum: queryNum,
         }, 
         success: ()=>{
            alert("답변완료");
            setTimeout('location.href="../query/queryList"',1000);
         },
         error: ()=>{alert("답변실패")}
      })   //ajax 끝
   })
}

function alert_del() {
   swal({
      title : "삭제하시겠습니까?",
      text : "삭제한 후기는 복구되지 않습니다",
      type : "warning",
      showCancelButton : true,
      cancelButtonText : "아니요",
      confirmButtonText : "예",
      closeOnConfirm : false
   }, function() {
      swal({
         type : "success",
         title : "게시물이 삭제되었습니다.",
         showConfirmButton : false
      });
      setTimeout(function() {
         location.href='./removeQuery.do?queryNum=${query.queryNum}'
      }, 1500)
   });
};
</script>
<header><%@ include file="../common/header.jsp"%></header>
<div class='container'>
       <div class="headTitle"><h2 class='font-en'>&nbsp;Q & A</h2></div>
       <br><br>
          <c:choose>
            <c:when test="${sessionScope.query!=null}">
            <form>
            <table class="table">
                <tr><th colspan="3">문의번호 <span>${query.queryNum}</span></th><tr>
                <tr>   
                    <th width="33%">작성자 <span>${query.userId}</span></th>
                    <th width="33%">등록일 <span>${query.queryDate}</span></th>
                    <th width="33%">조회수 <span>${query.queryHit}</span></th>
                </tr>
                <tr><th class="leftline" colspan="3" id='queryBody'> 제목: ${query.queryTitle}</th></tr>
                <tr class="textarea"><td colspan="3" id='queryContentHead'><div>${query.queryContent}</div></td></tr>
            </table>
            
<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 단변 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->           
                <c:if test='${sessionScope.query.queryReply == null}'>
                   <h2 class='queryReply'>답변 미완료</h2>
                 </c:if>
                <c:if test='${sessionScope.query.queryReply != null }'>
                   <h2 class='queryReply' id='queryBody'>답변: ${query.queryReply}</h2>
                 </c:if><br><br><br>
<!-- END END END END END END END END 답변 END END END END END END END --> 
                 
            <button type="button" class="btn btn-danger" onclick="alert_del()">삭제</button><br>
            <button class="btn btn-default" onclick="location.href='./queryList'" style="float: right;">목록</button>
            <br><br><br>
            
            <div>
            <textarea id='queryReply' cols="80%" rows="3%" name='queryReply' placeholder="답변을 입력하세요"></textarea>
            <input type='hidden' id='queryReplyStat' name='queryReplyStat' value='답변완료'/>
            </div><br>
            
            <button id='queryModiBtn' type="button" class="btn btn-default">답변하기</button>         
            </form>
               
              </c:when>
               <c:otherwise><div class='font-kr' style='font-size:25px;'>선택된 게시물이 없습니다. 뒤로 돌아가 주세요.</div></c:otherwise>
            </c:choose>
            
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<footer><%@ include file="../common/footer.jsp" %></footer>