<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="resources/css/list.css" type="text/css">
<title>약 리스트</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script> 
</head>
<body>
	<header>
		<!-- 검색 창 -->
		<div>
			
			<div class="back-button">
            		<img src="resources/img/goback.png" alt="뒤로가기" onclick="goBack()">
            	<script>function goBack() {
            		window.history.back();
            		}
            	</script>
				<div id="search">
					<input type="text" placeholder="의약품명을 입력해주세요" class="text" id="inputPillNm"
						onkeyup="if(window.event.keyCode==13){search()}" /> <img
						src="resources/img/search.png" alt="" id="icon" onclick="search()" />
				</div>
			</div>    
        </div>
        <img src="resources/img/logo2.png" alt="로고" class="logo">
    </header>
	<div style="margin-top: 50px;">
		<p>    검색결과</p>
		<hr>
		<!-- List -->
		<div id="pillList">
			<!-- <ul>
				<li><img src="resources/img/LOGO_FULL.png" alt="" id="sub"
					width="100" height="50"></li>
				<li>
					<div class="company" id="company">회사이름</div>
					<div class="title" id="itemName">약이름</div>
				</li>
				<li><img src="resources/img/next.png" width="25" height="25"
					id="next"></li>
			</ul>   
			<hr> -->  
		</div>
	</div><br><br><br>

		
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
	<script>
	$(document).ready(function () {
        // 로컬 스토리지에서 결과 가져오기
        var result = JSON.parse(localStorage.getItem('searchResult'));
        var pillList = $('#pillList');
        var encodedItemImage;
    	var encodedEntpName;
    	var encodedItemName; 
    	var encodedwarnYn; 
    	var encodeItemSeq;
    	
        if (result && result.length > 0) {
            // 결과가 있으면 리스트를 생성
            for (var i = 0; i < result.length; i++) {
            	let item_seq = result[i].item_seq;
            	let item_image = result[i].item_image;
	            let entp_name = result[i].entp_name;
	            let item_name = result[i].item_name;
	            let warnYn = result[i].warnYn;
	              
                // ul 요소 생성
                var ul = $('<ul>');

                // li 요소 생성
                var li1 = $('<li>').append($('<img>', {
				    src: result[i].item_image,
				    alt: '',
				    id: 'sub',
				    width: '80',
				    height: '50'
				}));   

                var li2 = $('<li>').append($('<div>', {
                    class: 'company',
                    text: result[i].entp_name // 로컬 스토리지에서 entp_name 가져오기
                })).append($('<div>', {
                    class: 'title',
                    text: result[i].item_name // 로컬 스토리지에서 item_name 가져오기
                }));

                encodedItemImage = encodeURIComponent(result[i].item_image);
                encodedEntpName = encodeURIComponent(result[i].entp_name);
                encodedItemName = encodeURIComponent(result[i].item_name);
                encodedwarnYn = encodeURIComponent(result[i].warnYn);
                encodeItemSeq = encodeURIComponent(result[i].item_seq);

                var li3 = $('<li>').append($('<a>', {
	                href: 'detailPage?item_image=' + encodedItemImage + '&entp_name=' + encodedEntpName + '&item_name=' + encodedItemName+'&warnYn='+warnYn,
	                style: 'display: inline-block;'
	            }).append($('<img>', {
	                src: 'resources/img/plus.png',
	                width: '20',
	                height: '20',
	                id: 'next'
	            })));
                
                var li4 = $('<li>').append($('<button>', {
	                text: '등록하기',
	                id: 'bookmarkBtn',
	                style: 'margin-top: 5px;' 
	            }));

	            li4.find('#bookmarkBtn').on('click', function() {
	                addBookmark(item_seq, item_image, entp_name, item_name);
	                
	                
	            });

                // ul에 li들 추가
                ul.append(li1).append(li2).append(li3).append(li4);

                // pillList에 ul 추가
                pillList.append(ul).append('<hr>');
            }
        }
    });  
	   
		const text = document.getElementsByClassName("text")[0];
		const btn = document.getElementById("icon");

		function search() {
			if (!text.value) {
				alert("검색하실 의약품명을 입력해주세요.");
			}
			var pillNm = $('#inputPillNm').val();

			var data = {
				itemNm : pillNm,
			};
			console.log(data);

			$.ajax({
				type : "post",
				url : "/searchPillNm",
				data : JSON.stringify(data),
				contentType : "application/json; charset=UTF-8",
				dataType : "json",
				success : function(result) {
					console.log(result);
					resultList = result;

					// 검색 결과를 로컬 스토리지에 저장
					localStorage.setItem('searchResult', JSON.stringify(result));

					//URL로 리디렉션  
					window.location.href = 'list';

					if (result == null) {
						alert("약물 정보를 가져오는 데 실패했습니다.");
					}
				},
				error : function(xhr, status, error) {
					console.error("Ajax 오류:", status, error);
					alert("오류가 발생했습니다. 다시 시도해주세요.");
				}
			});
		}
		
		function addBookmark(item_seq, item_image, entp_name, item_name) {
			/* var atpnQesitm;
			document.addEventListener('DOMContentLoaded', function(){
		        // Fetch API를 사용한 Ajax 요청
		        fetch('https://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?serviceKey=RlP5Qs6W7JzE4R72UmPN5dqZ5zMcFWMluYCsSwarFUzSHvlUdP3ZRc8t72i4LF9oM2SbnfiD%2FF4YOVKFJvVQqw%3D%3D&pageNo=1&numOfRows=3&type=json&itemSeq=200003092') // 실제 API 엔드포인트로 대체해야 합니다.
		            .then(response => response.json())
		            .then(data => {
		                // API 응답 성공 시 실행되는 함수
		                // 받아온 데이터를 화면에 표시
		                console.log(data)
		                atpnQesitm = data.body.items[0].seQesitm;
		                console.log(JSON.stringify(store))
		                //$("#caution").innerHTML=(JSON.stringify(showData))
		                //document.getElementById('caution').innerHTML = 'API Response: ' + JSON.stringify(data);
		            })
		        }) */
		        
		     $.ajax({
		        type: 'POST',
		        url: 'bookmark.do',
		        data: {
		        	item_seq: item_seq,
		            item_image: item_image,
		            entp_name: entp_name,
		            item_name: item_name
		        },
		        success: function(response) {
		            alert('약품이 추가되었습니다.');
		            
		         // 파라미터 인코딩 처리
		            const encodedItemName = encodeURIComponent(item_name);
		            const encodedEntpName = encodeURIComponent(entp_name);
		            const encodedItemImage = encodeURIComponent(item_image);
		            
					// 해당 링크로 리다이렉션 (파라미터 포함)
					window.location.href = "http://localhost:8080/addmedicine?item_name=" + encodedItemName + "&entp_name=" + encodedEntpName + "&item_image=" + encodedItemImage;          
		        },
		        error: function(xhr, status, error) {
		            console.error('Ajax 오류:', status, error);
		            alert('북마크 추가 중 오류가 발생했습니다.');
		        }
		    }); 
			
		  	// 검색 결과를 로컬 스토리지에 저장
			localStorage.setItem('bookmarkList', JSON.stringify(result));
		}
	</script>

	


</body>
</html>