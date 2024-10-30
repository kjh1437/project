<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title> Welcome to PILL&YOU </title>
    <link rel="stylesheet" href="../resources/css/quickinfo.css">
</head>
<body>
    <div class="container">
        <!-- Slide 1 -->
        <div class="slide">
            <button class="skip-button" onclick="skip()">건너뛰기</button>
            <img src="resources/img/start1.png" alt="Start 1" id="slide-img">
            <div class="bold-text" id="bold-text">이제 깜빡하지 말고 챙겨 드세요.</div>
            <div class="normal-text" id="normal-text">알림 설정을 통해 복용 타임을 알려드릴게요.</div>
            <div class="dots">
                <div class="dot active"></div>
                <div class="dot"></div>
                <div class="dot"></div>
            </div>
            <button class="nav-button left" onclick="prevSlide()">&#x276E;</button>
            <button class="nav-button right" onclick="nextSlide()">&#x276F;</button>
            <button class="start-button" onclick="startApp()">PILL&YOU 시작하기</button>
        </div>
        
        <!-- Slide 2 -->
        <div class="slide">
            <button class="skip-button" onclick="skip()">건너뛰기</button>
            <img src="resources/img/start2.png" alt="Start 2" id="slide-img">
            <div class="bold-text" id="bold-text">약품을 검색해서 필요한 정보를 확인하세요.</div>
            <div class="normal-text" id="normal-text">약품 복용 방법 그리고 주의사항도 체크할 수 있어요.</div>
            <div class="dots">
                <div class="dot"></div>
                <div class="dot active"></div>
                <div class="dot"></div>
            </div>
            <button class="nav-button left" onclick="prevSlide()">&#x276E;</button>
            <button class="nav-button right" onclick="nextSlide()">&#x276F;</button>
            <button class="start-button" onclick="startApp()">PILL&YOU 시작하기</button>
        </div>
        
        <!-- Slide 3 -->
        <div class="slide">
            <button class="skip-button" onclick="skip()">건너뛰기</button>
            <img src="resources/img/start3.png" alt="Start 3" id="slide-img">
            <div class="bold-text" id="bold-text">함께 건강한 습관 만들어봐요.</div>
            <div class="normal-text" id="normal-text">바쁜 일상 속 작은 목표 조금씩 달성해봐요.</div>
            <div class="dots">
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot active"></div>
            </div>
            <button class="nav-button left" onclick="prevSlide()">&#x276E;</button>
            <button class="start-button" onclick="startApp()">PILL&YOU 시작하기</button>
        </div>
    </div>

    <script>
        let currentSlide = 0;
        const container = document.querySelector('.container');
        const dots = document.querySelectorAll('.dot');
        const slideImg = document.getElementById('slide-img');
        const boldText = document.getElementById('bold-text');
        const normalText = document.getElementById('normal-text');
        const startButtons = document.querySelectorAll('.start-button'); // 모든 시작 버튼 선택

        const slideData = [
            {
                img: "resources/img/start1.png",
                bold: "이제 깜빡하지 말고 챙겨 드세요.",
                normal: "알림 설정을 통해 복용 타임을 알려드릴게요."
            },
            {
                img: "resources/img/start2.png",
                bold: "약품을 검색해서 필요한 정보를 확인하세요.",
                normal: "약품 복용 방법 그리고 주의사항도 체크할 수 있어요."
            },
            {
                img: "resources/img/start3.png",
                bold: "함께 건강한 습관 만들어봐요.",
                normal: "바쁜 일상 속 작은 목표 조금씩 달성해봐요."
            }
        ];

        function showSlide(index) {
            // 슬라이드 변경
            slideImg.src = slideData[index].img;
            boldText.innerText = slideData[index].bold;
            normalText.innerText = slideData[index].normal;

            // 슬라이드 애니메이션
            container.style.transform = `translateX(-${index * 100}%)`;

            // 활성화된 점(dot) 변경
            dots.forEach((dot, i) => {
                if (i === index) {
                    dot.classList.add('active');
                } else {
                    dot.classList.remove('active');
                }
            });

            // 마지막 슬라이드에서만 시작 버튼 활성화
            startButtons.forEach((btn, i) => {
                if (index === 2) {
                    btn.classList.add('active');
                } else {
                    btn.classList.remove('active');
                }
            });
        }

        function skip() {
            window.location.href = "home"; // "건너뛰기" 버튼 클릭 시 메인 페이지로 이동
        }

        function startApp() {
            window.location.href = "home"; // 마지막 슬라이드에서 "PILL&YOU 시작하기" 버튼 클릭 시 메인 페이지로 이동
        }

        function prevSlide() {
            if (currentSlide > 0) {
                currentSlide -= 1;
                showSlide(currentSlide);
            }
        }

        function nextSlide() {
            if (currentSlide < 2) {
                currentSlide += 1;
                showSlide(currentSlide);
            }
        }

        let startX;
        container.addEventListener('touchstart', (e) => {
            startX = e.touches[0].clientX;
        });

        container.addEventListener('touchmove', (e) => {
            const moveX = e.touches[0].clientX;
            const diffX = startX - moveX;
            if (diffX > 50) {
                nextSlide();
                startX = moveX;
            } else if (diffX < -50) {
                prevSlide();
                startX = moveX;
            }
        });
    </script>
</body>
</html>