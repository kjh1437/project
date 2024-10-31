<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/emlsignup.css" rel="stylesheet">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link rel="short icon" href="#">
<title>회원가입</title>
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
    
    
   <!-- 회원가입 입력 폼 -->
   <div class="content-section">
      <form id="signup_form" method="post">
         <div class="form-group">
            <label for="id">아이디</label>
            <div class="id-group">
               <input type="text" id="inputId" name="id" placeholder="아이디 입력" class="id">
               <button type="button" name="checkId" class="checkid" id="checkIdBtn">중복 확인</button><br>
                
             <div><span class="id_input_re_0">아이디를 입력하세요.</span></div>  
             <div><span class="id_input_re_1">사용 가능한 아이디입니다.</span></div>
             <div><span class="id_input_re_2">아이디가 이미 존재합니다.</span></div> 
             <div><span class="final_id_ck">아이디를 입력해주세요.</span></div>
           </div>
         </div>
         
         <div class="form-group">
          <label for="password">비밀번호</label>
          <input type="password" id="inputPw" name="pw" placeholder="8자리 이상" class="pw"><br>
          <div><span class="final_pw_ck">비밀번호를 입력해주세요.</span></div> 
         </div>
         
         <div class="form-group">
            <label for="password-confirm">비밀번호 확인</label>
          <input type="password" name="pwpw" placeholder="비밀번호 확인" class="pwpw"><br>
          <div><span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span></div> 
          <div><span class="pwck_input_re_1">비밀번호가 일치합니다.</span></div> 
           <div><span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span></div> 
        </div>
         
         
         <div class="form-group">
            <label for="name">이름</label>
            <input type="text" name="nm" placeholder="이름 입력" class="nm"><br>
            <div><span class="final_name_ck">이름을 입력해주세요.</span></div> 
         </div>
         
         <div class="form-group">
            <label for="birthdate">생년월일</label>
            <input type="text" name="birth" placeholder="ex)20001212" class="birth"><br>
            <span class="final_birth_ck">생년월일을 입력해주세요.</span>
         </div>
         
         <div class="form-group-phone">
            <label for="phone">전화번호</label>
            <input type="text" name="tel1" placeholder="ex)010" class="tel1">
            <input type="text" name="tel2" placeholder="ex)1234" class="tel2">
            <input type="text" name="tel3" placeholder="ex)5678" class="tel3">
            <br>
            <span class="final_tel_ck">전화번호를 입력해주세요.</span>
         </div>
         
         <div class="form-group-sex">
            <div class="text">
            남<input type="checkbox" name="sex" class="cb1" value="M" onclick="validate(); checkOnlyOne(this);">
            여<input type="checkbox" name="sex" class="cb2" value="W" onclick="validate(); checkOnlyOne(this);">
            <div><span class="final_sex_ck">성별을 입력해주세요.</span></div>
            </div><br><br> 
         </div>
         
         <!-- 가입하기 버튼 (로그인 화면 이동) --> 
         <button disabled type="button" name="signup" class="signupBtn" onclick="fn_localStorage()">가입하기</button>
      </form>

   
<script>
/* 유효성 검사 통과유무 변수 */
var idCheck = false;            // 아이디
var idckCheck = false;          // 아이디 중복 검사
var pwCheck = false;            // 비번
var pwckCheck = false;          // 비번 확인
var pwckcorCheck = false;       // 비번 확인 일치 확인
var nameCheck = false;          // 이름
var birthCheck = false;         // 생년월일
var tel1Check = false;         // 전화번호
var tel2Check = false;         // 전화번호
var tel3Check = false;         // 전화번호
var sexCheck = false;           // 성별

$(document).ready(function(){ 
   //회원가입 버튼(회원가입 기능 작동)  
   $(".signupBtn").click(function(){  
        /* 입력값 변수 */
        var id = $('.id').val();                // id 입력란
        var pw = $('.pw').val();                // 비밀번호 입력란
        var pwpw = $('.pwpw').val();            // 비밀번호 확인 입력란
        var nm = $('.nm').val();                // 이름 입력란
        var birth = $('.birth').val();          // 생년월일 입력란
        var tel1 = $('.tel1').val();             // 전화번호
        var tel2 = $('.tel2').val();             // 전화번호
        var tel3 = $('.tel3').val();             // 전화번호
        var sex1 = $('.cb1').val();             // 성별(여) 입력란
        var sex2 = $('.cb2').val();             // 성별(남) 입력란
   
        /* 아이디 유효성검사 */
        if(id == ""){
            $('.final_id_ck').css('display','block');
            idCheck = false;
        }else{
            $('.final_id_ck').css('display', 'none');
            idCheck = true;
        }
        
        /* 비밀번호 유효성 검사 */
        if(pw == ""){
            $('.final_pw_ck').css('display','block');
            pwCheck = false;
        }else{
            $('.final_pw_ck').css('display', 'none');
            pwCheck = true;
        }
           
        /* 비밀번호 확인 유효성 검사 */
        if(pwpw == ""){
            $('.final_pwck_ck').css('display','block');
            pwckCheck = false; 
        }else{
            $('.final_pwck_ck').css('display', 'none');
            pwckCheck = true;
        }
        
        /* 이름 유효성 검사 */
        if(nm == ""){
            $('.final_name_ck').css('display','block');
            nameCheck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            nameCheck = true;
        }
        
        /* 생년월일 유효성 검사 */
        if(birth == ""){
            $('.final_birth_ck').css('display','block');
            birthCheck = false;
        }else{
            $('.final_birth_ck').css('display', 'none');
            birthCheck = true;
        }
        
        /* 전화번호 유효성 검사 */
        if (tel1 == "" || tel2 == "" || tel3 == "") {
            $('.final_tel_ck').css('display', 'block');
            tel1Check = false;
            tel2Check = false;
            tel3Check = false;
        } else {
            $('.final_tel_ck').css('display', 'none');
            tel1Check = true;
            tel2Check = true;
            tel3Check = true;
        }

        
        console.log(idCheck); 
        console.log(idckCheck); 
        console.log(pwCheck); 
        console.log(pwckCheck); 
        console.log(pwckcorCheck); 
        console.log(nameCheck); 
        console.log(birthCheck); 
        console.log(tel1Check); 
        console.log(tel2Check); 
        console.log(tel3Check);
        
        /* 최종 유효성 검사 */   
        if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&birthCheck&&tel1Check&&tel2Check&&tel3Check){
           $("#signup_form").attr("action", "/signup"); 
          $("#signup_form").submit(); 
          // onclick="location.href='http://localhost:8080/login'"
        }   
  
        return false;  
   });
});
 
