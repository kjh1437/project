<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/detailPage.css"
	type="text/css">
	    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	
<meta charset="EUC-KR">
<title>상세 페이지</title>
</head>
<body>
	<%
        String itemImage = request.getParameter("item_image");
        String entpName = request.getParameter("entp_name");
        String itemName = request.getParameter("item_name");
        String warnYn = request.getParameter("warnYn");
        // URL 디코딩
        itemImage = URLDecoder.decode(itemImage, "EUC-KR");
        entpName = URLDecoder.decode(entpName, "EUC-KR");
        itemName = URLDecoder.decode(itemName, "EUC-KR");  
        warnYn = URLDecoder.decode(warnYn, "EUC-KR"); 
        session.setAttribute("itemName", itemName);
    %>
    
	<!-- 상세 페이지 상단 -->
	<div class="top">
		<img src="resources/img/goback.png" alt="화살표" id="arrow"
			onclick="history_back()" />
		<script>  
			function history_back() {
				history.back();    
				//window.location.href = 'pillSear';
			}
			let itemName = '<%= itemName %>'
			let warnYn = '<%= warnYn %>'
			$(document).ready(function(){
				if(warnYn=='null'){
					$("#warn").hide();
				}
				if(warnYn=='Y'&&(itemName.includes('아스피린')||itemName.includes('타이레놀'))){
					$("#warn").hide();
				}else if(itemName.includes('룩펠')||itemName.includes('닉신정')){
					$("#warn").show();
				}
				
				
			});
			//if(item_name.startsWith('아스피린')||item_name.startsWith('타이레놀')){
				//$("#warn").props("disabled", true);
			//}
		</script>  
		<h3 class=title>상세정보</h3>   

	</div>
	<!-- 주의 알림 표기 -->

	<div id="warn" style="margin-top:50px;background-color:#bbbbbb;padding:10px" >
	<span style="color: red; font-size: 10px;margin:15px">●</span>복용주의 의약품으로 등록된 항목입니다.
	</div>


	<!-- 큰 이미지 부분 -->
	<div>
		<img src="<%= itemImage %>" id="img" alt="" width="300" height="250"> 
	</div>

	<!-- 회사명/약품명 -->
	<div>
		<p style="margin-left:45px;"><%= entpName %></p>     
		<h3 class="pill_name"><%= itemName %></h3>
	</div>
	<hr>

	<!-- 성분/복용방법 -->
	<div class="pill_ingredient">
        <h3>성분명</h3>
        <p>
            <% 
                if (itemName.equals("킥콜드에스연질캡슐")) {
                    out.print("아세트아미노펜, 카페인");
                } else if (itemName.equals("위푸린에스산")) {
                    out.print("라니티딘");
                } else if (itemName.equals("락토더블캡슐")) {
                    out.print("락토바실러스균");
                } else if (itemName.equals("이지엔6이브연질캡슐")) {
                    out.print("이부프로펜");
                } else if (itemName.equals("유미오틴정")) {
                    out.print("클로피도그렐");
                } else if (itemName.equals("세피덤지앤크림30그램/튜브")) {
                    out.print("세파졸린 나트륨");
                } else if (itemName.equals("트리엘정100mg")) {
                    out.print("아미트립틸린");
                } else if (itemName.equals("뉴베인액")) {
                    out.print("클로르페니라민");
                } else if (itemName.equals("도모틴캡슐10mg")) {
                    out.print("도모페리돈");
                } else if (itemName.equals("뉴리페돈정1mg")) {
                    out.print("리세리돈");
                } else if (itemName.equals("에피타이츄정")) {
                    out.print("페노바르비탈");
                } else if (itemName.equals("타이맥스연질캡슐(아세트아미노펜)")) {
                    out.print("아세트아미노펜");
                } else if (itemName.equals("바소트롤정6.25밀리그램(카르베딜롤)")) {
                    out.print("카르베딜롤");
                } else if (itemName.equals("하이코돈정5.0밀리그램")) {
                    out.print("코데인");
                } else if (itemName.equals("뉴먼트케이연질캡슐")) {
                    out.print("비타민 K");
                } else if (itemName.equals("종합비타민제")) {
                    out.print("종합 비타민 성분");
                } else if (itemName.equals("비타민 B6(피리독신)")) {
                    out.print("피리독신");
                } else {
                    out.print("성분 정보를 찾을 수 없습니다.");
                }
            %>
        </p>
    </div>

    <div class="pill_take">
        <h3>복용방법</h3>
        <p>
            <% 
                if (itemName.equals("킥콜드에스연질캡슐")) {
                    out.print("성인은 하루 3회, 1회 1정 복용");
                } else if (itemName.equals("위푸린에스산")) {
                    out.print("성인은 하루 2회, 1회 1정 복용");
                } else if (itemName.equals("락토더블캡슐")) {
                    out.print("하루 1회, 식후에 복용");
                } else if (itemName.equals("이지엔6이브연질캡슐")) {
                    out.print("성인은 4~6시간 간격으로 1정 복용");
                } else if (itemName.equals("유미오틴정")) {
                    out.print("하루 1회, 아침에 복용");
                } else if (itemName.equals("세피덤지앤크림30그램/튜브")) {
                    out.print("1일 2회 국소 부위에 적용");
                } else if (itemName.equals("트리엘정100mg")) {
                    out.print("하루 1회, 저녁에 복용");
                } else if (itemName.equals("뉴베인액")) {
                    out.print("필요 시 복용, 최대 하루 3회");
                } else if (itemName.equals("도모틴캡슐10mg")) {
                    out.print("식후 30분 이내에 복용");
                } else if (itemName.equals("뉴리페돈정1mg")) {
                    out.print("의사의 처방에 따라 복용");
                } else if (itemName.equals("에피타이츄정")) {
                    out.print("하루 2~3회, 의사의 지시에 따라 복용");
                } else if (itemName.equals("타이맥스연질캡슐(아세트아미노펜)")) {
                    out.print("성인은 4~6시간 간격으로 복용, 최대 8정");
                } else if (itemName.equals("바소트롤정6.25밀리그램(카르베딜롤)")) {
                    out.print("하루 2회, 식사와 함께 복용");
                } else if (itemName.equals("하이코돈정5.0밀리그램")) {
                    out.print("필요 시 복용, 최대 하루 4회");
                } else if (itemName.equals("뉴먼트케이연질캡슐")) {
                    out.print("하루 1회 복용");
                } else if (itemName.equals("종합비타민제")) {
                    out.print("하루 1회, 식사 후 복용");
                } else if (itemName.equals("비타민 B6(피리독신)")) {
                    out.print("하루 1회 복용");
                } else {
                    out.print("복용 방법을 찾을 수 없습니다.");
                }
            %>
        </p>
    </div>
    <hr>

	<!-- 복용 시 주의사항 -->
	<div class="pill_caution">
		<h3>복용 시 주의사항</h3>
		<a href="caution" style="text-decoration-line: none;"> <img
			src="resources/img/checkcaution.png" alt="주의사항설명페이지로" id="next" /></a>
	</div>
	<hr>

	<!-- DUR -->
	<div class="pill_take">
		<h3>DUR</h3>
	</div>

	<div id="DUR">
		<h4>병용금기</h4>
		<p>없음/있음</p>

		<h4>특정연령대금기</h4>
		<p>없음/있음</p>

		<h4>임부금기</h4>
		<p>없음/있음</p>

		<h4>용량주의</h4>
		<p>없음/있음</p>

		<h4>투여기간주의</h4>
		<p>없음/있음</p>

		<h4>노인주의</h4>
		<p>없음/있음</p>

		<h4>서방정분할주의</h4>
		<p>없음/있음</p>
		<br>
	</div>
	<br>

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