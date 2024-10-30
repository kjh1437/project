<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/shapeSear.css">
<title>모양 검색 페이지</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
	<!-- 상단 -->
	 <header>
        <div class="back-button" id="back-button">
            <img src="resources/img/goback.png" alt="뒤로가기" onclick="goBack()">
            	<script>
	            	function goBack() {
	            		window.history.back();
	            		}
            	</script>
            <span class="header-title">모양으로 검색</span>
        </div>
        <img src="resources/img/logo2.png" alt="로고" class="logo">
    </header>
	
	<div class="nav-buttons">
        <button class="nav-button selected" id="shape-search-button">모양으로 검색</button>
        <a href ="pillSear"><button class="nav-button" id="name-search-button">이름으로 검색</button></a>
    </div>
	<!-- 셀렉트 박스 -->
	<section class="content-section">
		<div class="select">
			<form action="#">
				<select name="shape" id="shape_sel" class="dropdown">
					<option value="">모양 선택</option>
				</select> 
				<select name="shape" id="formul_sel" class="dropdown">
					<option value="">제형 선택</option>
				</select> 
				<select name="shape" id="color_sel" class="dropdown">
					<option value="색상">색상 선택</option> 
				</select>
				<select name="shape" id="div_sel" class="dropdown">
					<option value="">분할선 선택</option> 
					<option value="">없음</option>
					<option value="+">(+)형</option>  
					<option value="-">(-)형</option> 
				</select>
				
				<div>  
				<input type="text" name="print" size="100" id="print_sel" class="input-box" placeholder="프린트를 입력하세요.">
				</div>
				
				<div id="submit">  
					<input type="button" value="검색하기" class="search-button" onclick="fn_search()"/>
				</div>
			</form>
		</div>
	</section>


	<footer>
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
	
	
	<script>
	// 최초 실행
	jQuery().ready(function () { 
		   
	    $.ajax({ 
	        type: "post", 
	        url: "/selectShape",   
	        data: {},       
	        dataType: "json", // JSON 데이터 형식으로 응답을 받음을 명시
	        contentType : 'application/json;charset=UTF-8',   
	        beforeSend : function(xhr){
	            xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	        },   
	        success: function(result) { 
	            console.log(result);       
	 			if(result == null){
	 				alert("모양 정보를 가져오는 데 실패했습니다.");	
	 				return;
	 			}  
	            fn_dataBind('shape_sel', result, '모양');
	        },
	        error: function(xhr, status, error) {   
	            console.error("Ajax 오류:", status, error);
	            alert("오류가 발생했습니다. 다시 시도해주세요.");
	        }
	    });
	    
	    $.ajax({ 
	        type: "post", 
	        url: "/selectChartn",   
	        data: {},       
	        dataType: "json", // JSON 데이터 형식으로 응답을 받음을 명시
	        contentType : 'application/json;charset=UTF-8',   
	        beforeSend : function(xhr){
	            xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	        },   
	        success: function(result) { 
	            console.log(result);  
	 			if(result == null){
	 				alert("제형 정보를 가져오는 데 실패했습니다.");	
	 				return;
	 			}     
	 			fn_dataBind('formul_sel', result, '제형');  
	        },
	        error: function(xhr, status, error) {   
	            console.error("Ajax 오류:", status, error);
	            alert("오류가 발생했습니다. 다시 시도해주세요.");
	        }
	    });
	    
	    $.ajax({ 
	        type: "post", 
	        url: "/selectColor",   
	        data: {},       
	        dataType: "json", // JSON 데이터 형식으로 응답을 받음을 명시
	        contentType : 'application/json;charset=UTF-8',   
	        beforeSend : function(xhr){
	            xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	        },   																																						
	        success: function(result) { 
	            console.log(result);  
	 			if(result == null){
	 				alert("색상 정보를 가져오는 데 실패했습니다.");	
	 				return;
	 			}   
	 			fn_dataBind('color_sel', result, '색상');  
	        },
	        error: function(xhr, status, error) {   
	            console.error("Ajax 오류:", status, error);
	            alert("오류가 발생했습니다. 다시 시도해주세요.");
	        }
	    });
	    
	});
	
	function fn_dataBind(id, dataList, aa) {
	    $('#' + id).empty(); 
	    let appendHtml = '';
	    appendHtml += '<option value="">' + aa + ' 선택</option>';
	    $.each(dataList, function (index, item) {
	        appendHtml += '<option value="' + item + '">' + item + '</option>';
	    });
	    $('#' + id).append(appendHtml);
	}
	
	function fn_search() {
	    var shape = $('#shape_sel').val();
	    var chartn = $('#formul_sel').val();
	    var color = $('#color_sel').val();
	    var line = $('#div_sel').val();
	    var print = $('#print_sel').val();

	    var data = {
	        shape: shape,
	        chartn: chartn,
	        color: color,
	        line: line,
	        print: print
	    };

	    console.log(data);
	    
	    $.ajax({
	        type: "post",
	        url: "/searchPill",
	        data: JSON.stringify(data),
	        contentType: "application/json; charset=UTF-8",
	        dataType: "json",
	        success: function (result) {
	            console.log(result); 
	         	// 검색 결과를 로컬 스토리지에 저장
	            localStorage.setItem('searchResult', JSON.stringify(result));

	            //URL로 리디렉션  
	            window.location.href = 'list';

	            if (result == null) {
	                alert("약물 정보를 가져오는 데 실패했습니다.");
	            }
	        },
	        error: function (xhr, status, error) {
	            console.error("Ajax 오류:", status, error);
	            alert("오류가 발생했습니다. 다시 시도해주세요.");
	        }
	    });
	}  
	
	</script>
</body>
</html>