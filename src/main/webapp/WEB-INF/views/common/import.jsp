<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ='c' uri='http://java.sun.com/jsp/jstl/core'%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"><!-- logo -->
<meta name="viewport" content="width=device-width, initial-scale=1"><!-- 반응형 웹 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet"><!-- fonts.google.com 한글폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Caveat:wght@700&display=swap" rel="stylesheet"><!--  fonts.google.com 영어폰트 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/notosanskr.css">

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- 다음지도 -->
<script src="<c:url value="/js/daum.js"/>" ></script><!-- 다음지도 --> 

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css' />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js'></script>

<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script><!-- google map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDT7sSTMO5sgyqu_1l0KuaIK_QAyv0U44c&callback=initMap&libraries=&v=weekly" defer></script><!-- google map -->

<!-- 아래2개 섬머노트 게시판 textarea -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
function alert(text){
	   swal({
	        title: "",
	        text, 
	        icon:"",
	        timer:1000,
	        buttons:false,
	      });
	}
</script>