<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../resources/css/addmedicine.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js" 
    integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" 
    crossorigin="anonymous"></script>
    <title>약 추가하기</title>
</head>
<style>
        /* 약 정보 표시 영역 스타일 추가 */
        .pill-info-container {
            margin: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
            display: none; /* 기본적으로 숨김 */
            text-align: center; /* 중앙 정렬 */
        }
        .pill-info-container img {
            max-width: 100px; /* 이미지 크기 제한 */
            height: auto;
            margin-bottom: 10px;
        }
        .pill-info-container .details {
            font-size: 16px;
        }
        .pill-info-container .details .title {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .pill-info-container .details .company {
            color: #555;
        }
    </style>
<body>
    <header>
        <div class="back-button">
            <img src="goback.png" alt="뒤로가기" onclick="goBack()">
            <span class="header-title">약 추가하기</span>
        </div>
        <img src="resources/img/logo2.png" alt="로고" class="logo">
    </header>
	<!-- 약 정보 표시 영역 추가 -->
    <div class="pill-info-container" id="pill-info">
        <img id="pill-image" src="" alt="약 이미지">
        <div class="details">
            <div class="title" id="pill-name">약 이름</div>
            <div class="company" id="pill-company">회사 이름</div>
        </div>
    </div>
    <div class="content">
        <div id="" class="add-medication-form">
            <div id="search">
				<input type="text" placeholder="의약품명을 입력해주세요" class="text" id="inputPillNm" onkeyup="if(window.event.keyCode==13){fn_search()}"/>
				<img src="..resources/img/search.png" alt="검색" id="icon" onclick="fn_search()" />
			</div>
            
	        <div class="scrollBar" style="margin-top: 50px;">
	            <!-- <p>
	                <span style="color: red; font-size: 5px;">●</span>복용금지
	            </p>
	            <hr> -->
	            <div id="pillList">
	                <!-- 검색된 약 리스트가 여기에 추가됩니다. -->
	            </div>
	        </div> 
	    
            <div class="form-group">
                <label for="medicine-photo">약품 사진 등록</label>
                <button type="button" class="photo-upload-btn" onclick="uploadPhoto()">촬영하여 등록</button>
            </div>
            <div class="form-group">
                <label for="dosage-method">복용 방법*</label>
                <div>
                    <button type="button" class="schedule-btn selected" id="weekday-schedule-btn">요일별</button>
                    <button type="button" class="schedule-btn" id="periodic-schedule-btn">주기별</button>
                </div>
            </div>
            <div class="form-group days-container">
                <label for="dosage-days">요일별</label>
                <div>
                    <button type="button" class="day-btn">일</button>
                    <button type="button" class="day-btn">월</button>
                    <button type="button" class="day-btn">화</button>
                    <button type="button" class="day-btn">수</button>
                    <button type="button" class="day-btn">목</button>
                    <button type="button" class="day-btn">금</button>
                    <button type="button" class="day-btn">토</button>
                </div>
            </div>
            <div class="form-group">
                <input type="checkbox" id="all-days" name="all-days">
                <label for="all-days">매일 선택</label>
            </div>
            <div class="form-group">
                <label for="dosage-frequency">일일 횟수/시간</label>
                <select id="dosage-frequency" name="" class="form-select">
                    <option value="1">1회</option>
                    <option value="2">2회</option>
                    <option value="3">3회</option>
                </select>
                <div id="time-settings-buttons">
                    <!-- 시간 설정 버튼이 동적으로 추가됩니다 -->
                </div>
            </div>
            <div class="form-group periodic-container" id="periodic-container">
                <div class="frequency-container">
                    <label for="start-date">복용 시작 날짜</label>
                    <input type="date" id="start-date" name="" class="form-input date-picker">
                </div>
                <div class="frequency-container">
                    <input type="number" id="" name="" class="form-input frequency-input" min="1" max="30" placeholder="1">
                    <select id="periodic-unit" name="" class="form-select">
                        <option value="1">일</option>
                        <option value="30">달</option>
                        <option value="365">년</option>
                    </select>
                </div>
                <div id="periodic-time-settings-buttons">
                    <!-- 시간 설정 버튼이 동적으로 추가됩니다 -->
                </div>
            </div>
            <div class="form-group">
                <label for="medicine-memo">약에 대한 메모를 입력하세요</label>
                <textarea id="medicine-memo" name="" class="form-input memo-input" placeholder="내용을 입력해주세요."></textarea>
            </div>
            <button type="submit" class="add-medication-btn">복용 알림 추가</button>
        </div>
    </div>

    <footer>
        <div class="footer-icon-container" id="alarm">
            <a href="alarm"><img src="resources/img/alarm.png" alt="복용 관리" class="footer-icon"></a>
        </div>
        <div class="footer-icon-container" id="search">
            <a href="shapeSear"><img src="resources/img/search.png" alt="약 검색" class="footer-icon"></a>
        </div>
        <div class="footer-icon-container" id="home">
            <a href="main"><img src="resources/img/home.png" alt="메인으로 돌아가는 페이지" class="footer-icon"></a>
        </div>
        <div class="footer-icon-container" id="pharmacy">
            <a href="map"><img src="resources/img/pharmacy.png" alt="병원/약국 찾기" class="footer-icon"></a>
        </div>
        <div class="footer-icon-container" id="mypage">
            <a href="mypage"><img src="resources/img/mypage.png" alt="마이페이지" class="footer-icon"></a>
        </div>
    </footer>

    <script>
        // 뒤로 가기
        function goBack() {
            window.history.back();
        }

     	// URL 파라미터에서 약 정보 읽기
        function getQueryParams() {
            const params = new URLSearchParams(window.location.search);
            return {
                itemName: params.get('item_name'),
                entpName: params.get('entp_name'),
                itemImage: params.get('item_image')
            };
        }

        $(document).ready(function() {
            const { itemName, entpName, itemImage } = getQueryParams();
            const hasQueryParams = itemName || entpName || itemImage;
            
            // #search div의 표시 여부 결정
            if (hasQueryParams) {
                $('#search').hide(); // 파라미터가 있으면 숨김
            } else {
                $('#search').show(); // 파라미터가 없으면 표시
            }

            // 약 정보 표시
            if (itemName && entpName && itemImage) {
                $('#pill-name').text(itemName);
                $('#pill-company').text(entpName);
                $('#pill-image').attr('src', itemImage);
                $('#pill-info').show(); // 정보가 있을 때만 표시
            }
        });
        
        // 사진 업로드 알림
        function uploadPhoto() {
            alert('사진 업로드 기능은 아직 구현되지 않았습니다.');
        }
		
        var resultList; 

        // 약물 목록 추가 함수
        function fn_addList() {
            var pillList = $('#pillList');
            pillList.empty(); // 기존 목록 초기화
            if (resultList && resultList.length > 0) {
                resultList.forEach(function(result) {
                    let item_seq = result.item_seq;
                    let item_image = result.item_image;
                    let entp_name = result.entp_name;
                    let item_name = result.item_name;

                    var ul = $('<ul>');
                    var li1 = $('<li>').append($('<img>', {
                        src: item_image,
                        width: '80',
                        height: '50'
                    }));
                    
                    var li2 = $('<li>').append($('<div>', {
                        class: 'company',
                        text: entp_name
                    })).append($('<div>', {
                        class: 'title',
                        text: item_name
                    }));
                    
                    var li3 = $('<li>').append($('<a>', { 
                        href: 'detailPage?item_seq=' + encodeURIComponent(item_seq),
                    }).append($('<img>', {
                        src: 'resources/img/next.png',
                        width: '20',
                        height: '20'
                    })));
                    
                    var li4 = $('<li>').append($('<button>', {
    	                text: '등록하기',
    	                id: 'bookmarkBtn',
    	                style: 'margin-top: 5px;' 
    	            }));
                    
                    li4.find('#bookmarkBtn').on('click', function() {
    	                addBookmark(item_seq, item_image, entp_name, item_name);
    	            });
                    
                    ul.append(li1, li2, li3, li4);
                    pillList.append(ul).append('<hr>');
                });
            }
        }

        // 약 검색
        function fn_search() {
            var pillNm = $('#inputPillNm').val();
            if (!pillNm) {
                alert("검색하실 의약품명을 입력해주세요.");
                return;
            }

            $.ajax({
                type: "POST",
                url: "/searchPillNm",
                data: JSON.stringify({ itemNm: pillNm }),
                contentType: "application/json; charset=UTF-8",
                dataType: "json",
                success: function (result) {
                    resultList = result;
                    fn_addList();
                },
                error: function () {
                    alert("오류가 발생했습니다. 다시 시도해주세요.");
                }
            });
        }

        function addBookmark(item_seq, item_image, entp_name, item_name) {
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
		            alert('북마크가 추가되었습니다.');
		            
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
			
		}
        
    </script>
</body>
</html>
