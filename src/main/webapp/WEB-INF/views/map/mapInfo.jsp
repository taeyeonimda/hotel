<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/import.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>GPS 길 찾기</title>
<meta charset="utf-8">

<script>
  (function(exports) {
    "use strict";
  var marker;
  
    function initMap() {
      exports.map = new google.maps.Map(document.getElementById("map"), {
        center: {lat: 37.556617, lng: 126.919542}, // 좌표
        zoom: 17
      });
      
      marker = new google.maps.Marker({
         map: map,
         draggable: true,
         animation: google.maps.Animation.BOUNCE,
         position: {lat: 37.556617, lng: 126.919542}
      });
      marker.addListener('click', toggleBounce);
    }
    
    function toggleBounce(){
       if(marker.getAnimation() != null){
          marker.setAnimation(null);
       }else{
          marker.setAnimation(google.maps.Animation.BOUNCE);
       }
    }

    exports.initMap = initMap;
  })((this.window = this.window || {}));
</script>
<style type="text/css">
/* Always set the map height explicitly to define the size of the div
 * element that contains the map. */
#map {height: 600px; width: 900px;}
</style>
</head>
<header>
	<%@ include file="../common/header.jsp" %>
</header>
<body>
<div class='container'>
<h2 class='font-kr'>&nbsp;찾아 오시는 길</h2>
<div id="map" align=center></div>
<br>
<h3><b>위치</b></h3>
<p>강북 서울특별시 마포구 월드컵북로 21 풍성빌딩 2, 3, 4,층 쌍용강북교육센터</p>
<p>Tel 02)336-8546~8	|	Fax 02)334-5405</p>

</div>
</body>
<br><br><br><br><br><br>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</html>