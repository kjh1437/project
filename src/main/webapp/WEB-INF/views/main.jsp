<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title> 약 복용(Main) </title>
    <link rel="stylesheet" href="../resources/css/main.css">
    <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
   
</head>
<style>
.pill-img {
    width: 80px; /* 너비를 80px로 설정 */
    height: 50px; /* 높이를 50px로 설정 */
    object-fit: cover; /* 이미지가 박스에 맞도록 설정 */
}

.medication-info {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

.pill-details {
    flex-grow: 1;
    padding-left: 10px;
}

.pill-time {
    font-size: 16px;
    font-weight: bold;
}

.pill-company {
    font-size: 14px;
    color: #888;
}

hr {
    border: none;
    border-top: 1px solid #ddd;
    margin: 10px 0;
}

table {
		width: 800px;
		height: 700px;
		border: 1px solid #444444;
		border-collapse: collapse;
		}
		
.calendar_day {
            display: flex;
            justify-content: space-around;
        }
.calendar_date {
    display: flex;
    justify-content: space-around;
    margin: 10px 0;
}
 .calendar-day {
    margin: 5px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    cursor: pointer; /* 클릭 가능하도록 마우스 커서 변경 */
    display: inline-block; /* 버튼처럼 보이게 하기 위해 */
    text-align: center;
    transition: background-color 0.3s;
}
.calendar-day:hover {
    background-color: #f0f0f0; /* 마우스 오버 시 배경색 변경 */
}
.line {
    border-top: 1px solid #ccc;
    margin: 10px 0;
}
.hidden {
    display: none;
}

.section {
    margin: 20px;
    padding: 20px;
    border-radius: 15px;
    background-color: lightgray;
}

.btn {
    padding: 10px 20px;
    margin: 5px;
    border-radius: 10px;
    background-color: white;
    color: black;
    cursor: pointer;
}

.btn:disabled {
    background-color: lightblue;
    color: white;
    cursor: not-allowed;
}

.popup {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    padding: 20px;
    border: 1px solid black;
    border-radius: 10px;
    z-index: 1000;
}

#popup-content {
    display: flex;
    flex-direction: column;
    align-items: center;
}

</style>
<body>
<header>
    <div class="title">
        <span>PILL&YOU</span>
        <img src="resources/img/logo2.png" alt="PILL&YOU">
    </div>
</header>

<div class="navbar">
    <button class="button active" id="약-button" value="1">약</button>
    <button class="button" id="영양제-button" value="2">영양제</button>
    <button class="button" id="건강관리-button">건강관리</button>
</div>

<div class="line"></div>

	<!-- <table align="center" id="calendar">
		<tr>
			<td>
			<a id="before" href="javascript:beforem()"></a>
			</td>
			<td colspan="4" align="center">
			<div id="yearmonth"></div>
			</td>
			<td>
			<a id="next" href="javascript:nextm()"></a>
			</td>
			<td>
			<a href="javascript:thisMonth()">오늘</a>
			</td>
		</tr>
		<tr>
			<td width="14%"> 월 </td>
			<td width="14%"> 화 </td>
			<td width="14%"> 수 </td>
			<td width="14%"> 목 </td>
			<td width="14%"> 금 </td>
			<td width="14%"><font color="#009de0">토</font></td>
			<td width="14%"><font color="#ed5353">일</font></td>
		</tr>
	</table> -->
	 
<div id="약-section">
    <div id="current-date" style="text-align: center;"></div>
    <div class="line"></div>

    <div class="calendar_day">
        <span>월</span>
        <span>화</span>
        <span>수</span>
        <span>목</span>
        <span>금</span>
        <span>토</span>
        <span>일</span>
    </div>
    <div class="calendar_date" id="calendar-dates">
        <!-- 날짜를 JavaScript로 채웁니다 -->
    </div>
    <div class="line"></div>

    <main id="pill-section">
        <!-- <section class="section">
            <div>오전 10:00 | 아침 식후 30분 | 약 이름1</div>
        </section>
        <section class="section">
            <div>오후 13:30 | 점심 식수 30분 | 약 이름2</div>
        </section> -->
    </main>
</div>

