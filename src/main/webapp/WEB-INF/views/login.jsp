<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="../resources/css/login.css" rel="stylesheet">
    <title>로그인</title>
    <script src="https://code.jquery.com/jquery-3.4.1.js" 
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <div class="back-button">
            <img src="resources/img/goback.png" alt="뒤로가기" onclick="back()">
            <script>
                function back() {
                	window.location.href = 'http://localhost:8080/home';
                }
            </script>
            <span class="header-title">로그인</span>
        </div>
        <img src="resources/img/logo2.png" alt="로고" class="logo">
    </header>

    <!-- 로그인 입력 폼 -->
    <form id="login_form" method="post">
        <h4>아이디</h4>
        <input type="text" name="id" placeholder="아이디 입력" class="id"><br>

        <h4>비밀번호</h4>
        <input type="password" name="pw" placeholder="비밀번호 입력" class="pw">
        <br><br>

        <c:if test="${result == 0}">
            <div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
        </c:if>
        <br><br><br><br>

        <!-- 로그인 버튼 -->
        <button name="login" class="logBtn" onclick="location.href='main'">로그인</button>
    </form>

    <script>
        $(".logBtn").click(function(){
            $("#login_form").attr("action", "login");
            $("#login_form").submit();
        });

        const button = document.getElementsByClassName("logBtn")[0];
        const inputId = document.getElementsByClassName("id")[0];
        const inputPw = document.getElementsByClassName("pw")[0];

        inputId.addEventListener("keyup", validate);
        inputPw.addEventListener("keyup", validate);

        function validate() {
            if (!(inputId.value && inputPw.value)) {
                button.disabled = true;
            } else {
                button.disabled = false;
            }
        }
    </script>
</body>
</html>