<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="../resources/css/signup.css">
   
</head>
<body>
    <header>
        <div class="back-button">
            <img src="resources/img/goback.png" alt="뒤로가기" onclick="goBack()">
            	<script>function goBack() {
            		window.history.back();
            		}
            	</script>
            <span class="header-title">회원가입</span>
        </div>
        <img src="resources/img/logo2.png" alt="PILL&YOU" class="header-logo">
    </header>

    <div class="logo-section">
        <img src="resources/img/logo.png" alt="PILL&YOU" class="logo-icon">
    </div>

    <div class="content-section">
        <div class="description">이메일로 가입하고 'PILL&YOU'의 다양한 기능을 경험하세요!</div>
        <a href="emlsignup"><button class="signup-button email-signup" id="emailSignupButton">이메일로 가입하기</button>
        <br><br>

        <div class="login-section">
            이미 아이디가 있으신가요? <a href="login">로그인 하기</a>
        </div>
    </div>

</body>
</html>
    </body>
</html>