//아이디 중복검사   
$('#checkIdBtn').on("click", function(){
   var inputId = $('.id').val();  
   
   var idCk = $('.id').val();         
   var data = {id : idCk}            
   
   if(inputId == ""){      
      $('.id_input_re_0').css("display","inline-block"); 
      $('.id_input_re_1').css("display", "none");  
      $('.id_input_re_2').css("display", "none");   
   } else{
      $.ajax({
         type : "post",
         url : "/idChk", 
         data : data,
         success : function(result){
             console.log("성공 여부" + result);
             if(result != 'fail'){
                  $('.id_input_re_1').css("display","inline-block");
                  $('.id_input_re_2').css("display", "none");      
                  $('.id_input_re_0').css("display", "none");   
                  idckCheck = true;
               } else {
                  $('.id_input_re_2').css("display","inline-block");
                  $('.id_input_re_1').css("display", "none");  
                  $('.id_input_re_0').css("display", "none");   
                  idckCheck = false;
               }
         }// success 종료
      }); // ajax 종료     
   }
   

});
 
/* 비밀번호 확인 일치 유효성 검사 */
$('.pwpw').on("propertychange change keyup paste input", function(){
     
    var pw = $('.pw').val();    
    var pwck = $('.pwpw').val();
    $('.final_pwck_ck').css('display', 'none');
 
    if(pw == pwck){
        $('.pwck_input_re_1').css('display','block');
        $('.pwck_input_re_2').css('display','none');
        pwckcorCheck = true;
    }else{
        $('.pwck_input_re_1').css('display','none');
        $('.pwck_input_re_2').css('display','block');
        pwckcorCheck = false;
    }        
    
});    



   /* 회원가입 버튼 활성화/비활성화 */
   const button = document.getElementsByClassName("signupBtn")[0];
   const inputId = document.getElementsByClassName("id")[0];
   const inputPw = document.getElementsByClassName("pw")[0];
   const inputPwpw = document.getElementsByClassName("pwpw")[0];
   const inputName = document.getElementsByClassName("nm")[0];
   const inputBirth = document.getElementsByClassName("birth")[0];
   const inputTel1 = document.getElementsByClassName("tel1")[0];
   const inputTel2 = document.getElementsByClassName("tel2")[0];
   const inputTel3 = document.getElementsByClassName("tel3")[0];
   const selectSex1 = document.getElementsByClassName("cb1")[0];
   const selectSex2 = document.getElementsByClassName("cb2")[0];
   
   inputId.addEventListener("keyup", validate);
   inputPw.addEventListener("keyup", validate);
   inputPwpw.addEventListener("keyup", validate);
   inputName.addEventListener("keyup", validate);
   inputBirth.addEventListener("keyup", validate);
   inputTel1.addEventListener("keyup", validate);
   inputTel2.addEventListener("keyup", validate);
   inputTel3.addEventListener("keyup", validate);
    selectSex1.addEventListener("keyup", validate);
    selectSex2.addEventListener("keyup", validate);
   
   function validate() { 
      if (!(inputId.value && inputPw.value && inputPwpw.value && inputName.value && inputBirth.value && inputTel1.value && inputTel2.value && inputTel3.value && selectSex1.checked || selectSex2.checked)) {
         button.disabled = true;
         button.classList.remove("signupBtnDisabled"); 
      } else {
         button.disabled = false;
         button.style.cursor = "pointer";
         button.classList.add("signupBtnDisabled");
      }
   } 
   
   
    function checkOnlyOne(element) {
      const checkboxes = document.getElementsByName("sex");
      
      checkboxes.forEach((cb) => {
         cb.checked = false;
      })
      
      element.checked = true;
   } 

    function fn_localStorage(){
    // 회원 가입 페이지에서 데이터를 로컬 스토리지에 저장
       var userId = $('#inputId').val(); // 사용자가 입력한 아이디 
       var userPassword = $('#inputPw').val(); // 사용자가 입력한 패스워드

       localStorage.setItem("id", userId);
       localStorage.setItem("pw", userPassword); 
    }
</script>

</body>
</html>