<div id="영양제-section" class="hidden">
    <div id="current-date-supplement" style="text-align: center;"></div>
    <div class="line"></div>

    <div class="calendar_day">
        <span>월</span>
        <span>화</span>
        <span>수</span>
        <span>목</span>
        <span>금</span>
        <span>토</span>
        <span>일</span>
    </div>
    <div class="calendar_date" id="calendar-dates-supplement">
        <!-- 날짜를 JavaScript로 채웁니다 -->
    </div>
    <div class="line"></div>

   <main id="supplement-section">
        <section class="section">
            <div>오전 10:00 | 아침 식후 30분 | 영양제 이름1</div>
        </section>
        <section class="section">
            <div>오후 13:30 | 점심 식수 30분 | 영양제 이름2</div>
        </section>
    </main>
</div>

<div id="건강관리-section" class="hidden">
    <div id="current-date-health" style="text-align: center;"></div>
    <div class="line"></div>

    
    <div class="line"></div>

    <main>
       
        <section class="section">
            <div class="exercise">
                <p>운동 D+<span id="exercise-day">0</span> | 오늘은 운동을 하셨나요?</p>
                <button id="exercise-yes" class="btn">네</button>
                <button id="exercise-no" class="btn">아니오</button>
            </div>
        </section>

        
        <section class="section">
            <div class="smoking">
                <p>금연 D+<span id="smoking-day">0</span> | 오늘은 금연을 하셨나요?</p>
                <button id="smoking-yes" class="btn">네</button>
                <button id="smoking-no" class="btn">아니오</button>
            </div>
        </section>

        
        <section class="section">
            <div class="drinking">
                <p>금주 D+<span id="drinking-day">0</span> | 오늘은 금주를 하셨나요?</p>
                <button id="drinking-yes" class="btn">네</button>
                <button id="drinking-no" class="btn">아니오</button>
            </div>
        </section>
    </main>
    <div id="popup" class="hidden">
    <div id="popup-content">
        <p id="popup-message"></p>
        <button id="popup-close">닫기</button>
    </div>
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
	var buttonValue = '1';
	$(document).ready(function(){
		
		$('.button').click(function() {
	        buttonValue = $(this).val();
	    });
		// 오늘 날짜 가져오기
	    var today = new Date();
	    
	    // 오늘이 월요일인지 확인
	    var dayOfWeek = today.getDay(); // 0: 일요일, 1: 월요일, ..., 6: 토요일
	    var sundayOffset = (dayOfWeek + 6) % 7; // 일요일로 맞추기 위한 오프셋
	    var startOfWeek = new Date(today);
	    startOfWeek.setDate(today.getDate() - sundayOffset); // 해당 주의 일요일 날짜 계산

	    // 날짜 추가
	    var datesHtml = '';
	    for (var i = 0; i < 7; i++) {
	        var currentDate = new Date(startOfWeek);
	        currentDate.setDate(startOfWeek.getDate() + i); // 일요일부터 시작하여 날짜 추가
	        var month = currentDate.getMonth() + 1; // 월은 0부터 시작하므로 1을 더함
	        var date = currentDate.getDate();

	        // 버튼 형태로 추가
	        datesHtml += '<button class="calendar-day" data-date="' + currentDate.toISOString().split('T')[0] + '">' + month + '/' + date + '</button>'; // MM/DD 형식으로 출력
	    }

	    // HTML에 추가
	    $('#calendar-dates').html(datesHtml);
		
	 	// HTML에 추가
	    $('#calendar-dates-supplement').html(datesHtml);
	 
	    // 현재 날짜 표시
	    $('#current-date').text('오늘: ' + today.toLocaleDateString());

	 // 현재 날짜 표시
	    $('#current-date-supplement').text('오늘: ' + today.toLocaleDateString());
	 
	    // 날짜 버튼 클릭 이벤트
	    $('.calendar-day').click(function() {
	        var selectedDate = $(this).data('date'); // 클릭한 버튼의 데이터 속성에서 날짜 가져오기
	        //alert('선택한 날짜: ' + selectedDate); // 선택한 날짜를 보여주는 예시
	        // 여기에 추가적인 기능을 구현할 수 있습니다.
	    });
	    
	    function loadCalendarPage() {
	        // calendar.jsp로 이동
	        if (buttonValue === '1') {
	        	window.location.href = 'calendar';
	        } else if(buttonValue === '2'){
	        	window.location.href = 'calendar2';
	        }
	        
	    }

	    // 날짜 버튼 클릭 이벤트 리스너 추가
	    $(document).on('click', '.calendar-day', function() {
	        loadCalendarPage(); // 날짜 버튼 클릭 시 함수 호출
	    });
	    
	    fn_selectBookmark();
	 });
	 
	 var resultList = "";     
	 function fn_selectBookmark() {
	     $.ajax({  
	         type: "post",
	         url: "selectBookmark",   
	         contentType: "application/json; charset=UTF-8",
	         dataType: "json",   
	         success: function(result) {
	             resultList = result;
	             fn_addList(); 
	             fn_addList2();
	             autoReload();
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
	 
	 
	 var today = new Date(); //오늘 날짜
	 
		function getInputDayLabel() {

	        var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');

	        var today = new Date('2020-07-27').getDay();
	        var todayLabel = week[today];

	        return todayLabel;
	    }
		
		var today = new Date(); //오늘 날짜        
		var date = new Date();
		
		//이전달
		function beforem() //이전 달을 today에 값을 저장
		{ 
			today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
			autoReload(); //만들기
		}
		
		//다음달
		function nextm()  //다음 달을 today에 저장
		{
			today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
			autoReload();
		}
		
		//오늘선택
		function thisMonth(){
			today = new Date();
			autoReload();
		}

		function autoReload()
		{
			var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
			var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
			var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
			var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
			yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월"; //년도와 월 출력

			if(today.getMonth()+1==12) //  눌렀을 때 월이 넘어가는 곳
			{
				before.innerHTML=("<"+today.getMonth())+"월";
				next.innerHTML="1월"+">";
				
			}
			else if(today.getMonth()+1==1) //  1월 일 때
			{
				before.innerHTML="<"+"12월";
				next.innerHTML=(today.getMonth()+2)+"월" +">";
			}
			else //   12월 일 때
			{
				before.innerHTML="<"+(today.getMonth())+"월";
				next.innerHTML=(today.getMonth()+2)+"월"+">";
			}


			// 남은 테이블 줄 삭제
			while (tbcal.rows.length > 2) 
			{
				tbcal.deleteRow(tbcal.rows.length - 1);
			}
			var row = null;
			row = tbcal.insertRow();
			var cnt = 0;
			var dayCheck = (nMonth.getDay()==0) ? 7 : nMonth.getDay(); //일요일을 마지막으로 넣기 위해서.

			 // 1일 시작칸 찾기
			for (i = 0; i < (dayCheck-1); i++) 
			{
				cnt = cnt + 1;	//요일값
				cell = row.insertCell();
				
				if (i>4) { //주말
					cell.style.backgroundColor = "#f7f7f7";
				}
			}


			// 달력 출력
			for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
			{ 
				cell = row.insertCell();
				
				var str="";
				
				str += "<div>"+i+"</div>";
				var day = (i<10) ? "0"+i : i;            	
				//str += "<div id='"+day+"'></div>"; //나중에 원하는 날에 일정을 넣기위해 id값을 날자로 설정
				
				var year = nMonth.getFullYear(); // 현재 달력의 연도
				var month = (nMonth.getMonth() + 1).toString().padStart(2, '0'); // 현재 달력의 월 (두 자릿수로 만들기)
				var day = i.toString().padStart(2, '0'); // 일 (두 자릿수로 만들기)

				str += "<div id='" + year + month + day + "'></div>"; // id를 'YYYYMMDD' 형식으로 설정

				cell.innerHTML = str;
				
				cnt = cnt + 1;
				if (cnt % 7 == 6) {//토요일
					var str="";
					str += "<div>"+i+"</div>";
					var day = (i<10) ? "0"+i : i;            	
					str += "<div id='"+day+"'>";
					str += "</div>";
					cell.innerHTML = str;
					cell.style.color = "#009de0";
					cell.style.backgroundColor = "#f7f7f7";                    
				}
				if (cnt % 7 == 0) { //일요일
					var str="";
					str += "<div>"+i+"</div>";
					var day = (i<10) ? "0"+i : i;            	
					str += "<div id='"+day+"'>";
					str += "</div>";
					cell.innerHTML = str;
					row = calendar.insertRow();// 줄 추가
					cell.style.color = "#ed5353";
					cell.style.backgroundColor = "#f7f7f7";
				}
				
				//마지막 날짜가 지나면 일요일까지 칸 그리기
				if(lastDate.getDate() == i && ((cnt % 7) != 0)){
					var add = 7 - (cnt % 7);
					for(var k = 1; k <= add; k++){
						cell = row.insertCell();
						cnt = cnt + 1;
						if (cnt % 7 == 6) {//토요일
							cell.style.backgroundColor = "#f7f7f7";
						}
						if (cnt % 7 == 0) { //일요일
							cell.style.backgroundColor = "#f7f7f7";
						}
					}
				}
				
				//오늘날짜배경색
				if( today.getFullYear() == date.getFullYear() && today.getMonth() == date.getMonth() && i==date.getDate() )
				{
					cell.style.backgroundColor = "#e2f3da"; //오늘날짜배경색
				}
				
				//마지막 날짜가 지나면 일요일까지 칸 그리기
				if(lastDate.getDate() == i && ((cnt % 7) != 0)){
					var add = 7 - (cnt % 7);
					for(var k = 1; k <= add; k++){
						cell = row.insertCell();
						cnt = cnt + 1;
						if (cnt % 7 == 6) {//토요일
							cell.style.backgroundColor = "#f7f7f7";
						}
						if (cnt % 7 == 0) { //일요일
							cell.style.backgroundColor = "#f7f7f7";
						}
					}
				}
			}
			
			//원하는 날짜 영역에 내용 추가하기
			var tdId = "01"; //1일
			var str = "";
			str += "<br>09:00 일정1";
			str += "<br>12:00 일정2 \n";
			var takeBegin = "";
			var takeEnd = "";
			var itemName = "";
			
			for(i = 0; i<resultList.length; i++) {
				takeBegin = resultList[i].take_begin;
				takeEnd = resultList[i].take_end;
				itemName = resultList[i].item_name;
				itemImage = resultList[i].item_image;
				
				for (j = Number(takeBegin); j < Number(takeEnd) + 1; j++) {
				    var element = document.getElementById(j);

				    // 아이템 이름과 이미지 태그를 한 번에 추가
				    var content = "<img src='" + itemImage + "' alt='" + itemName + "' style='width: 40px; height: 40px;'>" +
				    				"<p>" + itemName + "</p>";

				    // 기존 내용에 이름과 이미지를 함께 추가
				    element.innerHTML += content;
				}
			}
		}
		function fn_addList() {
		    var result = resultList;
		    var pillSection = $('#pill-section'); // 약물이 표시될 섹션 ID
		    
		    pillSection.empty(); // 기존 섹션 초기화

		    if (result && result.length > 0) {
		        for (var i = 0; i < result.length; i++) {
		            // 약물 정보 인코딩
		            var encodedItemImage = encodeURIComponent(result[i].item_image);
		            var encodedEntpName = encodeURIComponent(result[i].entp_name);
		            var encodedItemName = encodeURIComponent(result[i].item_name);
		            var warnYn = result[i].warnYn ? result[i].warnYn : 'N'; // warnYn 값이 없을 때 기본값 'N' 설정

		            // 섹션 생성
		            var section = $('<section>', { class: 'medication-info', id: 'section-' + i });
		            
		            // 약 이미지를 클릭하면 상세페이지로 이동
		            var pillImage = $('<div>', {
		                class: 'pill-image'
		            }).append($('<a>', {
		                href: 'detailPage?item_image=' + encodedItemImage +
		                      '&entp_name=' + encodedEntpName +
		                      '&item_name=' + encodedItemName +
		                      '&warnYn=' + warnYn // 클릭 시 정보와 함께 상세 페이지로 이동
		            }).append($('<img>', {
		                src: result[i].item_image,
		                alt: '',
		                class: 'pill-img', // CSS 클래스 추가
		                style: 'cursor: pointer;' // 클릭 가능한 손가락 모양
		            })));
		            
		            // 약 이름과 시간 정보
		            var pillDetails = $('<div>', {
					    class: 'pill-details'
					}).append($('<div>', {
					    class: 'pill-time',
					    html: '약품명: ' + result[i].item_name + '<br>복용시간: ' + result[i].take_time // text 대신 html 사용
					})).append($('<div>', {
					    class: 'pill-company',
					    text: result[i].entp_name
					}));

		            // 복용 확인 버튼 추가
		            var pillTakenButton = $('<button>', {
		                class: 'pill-taken-btn', // CSS 클래스 추가
		                text: '복용 완료', // 버튼에 표시될 텍스트
		                style: 'margin-left: 10px;', // 기본 마진 적용
		                'data-pill-index': i // 약물의 인덱스를 저장 (이후 사용 가능)
		            });

		            if(result[i].item_name != '종합비타민제' && 
		            	    result[i].item_name != '비타민 D' && 
		            	    result[i].item_name != '비타민 C' && 
		            	    result[i].item_name != '칼슘' && 
		            	    result[i].item_name != '유산균(프로바이오틱스)' && 
		            	    result[i].item_name != '비타민 B1(티아민)' && 
		            	    result[i].item_name != '비타민 B2(리보플라빈)' && 
		            	    result[i].item_name != '비타민 B3(니아신)' && 
		            	    result[i].item_name != '비타민 B5(판토텐산)' && 
		            	    result[i].item_name != '비타민 B6(피리독신)' && 
		            	    result[i].item_name != '비타민 B7(비오틴)' && 
		            	    result[i].item_name != '비타민 B9(엽산)' && 
		            	    result[i].item_name != '비타민 B12(코발라민)' && 
		            	    result[i].item_name != '마그네슘' && 
		            	    result[i].item_name != '베타카로틴' && 
		            	    result[i].item_name != '아연' && 
		            	    result[i].item_name != '콜라겐' && 
		            	    result[i].item_name != '비타민 E' && 
		            	    result[i].item_name != '비타민 K' && 
		            	    result[i].item_name != '홍삼' && 
		            	    result[i].item_name != '철분' && 
		            	    result[i].item_name != '오메가3'){
		            	// 각 요소를 섹션에 추가
			            section.append(pillImage).append(pillDetails).append(pillTakenButton);

			            // 섹션을 pillSection에 추가
			            pillSection.append(section).append('<hr>');
		            }
		            
		        }

		        // 동적으로 추가된 버튼에 이벤트 바인딩 (이벤트 델리게이션 사용)
		        pillSection.on('click', '.pill-taken-btn', function() {
		            var index = $(this).data('pill-index');
		            var pillName = result[index].item_name;
		            // 복용 확인 처리 로직 (예: AJAX 호출로 서버에 상태 업데이트)
		            alert(pillName + ' 복용 완료!');
		        });

		    } else {
		        // 약물이 없으면 아무것도 표시하지 않음
		        pillSection.append('<p>복용할 약물이 없습니다.</p>');
		    }
		}

		function fn_addList2() {
		    var result = resultList;
		    var pillSection = $('#supplement-section'); // 영양제가 표시될 섹션 ID
		    
		    pillSection.empty(); // 기존 섹션 초기화

		    if (result && result.length > 0) {
		        for (var i = 0; i < result.length; i++) {
		            // 약물 정보 인코딩
		            var encodedItemImage = encodeURIComponent(result[i].item_image);
		            var encodedEntpName = encodeURIComponent(result[i].entp_name);
		            var encodedItemName = encodeURIComponent(result[i].item_name);
		            var warnYn = result[i].warnYn ? result[i].warnYn : 'N'; // warnYn 값이 없을 때 기본값 'N' 설정

		            // 섹션 생성
		            var section = $('<section>', { class: 'medication-info', id: 'section-' + i });
		            
		            // 약 이미지를 클릭하면 상세페이지로 이동
		            var pillImage = $('<div>', {
		                class: 'pill-image'
		            }).append($('<a>', {
		                href: 'detailPage?item_image=' + encodedItemImage +
		                      '&entp_name=' + encodedEntpName +
		                      '&item_name=' + encodedItemName +
		                      '&warnYn=' + warnYn // 클릭 시 정보와 함께 상세 페이지로 이동
		            }).append($('<img>', {
		                src: result[i].item_image,
		                alt: '',
		                class: 'pill-img', // CSS 클래스 추가
		                style: 'cursor: pointer;' // 클릭 가능한 손가락 모양
		            })));
		            
		            // 약 이름과 시간 정보
		            var pillDetails = $('<div>', {
					    class: 'pill-details'
					}).append($('<div>', {
					    class: 'pill-time',
					    html: '약품명: ' + result[i].item_name + '<br>복용시간: ' + result[i].take_time // text 대신 html 사용
					})).append($('<div>', {
					    class: 'pill-company',
					    text: result[i].entp_name
					}));

		            // 복용 확인 버튼 추가
		            var pillTakenButton = $('<button>', {
		                class: 'pill-taken-btn', // CSS 클래스 추가
		                text: '복용 완료', // 버튼에 표시될 텍스트
		                style: 'margin-left: 10px;', // 기본 마진 적용
		                'data-pill-index': i // 약물의 인덱스를 저장 (이후 사용 가능)
		            });

		            if(result[i].item_name == '종합비타민제' || 
		            	    result[i].item_name == '비타민 D' || 
		            	    result[i].item_name == '비타민 C' || 
		            	    result[i].item_name == '칼슘' || 
		            	    result[i].item_name == '유산균(프로바이오틱스)' || 
		            	    result[i].item_name == '비타민 B1(티아민)' || 
		            	    result[i].item_name == '비타민 B2(리보플라빈)' || 
		            	    result[i].item_name == '비타민 B3(니아신)' || 
		            	    result[i].item_name == '비타민 B5(판토텐산)' || 
		            	    result[i].item_name == '비타민 B6(피리독신)' || 
		            	    result[i].item_name == '비타민 B7(비오틴)' || 
		            	    result[i].item_name == '비타민 B9(엽산)' || 
		            	    result[i].item_name == '비타민 B12(코발라민)' || 
		            	    result[i].item_name == '마그네슘' || 
		            	    result[i].item_name == '베타카로틴' || 
		            	    result[i].item_name == '아연' || 
		            	    result[i].item_name == '콜라겐' || 
		            	    result[i].item_name == '비타민 E' || 
		            	    result[i].item_name == '비타민 K' || 
		            	    result[i].item_name == '홍삼' || 
		            	    result[i].item_name == '철분' || 
		            	    result[i].item_name == '오메가3'){
		            	// 각 요소를 섹션에 추가 
			            section.append(pillImage).append(pillDetails).append(pillTakenButton);

			            // 섹션을 pillSection에 추가
			            pillSection.append(section).append('<hr>');
		            }
		            
		        }

		        // 동적으로 추가된 버튼에 이벤트 바인딩 (이벤트 델리게이션 사용)
		        pillSection.on('click', '.pill-taken-btn', function() {
		            var index = $(this).data('pill-index');
		            var pillName = result[index].item_name;
		            // 복용 확인 처리 로직 (예: AJAX 호출로 서버에 상태 업데이트)
		            alert(pillName + ' 복용 완료!');
		        });

		    } else {
		        // 약물이 없으면 아무것도 표시하지 않음
		        pillSection.append('<p>복용할 약물이 없습니다.</p>');
		    }
		}

    // JavaScript functionality for switching sections
    const 약Button = document.getElementById('약-button');
    const 영양제Button = document.getElementById('영양제-button');
    const 건강관리Button = document.getElementById('건강관리-button');

    const 약Section = document.getElementById('약-section');
    const 영양제Section = document.getElementById('영양제-section');
    const 건강관리Section = document.getElementById('건강관리-section');

    약Button.addEventListener('click', () => {
        약Section.classList.remove('hidden');
        영양제Section.classList.add('hidden');
        건강관리Section.classList.add('hidden');

        약Button.classList.add('active');
        영양제Button.classList.remove('active');
        건강관리Button.classList.remove('active');
    });

    영양제Button.addEventListener('click', () => {
        약Section.classList.add('hidden');
        영양제Section.classList.remove('hidden');
        건강관리Section.classList.add('hidden');

        약Button.classList.remove('active');
        영양제Button.classList.add('active');
        건강관리Button.classList.remove('active');
    });

    건강관리Button.addEventListener('click', () => {
        약Section.classList.add('hidden');
        영양제Section.classList.add('hidden');
        건강관리Section.classList.remove('hidden');

        약Button.classList.remove('active');
        영양제Button.classList.remove('active');
        건강관리Button.classList.add('active');
    });

    // Functionality for date and calendar
    const daysOfWeek = [ '월', '화', '수', '목', '금', '토', '일'];
    const currentDateElement = document.getElementById('current-date');
    const currentDateSupplementElement = document.getElementById('current-date-supplement');
    const currentDateHealthElement = document.getElementById('current-date-health');
    const calendarDatesElement = document.getElementById('calendar-dates');
    const calendarDatesSupplementElement = document.getElementById('calendar-dates-supplement');
    const calendarDatesHealthElement = document.getElementById('calendar-dates-health');

    function updateDate() {
        const today = new Date();
        const year = today.getFullYear();
        const month = today.getMonth() + 1; // getMonth() is zero-based
        const date = today.getDate();
        const day = today.getDay();
        const dayName = daysOfWeek[day];

        const formattedDate = `오늘은 ${year}년 ${month}월 ${date}일 ${dayName}요일입니다.`;
        currentDateElement.textContent = formattedDate;
        currentDateSupplementElement.textContent = formattedDate;
        currentDateHealthElement.textContent = formattedDate;

        // Update calendar dates
        const startOfWeek = new Date(today);
        startOfWeek.setDate(today.getDate() - day);
        calendarDatesElement.innerHTML = '';
        calendarDatesSupplementElement.innerHTML = '';
        calendarDatesHealthElement.innerHTML = '';

        for (let i = 0; i < 7; i++) {
            const weekDate = new Date(startOfWeek);
            weekDate.setDate(startOfWeek.getDate() + i);
            const weekMonth = weekDate.getMonth() + 1;
            const weekDay = weekDate.getDate();

            const dateSpan = document.createElement('span');
            dateSpan.textContent = `${weekMonth}/${weekDay}`;
            if (weekDay === date) {
                dateSpan.style.fontWeight = 'bold';
            }
            calendarDatesElement.appendChild(dateSpan);

            const dateSpanSupplement = dateSpan.cloneNode(true);
            calendarDatesSupplementElement.appendChild(dateSpanSupplement);

            const dateSpanHealth = dateSpan.cloneNode(true);
            calendarDatesHealthElement.appendChild(dateSpanHealth);
        }
    }

    updateDate();

    // Add click event to footer icons for navigation
    let exerciseDay = 0;
	let smokingDay = 0;
	let drinkingDay = 0;
	
	const motivationalMessages = {
	    1: "시작이 반입니다! 오늘의 한 걸음이 큰 변화를 이끌 거예요. 계속 힘내세요!",
	    2: "어제의 당신보다 더 강해졌어요. 꾸준함이 곧 성공의 열쇠입니다!",
	    3: "3일 동안 꾸준히 해냈다는 것 자체가 놀라운 일이에요! 앞으로의 길도 계속 빛날 거예요.",
	    7: "벌써 1주일이 지났어요! 작은 변화들이 쌓여 큰 성과를 이룰 겁니다.",
	    14: "2주 동안 꾸준히 노력한 당신, 정말 대단해요!",
	    21: "3주가 흘렀네요! 진짜로 큰 발전을 이루고 있어요.",
	    30: "한 달 동안 해냈어요! 그동안의 노력이 절대 헛되지 않았음을 기억하세요.",
	    50: "50일간 꾸준히 달려온 당신, 정말 굳건해요.",
	    80: "80일 동안의 여정, 정말 멋집니다! 어떤 도전도 이겨낼 수 있어요.",
	    100: "100일 동안의 노력이 결실을 맺고 있어요! 끝까지 나아가요!"
	};
	
	document.getElementById("exercise-yes").addEventListener("click", function() {
	    if (exerciseDay < 1) {
	        exerciseDay++;
	        document.getElementById("exercise-day").innerText = exerciseDay;
	        showPopup(motivationalMessages[exerciseDay] || "계속하세요!");
	
	        this.disabled = true;
	        this.style.backgroundColor = "blue";
	        this.style.color = "white";
	        document.getElementById("exercise-no").disabled = true;
	        document.getElementById("exercise-no").style.color = "gray";
	    }
	});
	
	function showPopup(message) {
	    document.getElementById("popup-message").innerText = message;
	    document.getElementById("popup").classList.remove("hidden");
	}
	
	document.getElementById("popup-close").addEventListener("click", function() {
	    document.getElementById("popup").classList.add("hidden");
	});

</script>

</body>
</html>

