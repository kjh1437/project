<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="../resources/css/map.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15780cf657d111b2a5159836bf025334&libraries=services"></script>
    <link rel="shortcut icon" href="#">
    <title>병원, 약국 검색</title>
    <style>
        #category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
        #category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
        #category li.on {background: #eee;}
        #category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
        #category li:last-child{margin-right:0;border-right:0;}
        #category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
        #category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
        #category li .bank {background-position: -10px 0;}
        #category li .mart {background-position: -10px -36px;}
        #category li .pharmacy {background-position: -10px -72px;}
        #category li .oil {background-position: -10px -108px;}
        #category li .cafe {background-position: -10px -144px;}
        #category li .store {background-position: -10px -180px;}
        #category li.on .category_bg {background-position-x:-46px;}
        .placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
        .placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
        .placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
        .placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
        .placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
        .placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
        .placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
        .placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
        .placeinfo .tel {color:#0f7833;}
        .placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
    </style>
</head>
<body>
    <header>
        <div class="back-button">
            <img src="resources/img/goback.png" alt="뒤로가기" onclick="goBack()">
            	<script>function goBack() {
            		window.history.back();
            		}
            	</script>
            <span class="header-title">병원 / 약국 찾기</span>
        </div>
        <img src="resources/img/logo2.png" alt="로고" class="logo">
    </header>

    <div class="map_wrap">
        <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
        <ul id="category">
            <li id="PM9" data-order="0"> 
                <span class="category_bg pharmacy"></span>
                약국
            </li>  
            <li id="HP8" data-order="1"> 
                <span class="category_bg store"></span>
                병원
            </li>      
        </ul>
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
        // 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀 오버레이입니다
        var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
            contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
            markers = [], // 마커를 담을 배열입니다
            currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
        
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(36.950113131872314, 127.90812218200554), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };  

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 

        // 장소 검색 객체를 생성합니다
        var ps = new kakao.maps.services.Places(map); 

        // 지도에 idle 이벤트를 등록합니다
        kakao.maps.event.addListener(map, 'idle', searchPlaces);

        // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
        contentNode.className = 'placeinfo_wrap';

        // 커스텀 오버레이 컨텐츠를 설정합니다
        placeOverlay.setContent(contentNode);  

        // 각 카테고리에 클릭 이벤트를 등록합니다
        addCategoryClickEvent();

        // 카테고리 검색을 요청하는 함수입니다
        function searchPlaces() {
            if (!currCategory) {
                return;
            }
            
            // 커스텀 오버레이를 숨깁니다 
            placeOverlay.setMap(null);

            // 지도에 표시되고 있는 마커를 제거합니다
            removeMarker();
            
            ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
        }

        // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
        function placesSearchCB(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {
                displayPlaces(data);
            }
        }

        // 지도에 마커를 표출하는 함수입니다
        function displayPlaces(places) {
            var order = document.getElementById(currCategory).getAttribute('data-order');

            for (var i = 0; i < places.length; i++) {
                var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                    marker = addMarker(placePosition, order);

                // 마커에 클릭이벤트를 등록합니다
                (function(marker, place) {
                    kakao.maps.event.addListener(marker, 'click', function() {
                        displayPlaceInfo(place);
                    });
                })(marker, places[i]);
            }
        }

        // 마커를 생성하는 함수입니다
        function addMarker(position, order) {
            var marker = new kakao.maps.Marker({
                position: position, 
                map: map,
                clickable: true
            });

            markers.push(marker); // 생성된 마커를 배열에 추가합니다

            return marker;
        }

        // 마커를 제거하는 함수입니다
        function removeMarker() {
            for (var i = 0; i < markers.length; i++) {
                markers[i].setMap(null);
            }
            markers = [];
        }

        // 장소의 정보를 커스텀 오버레이로 표시하는 함수입니다
        function displayPlaceInfo(place) {
            var content = '<div class="placeinfo">' +
                          '   <div class="title">' + place.place_name + '</div>';

            if (place.road_address_name) {
                content += '    <div class="jibun">' + place.road_address_name + '</div>';
            } else {
                content += '    <div class="jibun">' + place.address_name + '</div>';
            }
            
            content += '    <div class="tel">' + place.phone + '</div>' +
                       '</div>';

            contentNode.innerHTML = content;
            placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
            placeOverlay.setMap(map);
        }

        // 카테고리 클릭 이벤트를 추가하는 함수입니다
        function addCategoryClickEvent() {
            var category = document.getElementById('category'),
                children = category.children;

            for (var i=0; i<children.length; i++) {
                children[i].onclick = onCategoryClick;
            }
        }

        // 카테고리 클릭 시 호출되는 함수입니다
        function onCategoryClick() {
            var id = this.id;

            if (currCategory !== id) {
                currCategory = id; 
                removeMarker(); // 마커를 제거합니다
                searchPlaces(); // 장소 검색을 요청합니다
            }
        }
    </script>
</body>
</html>
