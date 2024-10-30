<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title> 
<link rel="stylesheet" href="/resources/css/tjoin.css">
</head>
<body>

<div class="wrapper">
	<form id="join_form" method="post">
	<div class="wrap">
			<div class="subjecet">
				<span>회원가입</span>
			</div>
			<div class="id_wrap">
				<div class="id_name">아이디</div>
				<div class="id_input_box">
					<input class="id_input" name="id"> <!-- 수정: name 속성 추가 -->
				</div>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input class="pw_input" type="password" name="pw"> <!-- 수정: name 속성 추가 및 비밀번호 입력 필드로 변경 -->
				</div>
			</div>
			<div class="pwck_wrap">
				<div class="pwck_name">비밀번호 확인</div>
				<div class="pwck_input_box">
					<input class="pwck_input" type="password" name="PWConfirm"> <!-- 수정: name 속성 추가 및 비밀번호 확인 입력 필드로 변경 -->
				</div>
			</div>
			<div class="user_wrap">
				<div class="user_name">이름</div>
				<div class="user_input_box">
					<input class="user_input" name="nm"> <!-- 수정: name 속성 추가 -->
				</div>
			</div>
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" type="email" name="eml"> <!-- 수정: name 속성 추가 및 이메일 입력 필드로 변경 -->
				</div>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box">
						<input class="mail_check_input" name="EmailCheck"> <!-- 수정: name 속성 추가 -->
					</div>
					<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="tel_wrap">
				<div class="tel_name">주소</div>
				<div class="tel_input_1_wrap">
					<div class="tel_input_1_box">
						<input class="tel_input_1" name="tel1"> <!-- 수정: name 속성 추가 -->
					</div>
					<div class="tel_button">
						<span>주소 찾기</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class ="tel_input_2_wrap">
					<div class="tel_input_2_box">
						<input class="tel_input_2" name="tel2"> <!-- 수정: name 속성 추가 -->
					</div>
				</div>
				<div class ="tel_input_3_wrap">
					<div class="tel_input_3_box">
						<input class="tel_input_3" name="tel3"> <!-- 수정: name 속성 추가 -->
					</div>
				</div>
			</div>
			<div class="join_button_wrap">
				<input type="button" class="join_button" value="가입하기">
			</div>
		</div>
	</form>
</div>

<script>

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(){
		$("#join_form").attr("action", "/signup");
		$("#join_form").submit();
	});
});

</script>

</body>
</html>
