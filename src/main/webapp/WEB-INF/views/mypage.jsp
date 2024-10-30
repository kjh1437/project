<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<!DOCTYPE html> 
<html>
<head>
<meta charset="EUC-KR"> 
<link href="../resources/css/mypage.css" rel="stylesheet">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link rel="short icon" href="#">
<title>마이페이지</title>
</head>
<style>
    .info-section {
        display: flex;
        flex-direction: column; /* 세로 방향으로 배치 */
        align-items: stretch;   /* 버튼들을 동일한 너비로 설정 */
    }

    .action-item {
        display: block;
        padding: 15px 20px;
        margin: 5px 0;
        background-color: #4CAF50; /* 버튼 배경색 */
        color: white;
        text-align: center;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        font-size: 18px;
    }
    
    .action-item:hover {
        background-color: #45a049; /* 호버 시 배경색 변경 */
    }
</style>
<body>
<header>
        <div class="back-button">
            <img src="resources/img/goback.png" alt="뒤로가기" onclick="goBack()">
            	<script>function goBack() {
            		window.history.back();
            		}
            	</script>
            <span class="header-title">약품검색</span>
        </div>
        <img src="resources/img/logo2.png" alt="로고" class="logo">
    </header>

    <div class="profile-section">
        <img src="resources/img/pills.png" alt="프로필" class="profile-icon">
        <div class="profile-name" id="userName"></div>
    </div>

    <hr class="divider">

    <div class="content">
        <div class="info-section">
            <div class="info-item">
                <div>이름</div>
                <div>
                    <span id="name"></span>
                    <button class="edit-button" id='nameEditBtn' >수정하기</button>
                </div>
            </div>
            <div class="info-item">
                <div>연락처</div>
                <div>
                    <span id="phone"></span>
                    <button class="edit-button" id='phoneEditBtn' >수정하기</button>
                </div>
            </div>
            <div class="info-item">
                <div>생년월일</div>
                <div>
                    <span id="dob"></span>
                    <button class="edit-button" id='dobEditBtn' >수정하기</button>
                </div>
            </div>
            <div class="info-item">
                <div>성별</div>
                <div>
                    <span id="gender"></span>
                    <button class="edit-button" id='genderEditBtn' >수정하기</button>
                </div>
            </div>
        </div>
        <div class="info-section">
    		<div class="action-item" onclick="window.location.href='http://localhost:8080/calendar'">복용기록 확인하기</div>
		    <div class="action-item" onclick="fn_logout()">로그아웃</div>
		    <div class="action-item" onclick="fn_deleteUser()">탈퇴하기</div>
		    <div class="action-item" onclick="appInfo()">앱 정보</div>
	</div>
    </div>

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
    $(document).ready(function () {
        fn_selectUserInfo();
        
     // '수정하기' 버튼 클릭 시
        $(".edit-button").on("click", function() {
            const field = $(this).attr('id').replace('EditBtn', ''); // 'name', 'phone', 'dob', 'gender' 가져오기
            const spanElement = $('#' + field);
            const buttonElement = $(this);
            
            // '수정하기' -> '저장하기' 상태
            if (buttonElement.text() === '수정하기') {
                const currentValue = spanElement.text(); // 현재 값을 가져옴
                
                // span을 input으로 변경
                if(field == "name"){
                	spanElement.html(`<input type="text" id="nameInput" />`);
                } else if (field == "phone"){
                	spanElement.html(`<input type="text" id="phoneInput" />`);
                } else if (field == "dob"){
                	spanElement.html(`<input type="text" id="dobInput" />`);
                }
                
                // 버튼 텍스트를 '저장하기'로 변경
                buttonElement.text('저장하기');
            } 
            // '저장하기' 상태
            else {
                saveInfo(field);  // 저장 함수 호출
                buttonElement.text('수정하기');  // 버튼 텍스트를 다시 '수정하기'로 변경
            }
        });
    });

    function fn_selectUserInfo() {
        var id = '${sessionScope.user != null ? sessionScope.user.id : ""}';
        
        if (id === "") {
            console.error("세션에 사용자 ID가 없습니다.");
            return;
        }

        var data = {
            id: id
        };
        console.log("보내는 데이터:", JSON.stringify(data));
        
        $.ajax({
            type: "POST",
            url: "/selectUserInfo.do",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify(data),
            dataType: "json",
            success: function(result) {
                console.log("서버 응답:", result);

                if (result) {
                    $('#name').text(result.nm || "정보 없음");
                    $('#phone').text((result.tel1 || "") + "-" + (result.tel2 || "") + "-" + (result.tel3 || ""));
                    $('#dob').text(result.birth || "정보 없음");
                    $('#gender').text(result.sex === 'M' ? '남성' : '여성');
                } else {
                    alert("서버에서 유효한 데이터를 반환하지 않았습니다.");
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX 요청 실패:", status, error);
                alert("오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
    }
    
    // Highlight the active footer icon
    const currentPath = window.location.pathname;
    footerIcons.forEach(icon => {
        if (currentPath.includes(icon.id)) {
            icon.classList.add('active');
        }
    });

    // Function to edit info
   /*  function editInfo(field) { 
    	if(field == 'name'){
    		saveInfo('name');
    	}    //var $span = $('#' + field);
    //var currentValue = $span.text().trim();  // 공백 제거
    //var htmlContent = `
    //    <input type="text" id="${field}-input" value="${currentValue}"> 
    //    <button class="edit-button" onclick="saveInfo('${field}')">저장하기</button>
    //`;

    // HTML 내용을 $span에 설정
    //$span.html(htmlContent);
} */

	//저장 처리 함수
	function saveInfo(field) {
	    const inputElement = $('#' + field + 'Input'); // 해당 input 요소
	    const newValue = inputElement.val(); // 입력된 값
	    const spanElement = $('#' + field); // 해당 span 요소
	
	    // 필드에 따라 다른 처리
	    if (field === 'name') {
	        // 이름을 저장하는 AJAX 요청
	    	$.ajax({
	    	    type: 'POST',
	    	    url: '/updateName',
	    	    contentType: 'application/json', // 이 부분을 추가
	    	    data: JSON.stringify({ nm: newValue }),
	    	    success: function(response) {
	    	        alert('이름이 성공적으로 업데이트되었습니다.');
	    	        spanElement.text(newValue);
	    	    },
	    	    error: function() {
	    	        alert('이름 업데이트에 실패했습니다.');
	    	    }
	    	});
	    } else if (field === 'phone') {
	        // 연락처를 저장하는 AJAX 요청
	        var data = {
			        tel1: newValue.substring(0, 3),
			        tel2: newValue.substring(3, 7),
			        tel3: newValue.substring(7, 11)
			    };
	        
	        $.ajax({
	       	    type: 'POST',
	       	    url: '/updateTel',
	       	    contentType: 'application/json', // 이 부분을 추가
	       	    data: JSON.stringify({ tel1: newValue.substring(0, 3),
			        				   tel2: newValue.substring(3, 7),
			        				   tel3: newValue.substring(7, 11) 
			        				 }),
	       	    success: function(response) {
	       	        alert('전화번호가 성공적으로 업데이트되었습니다.');
	       	        spanElement.text(newValue.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3'));
	       	    },
	       	    error: function() {
	       	        alert('전화번호 업데이트에 실패했습니다.');
	       	    }
	       	});
	    } else if (field === 'dob') {
	        // 생년월일을 저장하는 AJAX 요청
	        $.ajax({
	    	    type: 'POST',
	    	    url: '/updateBirth',
	    	    contentType: 'application/json', // 이 부분을 추가
	    	    data: JSON.stringify({ birth: newValue }),
	    	    success: function(response) {
	    	        alert('생년월일이 성공적으로 업데이트되었습니다.');
	    	        spanElement.text(newValue);
	    	    },
	    	    error: function() {
	    	        alert('생년월일 업데이트에 실패했습니다.');
	    	    }
	    	});
	    } 
	}
	
	function fn_logout() {
	    // 로그아웃 요청
	    $.ajax({
	        type: 'GET',
	        url: '/logout.do',
	        success: function() {
	            // 로그아웃 후 메인 페이지로 리다이렉트
	            window.location.href = '/login';
	        },
	        error: function() {
	            alert('로그아웃 실패. 다시 시도해주세요.');
	        }
	    });
	    window.location.href = 'http://localhost:8080/login';
	}
    
	function fn_deleteUser(){
		var id = '<c:out value="${sessionScope.user.id}" />';  
		
		 $.ajax({
		        type: "post",  
		        url: "/deleteUser",
		        data: JSON.stringify({ id: id }),
		        contentType: "application/json; charset=utf-8",
		        success: function(response) {  
		        	if(response == 'success'){
		        		console.log(response + "조성규");  
		        	    
			        	alert("회원탈퇴가 완료되었습니다.");
			        	
			        	window.location.href = "main"; 
		        	}
		        	else{
		        		alert("탈퇴 중 오류가 발생했습니다.");    
		        	}
		        	     
		        },
		        error: function(xhr, status, error) {
		            console.error("Ajax 오류:", status, error);
		            alert("탈퇴 중 오류가 발생했습니다.");
		        }
		    });    
		 
		 
	}
    
    </script>
    
</body>
</html>