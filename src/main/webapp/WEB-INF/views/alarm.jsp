<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title> 복용 관리 </title>
    <link rel="stylesheet" href="../resources/css/alarm.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <header>
        <div class="back-button">
            <img src="resources/img/goback.png" alt="뒤로가기" onclick="goBack()">
            	<script>
	            	function goBack() {
	            		window.history.back();
	            		}
            	</script>
            <span class="header-title">복용관리</span>
        </div>
        <img src="resources/img/logo2.png" alt="로고" class="logo">
    </header>

    <div class="content">
        <!-- 약이 없는 경우 -->
        <div class="medication-container" style="background-color: #FFFFFF;"> <!-- 흰색 배경 설정 -->
          <img src="resources/img/start1.png" alt="시작하기" class="start-image" style="display: block; margin: 0 auto;">
            <p style="text-align: center;">
                아직 등록된 복용 약이 없어요. 새로운 약을 추가해주세요.
                <br><br><br>
                <a href="addmedicine" class="add-medication-btn">추가하기</a>
            </p>
        </div>

        <!-- 추가된 약이 있는 경우 -->
        <div class="medication-container" style="display: none;">
            <div class="medication-info">
                <div>약 이름: 약 이름</div>
                <div class="caution-container">
                    <img src="caution.png" alt="주의사항" style="width: 50px; height: auto;"> <!-- caution.png 크기 조정 -->
                </div>
            </div>
            <!-- 다른 복용 약 정보들 -->
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

</body>

<style>
	.pill-img {
	    width: 80px; /* 너비를 80px로 설정 */
	    height: 50px; /* 높이를 50px로 설정 */
	    object-fit: cover; /* 이미지가 박스에 맞도록 설정 */
	}
</style>

<script>
	$(document).ready(function(){   
	    fn_selectBookmark();
	});      
 
	// 최초 실행
	var resultList;     
    function fn_selectBookmark() {
       $.ajax({  
           type: "post",
           url: "selectBookmark",   
           contentType: "application/json; charset=UTF-8",
           dataType: "json",   
           success: function(result) {
               console.log(result);
               resultList = result;
               console.log(resultList); 
               fn_addList(); 

               if (result == null) {
                   alert("북마크 리스트를 가져오는 데 실패했습니다.");
                   return;
               }
           },
           error: function(xhr, status, error) {
               //console.error("Ajax 오류:", status, error);
               alert("오류가 발생했습니다. 다시 시도해주세요.");
           }
       });
    }   
    
    function fn_deleteBookmark(itemSeq) {
        $.ajax({
            type: "post",  
            url: "deleteBookmark",   
            data: JSON.stringify({ item_seq: itemSeq }),  // 클릭한 항목의 item_seq 전송
            contentType: "application/json; charset=utf-8",
            success: function(response) {
                alert("삭제되었습니다.");
                fn_selectBookmark(); // 업데이트된 리스트를 다시 가져옴
            },
            error: function(xhr, status, error) {
                console.error("Ajax 오류:", status, error);
                alert("삭제 중 오류가 발생했습니다.");
            }
        });
    }
    
    
    
    function fn_addList() {
        var result = resultList; // 서버로부터 받은 데이터
        var pillList = $('.medication-container'); // 약 리스트 컨테이너 선택

        // 기존의 약 리스트 비우기
        pillList.empty();

        if (result && result.length > 0) {
            // 약이 있는 경우 약 리스트를 보여줌
            for (var i = 0; i < result.length; i++) {
                var medicationInfo = $('<div>', { class: 'medication-info' });

                var pillImage = $('<div>', {
                    class: 'pill-image'
                }).append($('<a>', {
                    href: 'addmedicine?item_name=' + encodeURIComponent(result[i].item_name) +
                          '&entp_name=' + encodeURIComponent(result[i].entp_name) +
                          '&item_image=' + encodeURIComponent(result[i].item_image)
                }).append($('<img>', {
                    src: result[i].item_image,
                    alt: '',
                    class: 'pill-img',
                    style: 'cursor: pointer;'
                })));

                var pillDetails = $('<div>', { class: 'pill-details' })
                    .append($('<div>', { class: 'pill-name', text: result[i].item_name }))
                    .append($('<div>', { class: 'pill-company', text: result[i].entp_name }));

                var deleteButton = $('<button>', {
                    class: 'delete-btn',
                    text: '삭제',
                    style: 'cursor: pointer;',
                    click: (function(itemSeq) {
                        return function() {
                            fn_deleteBookmark(itemSeq);
                        };
                    })(result[i].item_seq)
                });

                medicationInfo.append(pillImage).append(pillDetails).append(deleteButton);

                pillList.append(medicationInfo).append('<hr>');
            }
        } else {
            // 약이 없는 경우 약이 없다는 메시지와 시작 이미지 보여주기
            pillList.append(`
                <div style="background-color: #FFFFFF;">
                    <img src="${pageContext.request.contextPath}/resources/img/start1.png" alt="시작하기" class="start-image" style="display: block; margin: 0 auto;">
                    <p style="text-align: center;">
                        아직 등록된 복용 약이 없어요. 새로운 약을 추가해주세요.
                    </p>
                </div>
            `);
        }

        // 추가 버튼을 항상 표시
        pillList.append(`
        	    <p style="text-align: center;">
        	        <a href="addmedicine">
        	            <button class="add-medication-btn">
        	                약 추가하기
        	            </button>
        	        </a>
        	    </p> 
        	`);
    }
</script>
</html>



















