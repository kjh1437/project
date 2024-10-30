<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="../resources/css/caution.css" type="text/css">
    <meta charset="UTF-8">
    <title>제품 안전 정보</title>
</head>
<body>
<%
   String itemName = (String) session.getAttribute("itemName");
%>

    <!-- 제품명 표시 -->
    <div class="top">
        <img src="resources/img/goback.png" alt="뒤로가기" class="back-button" onclick="goBack()" />
        <script>
            document.addEventListener('DOMContentLoaded', function(){
                fetch('https://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?serviceKey=RlP5Qs6W7JzE4R72UmPN5dqZ5zMcFWMluYCsSwarFUzSHvlUdP3ZRc8t72i4LF9oM2SbnfiD%2FF4YOVKFJvVQqw%3D%3D&pageNo=1&numOfRows=3&type=json&itemSeq=200003092')
                    .then(response => response.json())
                    .then(data => {
                        let showData = data.body.items[0].efcyQesitm;
                        let store = data.body.items[0].depositMethodQesitm;
                        let seQesitm = data.body.items[0].seQesitm;
                        let useMethodQesitm = data.body.items[0].useMethodQesitm;

                        $("#warnText").val(showData);
                        $("#store").val(store);
                        $("#seQesitm").val(seQesitm);
                        $("#useMethodQesitm").val(useMethodQesitm);
                    });
            });
        	function goBack() {
        		window.history.back();
        		}
    	
        </script>
        <h3 class="title">제품 안전 정보</h3>
        <img src="resources/img/logo2.png" alt="PILL&YOU" class="header-logo">
    </div>

    <div id="caution">
        <h3 style="margin-top:30px;margin-left:20px; margin-right:25px;">제품 주의사항</h3>
        <textArea id="warnText" readonly style="width:90%;height:120px;border:none;margin:10px 20px 20px 25px;"></textArea>
        <h3 style="margin-top:10px;margin-left:20px">보관 방법</h3>
        <textArea id="store" readonly style="width:90%;height:80px;border:none;margin:10px 20px 20px 25px;"></textArea>
        <h3 style="margin-top:10px;margin-left:20px">부작용 정보</h3>
        <textArea id="seQesitm" readonly style="width:90%;height:200px;border:none;margin:10px 20px 20px 25px;"></textArea>
        <h3 style="margin-top:10px;margin-left:20px">사용 방법</h3>
        <textArea id="useMethodQesitm" readonly style="width:90%;height:90px;border:none;margin:10px 20px 20px 25px;"></textArea>
    </div>

    <!-- footer -->
    <footer id="footer">
        <div class="footer-icon-container" id="alarm">
            <a href="alarm"><img src="resources/img/alarm.png" alt="복용 관리" class="footer-icon"></a><!-- 복용 관리 -->
        </div>
        <div class="footer-icon-container" id="search">
            <a href="shapeSear"><img src="resources/img/search.png" alt="약 검색" class="footer-icon"></a> <!-- 약 검색 -->
        </div>
        <div class="footer-icon-container" id="home">
            <a href="main"><img src="resources/img/home.png" alt="메인으로 돌아가는 페이지" class="footer-icon"></a> <!-- 메인으로 돌아가는 페이지 -->
        </div>
        <div class="footer-icon-container" id="pharmacy">
            <a href="map"><img src="resources/img/pharmacy.png" alt="병원/약국 찾기" class="footer-icon"></a> <!-- 병원/약국 찾기 -->
        </div>
        <div class="footer-icon-container" id="mypage">
            <a href="mypage"><img src="resources/img/mypage.png" alt="마이페이지" class="footer-icon"></a> <!-- 마이페이지 -->
        </div>
    </footer>

    
</body>
</html>