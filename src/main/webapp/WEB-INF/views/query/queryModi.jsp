<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>
<title>문의수정</title>
<script>
$(()=>{
	modi();
	$("#queryContent").summernote({
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
		
		let queryNum=$("#queryNum").val();
	    let queryTitle = $("#queryTitle").val();
	    let queryContent=$("#queryContent").val();
	    
	    if(queryTitle.trim()==""){
	    	alert("제목을 입력해주세요.");
	    	return;
	    }
	    if(queryContent.trim() == ""){
	    	alert("내용을 입력해주세요.");
	    	return;
	    }	    	
	    	
		$.ajax({
		         url:"./modiQuery",
		         data:{
		        	queryNum: queryNum,
		            queryTitle: queryTitle,
		            queryContent: queryContent,
		         },
		         success: ()=>{	
		        	 alert("수정에 성공하였습니다.")
					 setTimeout('location.href="./queryList"',1500)
		         },
		         error: () => {alert("수정에 실패했습니다.")}
		      })
	})
}
</script>
<header><%@ include file="../common/header.jsp" %></header>
<div class="container">
<div class="container center-block" style='width:70%;'>
        <div class="headTitle"><h2 class='font-en'>&nbsp;Q & A</h2></div>
    	<br><br>
    	<c:choose>
             <c:when test="${sessionScope.query!=null}">
    	<input type='hidden' value='${user.userId}' name='userId' id='userId'>
        <table class="table table-hover table-bordered">
            <tr>
                <td width="15%">문의번호</td>
                <td align="left"><input type="text" name="queryNum" id='queryNum' value="${query.queryNum}" readonly></td>
            </tr>
            <tr>
                <td width="15%">제목</td>
                <td align="left"><input type="text" name="queryTitle" id='queryTitle' value="${query.queryTitle}"></td>
            </tr>
            <tr>	
                <td>내용</td>
                <td align="left"><textarea id='queryContent' name="content" cols="80%" rows="10%">${query.queryContent}</textarea></td>
            </tr>
          	<!--<tr>
                <td>비밀번호</td>	
                <td align="left"><input name="title" type="password" value="****"/></td>
            </tr> -->  
        </table>
        <c:if test="${sessionScope.user.userId == query.userId}">
        <button type='button' class="btn btn-default" onclick="location.href='./queryView?queryNum=${query.queryNum}'"> 취소 </button>
          <button type='button' class="btn btn-default"  id='modiBtn'> 수정 </button>
    	</c:if>
            </c:when>
            <c:otherwise>
               <div class='font-kr' style='font-size:25px;'>선택된 게시물이 없습니다. 뒤로 돌아가 주세요.</div>
            </c:otherwise>
          </c:choose>
          <button class="btn btn-default" onclick="location.href='./queryList'" style="float: right;">목록</button>
    </div> 
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br>
<footer><%@ include file="../common/footer.jsp" %></footer>