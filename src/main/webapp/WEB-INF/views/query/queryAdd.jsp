<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<%@ include file="../common/import.jsp" %>
<title>문의추가</title>
<script>
$(()=>{
   add();
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
   function add(){
      $("#addBtn").click(()=>{
         
        let userId = "${user.userId}";
        
        if(userId ==null || userId ==""){
           alert("로그인후 글을 쓸수있습니다");
           return;
        }
        
         let queryTitle=$("#queryTitle").val();
         let queryContent = $("#queryContent").val();
         
         if(queryTitle.trim()==""){
            alert("제목을 입력해주세요");
               return;
         }
         if(queryContent.trim() ==""){
            alert("내용을 입력해주세요");
            return;
         }
         
         $.ajax({
            url:"./addQuery",
            data:{
               queryTitle: queryTitle,
               queryContent: queryContent,
               userId : userId,
               queryHit: "0", 
            },
            success: ()=>{
              alert("문의가 등록 되었습니다.");
               setTimeout("location.href='./queryList'", 1500);
            },
            error: () =>{
               alert("실패");
            }
         })
      })
   }
</script>
</head>

<header><%@ include file="../common/header.jsp" %></header>
<div class="container">
            <div class="container center-block" style='width:70%;'>
                <div class="headTitle"><h2 class='font-en'>&nbsp;Q & A</h2></div>
             <br><br>
                <form name="queryAdd" method="post" action="./registerQuery.do">
                    <table class="table table-hover table-bordered">
                        <tr>
                            <td width="15%">제목</td>
                            <td align="left"><input id='queryTitle' name="queryTitle" placeholder="제목을 입력하세요" required></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td align="left"><textarea id='queryContent' name="queryContent" cols="80%" rows="10%" placeholder="내용을 입력하세요" required></textarea></td>
                        </tr>
                   <!-- <tr><td>비밀번호</td><td align="left"><input name="queryPw" type="password"/></td></tr>-->
                    </table>
                            <button class="btn btn-default" style='right;' type="button" onclick="location.href = './queryList'">취소</button>
                            <button class="btn btn-default" id='addBtn' type="button" >등록</button>
                </form>
                </div>
                </div>
                <br><br><br><br><br><br><br><br><br><br>
<footer></footer>