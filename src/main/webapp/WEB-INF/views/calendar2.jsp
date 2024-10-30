<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
<link href="../resources/css/calendar2.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>달력</title>
</head>
<body>
<header>
        <div class="back-button">
            <img src="resources/img/goback.png" alt="뒤로가기" onclick="goBack()">
            	<script>function goBack() {
            		window.history.back();
            		}
            	</script>
            <span class="header-title">약 추가하기</span>
        </div>
        <img src="resources/img/logo2.png" alt="로고" class="logo">
    </header>
<table align="center" id="calendar">
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
	</table>

<script>
	//페이지가 로드될 때 자동으로 달력 표시
	$(document).ready(function() {
		fn_selectBookmark();
	    autoReload();
	});
	
	var resultList = "";     
	 function fn_selectBookmark() {
	     $.ajax({  
	         type: "post",
	         url: "selectBookmarkSupplement",
	         contentType: "application/json; charset=UTF-8",
	         dataType: "json",   
	         success: function(result) {
	             resultList = result;
	             //fn_addList(); 
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
		    
		    var str = "";
		    
		    // 날짜를 좌측 상단에 표시하기 위한 div 추가
		    str += "<div class='date'>" + i + "</div>";
		    
		    var day = (i < 10) ? "0" + i : i;            	
		    var year = nMonth.getFullYear(); // 현재 달력의 연도
		    var month = (nMonth.getMonth() + 1).toString().padStart(2, '0'); // 현재 달력의 월 (두 자릿수로 만들기)
		    var day = i.toString().padStart(2, '0'); // 일 (두 자릿수로 만들기)

		    // 콘텐츠를 가운데에 배치하기 위한 div 추가
		    str += "<div class='content' id='" + year + month + day + "'></div>"; // id를 'YYYYMMDD' 형식으로 설정

		    cell.innerHTML = str;
		    
		    // 높이 일정하게 맞추기 위해 CSS 적용
		    cell.style.height = '100px'; // 셀 높이 고정
		    
		    cnt = cnt + 1;
		    
		    // 토요일 색상 처리
		    if (cnt % 7 == 6) {
		        cell.style.color = "#009de0";
		        cell.style.backgroundColor = "#f7f7f7";                    
		    }

		    // 일요일 색상 처리
		    if (cnt % 7 == 0) {
		        row = calendar.insertRow(); // 줄 추가
		        cell.style.color = "#ed5353";
		        cell.style.backgroundColor = "#f7f7f7";
		    }
		    
		    // 마지막 날짜가 지나면 일요일까지 칸 그리기
		    if (lastDate.getDate() == i && (cnt % 7 != 0)) {
		        var add = 7 - (cnt % 7);
		        for (var k = 1; k <= add; k++) {
		            cell = row.insertCell();
		            cell.style.height = '100px'; // 남은 셀에도 높이 설정
		            cnt = cnt + 1;
		        }
		    }

		    // 오늘날짜 배경색
		    if (today.getFullYear() == date.getFullYear() && today.getMonth() == date.getMonth() && i == date.getDate()) {
		        cell.style.backgroundColor = "#e2f3da"; // 오늘 날짜 배경색
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
		var takeDay = "";
		var takeBegin = "";
		var takeEnd = "";
		var itemName = "";
		
		/*for (i = 0; i < resultList.length; i++) {
		    var takeDay = resultList[i].take_day; // 요일 문자열 (예: "월|수|금")
		    var takeBegin = resultList[i].take_begin; // 시작일
		    var takeEnd = resultList[i].take_end; // 종료일
		    var itemName = resultList[i].item_name; // 아이템 이름
		    var itemImage = resultList[i].item_image; // 아이템 이미지

		    // takeDay를 '|'로 분리하여 배열로 변환
		    var daysArray = takeDay.split('|'); // 예: ["월", "수", "금"]

		    // 시작일부터 종료일까지 반복
		    for (j = Number(takeBegin); j <= Number(takeEnd); j++) {
		        var currentDate = new Date(today.getFullYear(), today.getMonth(), j); // 현재 날짜 객체 생성
		        var currentDay = currentDate.getDay(); // 현재 요일 (0: 일요일, 1: 월요일, ..., 6: 토요일)

		        // 요일 배열: 0: '일요일', 1: '월요일', 2: '화요일', 3: '수요일', 4: '목요일', 5: '금요일', 6: '토요일'
		        var weekDays = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];

		        // 현재 요일을 문자열로 변환
		        var currentDayName = weekDays[currentDay]; // 현재 요일 이름

		        // daysArray에 현재 요일이 포함되어 있는지 확인
		        if (daysArray.includes(currentDayName)) {
		            var element = document.getElementById(j);

		            // 아이템 이름과 이미지 태그를 한 번에 추가
		            var content = "<img src='" + itemImage + "' alt='" + itemName + "' style='width: 40px; height: 40px;'>" +
		                          "<p>" + itemName + "</p>";

		            // 기존 내용에 이름과 이미지를 함께 추가
		            element.innerHTML += content;
		        }
		    }
		}*/
		
		for (i = 0; i < resultList.length; i++) {
		    var takeDay = resultList[i].take_day; // 요일 문자열 (예: "월|수|금")
		    var takeBegin = resultList[i].take_begin; // 시작일 (YYYYMMDD 형식)
		    var takeEnd = resultList[i].take_end; // 종료일 (YYYYMMDD 형식)
		    var itemName = resultList[i].item_name; // 아이템 이름
		    var itemImage = resultList[i].item_image; // 아이템 이미지

		    // takeDay를 '|'로 분리하여 배열로 변환
		    var daysArray = takeDay.split('|'); // 예: ["월", "수", "금"]

		    // 요일 배열: 0: '일', 1: '월', ..., 6: '토'
		    var weekDays = ['일', '월', '화', '수', '목', '금', '토'];

		    // 시작일과 종료일을 Date 객체로 변환
		    var startYear = parseInt(takeBegin.substring(0, 4));
		    var startMonth = parseInt(takeBegin.substring(4, 6)) - 1; // 월은 0부터 시작
		    var startDay = parseInt(takeBegin.substring(6, 8));
		    var startDate = new Date(startYear, startMonth, startDay);

		    var endYear = parseInt(takeEnd.substring(0, 4));
		    var endMonth = parseInt(takeEnd.substring(4, 6)) - 1; // 월은 0부터 시작
		    var endDay = parseInt(takeEnd.substring(6, 8));
		    var endDate = new Date(endYear, endMonth, endDay).getDay();
		    
		    var calendarIdArray = [];
		    // 예: id가 20241101, 20241102 ... 이런식으로 되어 있다고 가정
		    document.querySelectorAll("td[id]").forEach(function (element) {
		    	calendarIdArray.push(Number(element.id));  // id 값을 숫자로 변환하여 배열에 추가
		    });
		    
		    // 시작일과 종료일 사이의 날짜를 순회
		    for (j = Number(takeBegin); j <= Number(takeEnd); j++) {
		    	//var takeDaysArray = [];
		    	//takeDaysArray.push(getDayOfWeek(j));
		        // daysArray에 현재 요일이 포함되어 있는지 확인
		        if (daysArray.includes(getDayOfWeek(j))) {
		        	var element = document.getElementById(j);

		            // 아이템 이름과 이미지 태그를 한 번에 추가
		            var content = "<img src='" + itemImage + "' alt='" + itemName + "' style='width: 40px; height: 40px;'>" +
		                          "<p>" + itemName + "</p>";
  
		                          var yearMonthText = $('#yearmonth').text();

		                       // split과 replace를 사용하여 "10" 추출
		                       var month = yearMonthText.split(" ")[1].replace("월", "");
		                       
		            // 기존 내용에 이름과 이미지를 함께 추가
		                       if (month == j.toString().substring(4, 6) && 
		                    		    (itemName == "종합비타민제" || 
		                    		     itemName == "비타민 D" || 
		                    		     itemName == "비타민 C" || 
		                    		     itemName == "칼슘" || 
		                    		     itemName == "유산균(프로바이오틱스)" || 
		                    		     itemName == "비타민 B1(티아민)" || 
		                    		     itemName == "비타민 B2(리보플라빈)" || 
		                    		     itemName == "비타민 B3(니아신)" || 
		                    		     itemName == "비타민 B5(판토텐산)" || 
		                    		     itemName == "비타민 B6(피리독신)" || 
		                    		     itemName == "비타민 B7(비오틴)" || 
		                    		     itemName == "비타민 B9(엽산)" || 
		                    		     itemName == "비타민 B12(코발라민)" || 
		                    		     itemName == "마그네슘" || 
		                    		     itemName == "베타카로틴" || 
		                    		     itemName == "아연" || 
		                    		     itemName == "콜라겐" || 
		                    		     itemName == "비타민 E" || 
		                    		     itemName == "비타민 K" || 
		                    		     itemName == "홍삼" || 
		                    		     itemName == "철분" || 
		                    		     itemName == "오메가3")) {
		                    		    element.innerHTML += content;
		                    		}

		        }
		    }
		}
	}

	function getDayOfWeek(takeYYYYMMDD) {
		
		takeYYYYMMDD = String(takeYYYYMMDD);
		
	    // 문자열에서 연도, 월, 일을 추출
	    const year = parseInt(takeYYYYMMDD.substring(0, 4));  // 연도 추출 (2024)
	    const month = parseInt(takeYYYYMMDD.substring(4, 6)) - 1;  // 월 추출 (0부터 시작하므로 -1)
	    const day = parseInt(takeYYYYMMDD.substring(6, 8));  // 일 추출 (14)

	    // Date 객체 생성
	    const date = new Date(year, month, day);

	    // 요일 배열
	    const days = ['일', '월', '화', '수', '목', '금', '토'];

	    // 요일 구하기
	    return days[date.getDay()];  // 요일 반환
	}

</script>

</body>
</html>