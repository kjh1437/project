<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../resources/css/pillSear.css">
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.4.1.js" 
    integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" 
    crossorigin="anonymous"></script>  
    <title>Pill name search Page</title>
</head>

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

    <div class="nav-buttons">
    	<a href="shapeSear"><button  class="nav-button " id="shape-search-button">모양으로 검색</button></a>
        <button class="nav-button selected" id="name-search-button">이름으로 검색</button>
    </div>

    <div class="content-section">
        <div id="name-search" class="search-container">
            <div id="search">
				<input type="text" placeholder="의약품명을 입력해주세요" class="text" id="inputPillNm" onkeyup="if(window.event.keyCode==13){fn_search()}"/>
				<img src="resources/img/search.png" alt="" id="icon" onclick="fn_search()" />
			</div>
		
            <hr class="divider">
            <div class="quick-search-section">
                아래 증상으로 빠르게 검색하기<br><br>
                <div>
                    <button class="quick-search-button" id="cold" value="cold" onclick="fn_search2('감기')">감기</button>
                    <button class="quick-search-button" id="digestion" value="digestion" onclick="fn_search2('소화')">소화</button><br>
                    <button class="quick-search-button" id="diarrhea" value="diarrhea" onclick="fn_search2('설사')">설사</button>
                    <button class="quick-search-button" id="fever" value="fever" onclick="fn_search2('해열')">해열</button><br>
                    <button class="quick-search-button" id="growth" value="growth" onclick="fn_search2('성장')">성장</button>
                    <button class="quick-search-button" id="atopy" value="atopy" onclick="fn_search2('아토피')">아토피</button><br>
                    <button class="quick-search-button" id="sleep" value="sleep" onclick="fn_search2('수면')">수면</button>
                    <button class="quick-search-button" id="anxiety" value="anxiety" onclick="fn_search2('불안')">불안</button><br>
                    <button class="quick-search-button" id="adhd" value="adhd" onclick="fn_search2('adhd')">ADHD</button>
                    <button class="quick-search-button" id="impulse" value="impulse" onclick="fn_search2('충동')">충동</button>
                </div>
            </div>
        </div>
    </div>

    <div class="scrollBar">
        <div style="margin-top: 50px;">
            <!-- List -->
            <div id="pillList">
                <!-- 검색된 약 리스트가 여기에 추가됩니다. -->
            </div>
        </div> 
    </div>
    
    <footer>
        <div class="footer-icon-container" id="alarm">
            <a href="alarm"><img src="resources/img/alarm.png" alt="복용 관리" class="footer-icon"></a>
        </div>
        <div class="footer-icon-container" id="search11">
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
        // 검색 기능
         $(document).ready(function(){     
          $('#bookmarkBtn').on('click', function() {
              addBookmark(); // 북마크 추가 함수 호출   
          });
       });          
       
       var resultList; 
       var encodedItemImage;
       var encodedEntpName;
       var encodedItemName; 
       
       function fn_addList() {
           var result = resultList;
           var pillList = $('#pillList');
      
           if (result && result.length > 0) {
               for (var i = 0; i < result.length; i++) {
                    
                  let item_seq = result[i].item_seq;
                   let item_image = result[i].item_image;
                   let entp_name = result[i].entp_name;
                   let item_name = result[i].item_name;
                   let warnYn = result[i].warnYn;

                   var ul = $('<ul>');
                   var li1 = $('<li>').append($('<img>', {
                       src: item_image,
                       alt: '',
                       id: 'sub',
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
                   
                   encodedItemSeq = encodeURIComponent(result[i].item_seq);
                   encodedItemImage = encodeURIComponent(result[i].item_image);
                  encodedEntpName = encodeURIComponent(result[i].entp_name);
                  encodedItemName = encodeURIComponent(result[i].item_name);
                  encodedWarnYn = encodeURIComponent(result[i].warnYn);
                  
                   var li3 = $('<li>').append($('<a>', { 
                       href: 'detailPage?item_seq=' + encodedItemSeq + '&item_image=' + encodedItemImage + '&entp_name=' + encodedEntpName + '&item_name=' + encodedItemName +'&warnYn='+ encodedWarnYn,
                       style: 'display: inline-block;'
                   }).append($('<img>', {
                       src: 'resources/img/next.png',
                       width: '20',
                       height: '20',
                       id: 'next'
                   })));
                   
                   var li4 = $('<li>').append($('<button>', {
                       text: '북마크 추가',
                       id: 'bookmarkBtn',
                       style: 'margin-top: 5px;' 
                   }));

                   li4.find('#bookmarkBtn').on('click', function() {
                       addBookmark(item_seq, item_image, entp_name, item_name);
                   });

                   ul.append(li1).append(li2).append(li3).append(li4);
                   pillList.append(ul).append('<hr>');
               }
           }
       }  
     
      
             
       const text = document.getElementsByClassName("text")[0];
       const btn = document.getElementById("icon");
       
       
       function fn_search() {
           if (!text.value) {
               alert("검색하실 의약품명을 입력해주세요.");
               return;
           }

           var pillNm = $('#inputPillNm').val();

           var data = {
               itemNm: pillNm,
           };
           console.log(data);

           $.ajax({
               type: "post",
               url: "/searchPillNm",
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
       
       function fn_search2(keyword) {

           var data = {
        	   keyword: keyword
           };
           console.log(data);

           $.ajax({
               type: "post",
               url: "/searchKeyword",
               data: JSON.stringify(data),
               contentType: "application/json; charset=UTF-8",
               dataType: "json",
               success: function (result) {
            	   console.log(result); 
   	         	// 검색 결과를 로컬 스토리지에 저장
   	         	const data = JSON.stringify(result);
				console.log(data.length);
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
