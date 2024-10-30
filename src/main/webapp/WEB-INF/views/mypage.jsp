<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<!DOCTYPE html> 
<html>
<head>
<meta charset="EUC-KR"> 
<link href="../resources/css/mypage.css" rel="stylesheet">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link rel="short icon" href="#">
<title>����������</title>
</head>
<style>
    .info-section {
        display: flex;
        flex-direction: column; /* ���� �������� ��ġ */
        align-items: stretch;   /* ��ư���� ������ �ʺ�� ���� */
    }

    .action-item {
        display: block;
        padding: 15px 20px;
        margin: 5px 0;
        background-color: #4CAF50; /* ��ư ���� */
        color: white;
        text-align: center;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        font-size: 18px;
    }
    
    .action-item:hover {
        background-color: #45a049; /* ȣ�� �� ���� ���� */
    }
</style>
<body>
<header>
        <div class="back-button">
            <img src="resources/img/goback.png" alt="�ڷΰ���" onclick="goBack()">
            	<script>function goBack() {
            		window.history.back();
            		}
            	</script>
            <span class="header-title">��ǰ�˻�</span>
        </div>
        <img src="resources/img/logo2.png" alt="�ΰ�" class="logo">
    </header>

    <div class="profile-section">
        <img src="resources/img/pills.png" alt="������" class="profile-icon">
        <div class="profile-name" id="userName"></div>
    </div>

    <hr class="divider">

    <div class="content">
        <div class="info-section">
            <div class="info-item">
                <div>�̸�</div>
                <div>
                    <span id="name"></span>
                    <button class="edit-button" id='nameEditBtn' >�����ϱ�</button>
                </div>
            </div>
            <div class="info-item">
                <div>����ó</div>
                <div>
                    <span id="phone"></span>
                    <button class="edit-button" id='phoneEditBtn' >�����ϱ�</button>
                </div>
            </div>
            <div class="info-item">
                <div>�������</div>
                <div>
                    <span id="dob"></span>
                    <button class="edit-button" id='dobEditBtn' >�����ϱ�</button>
                </div>
            </div>
            <div class="info-item">
                <div>����</div>
                <div>
                    <span id="gender"></span>
                    <button class="edit-button" id='genderEditBtn' >�����ϱ�</button>
                </div>
            </div>
        </div>
        <div class="info-section">
    		<div class="action-item" onclick="window.location.href='http://localhost:8080/calendar'">������ Ȯ���ϱ�</div>
		    <div class="action-item" onclick="fn_logout()">�α׾ƿ�</div>
		    <div class="action-item" onclick="fn_deleteUser()">Ż���ϱ�</div>
		    <div class="action-item" onclick="appInfo()">�� ����</div>
	</div>
    </div>

    <footer>
	    <div class="footer-icon-container" id="alarm">
	    	<a href="alarm"><img src="resources/img/alarm.png" alt="���� ����" class="footer-icon"></a><!-- ���� ���� -->
	    </div>
	    <div class="footer-icon-container" id="search">
	        <a href="shapeSear"><img src="resources/img/search.png" alt="�� �˻�" class="footer-icon"></a> <!-- �� �˻� -->
	    </div>
	    <div class="footer-icon-container" id="home">
	        <a href="main"><img src="resources/img/home.png" alt="�������� ���ư��� ������" class="footer-icon"></a> <!-- �������� ���ư��� ������ -->
	    </div>
	    <div class="footer-icon-container" id="pharmacy">
	        <a href="map"><img src="resources/img/pharmacy.png" alt="����/�౹ ã��" class="footer-icon"></a> <!-- ����/�౹ ã�� -->
	    </div>
	    <div class="footer-icon-container" id="mypage">
	        <a href="mypage"><img src="resources/img/mypage.png" alt="����������" class="footer-icon"></a> <!-- ���������� -->
	    </div>
	</footer>
    
    <script>
    $(document).ready(function () {
        fn_selectUserInfo();
        
     // '�����ϱ�' ��ư Ŭ�� ��
        $(".edit-button").on("click", function() {
            const field = $(this).attr('id').replace('EditBtn', ''); // 'name', 'phone', 'dob', 'gender' ��������
            const spanElement = $('#' + field);
            const buttonElement = $(this);
            
            // '�����ϱ�' -> '�����ϱ�' ����
            if (buttonElement.text() === '�����ϱ�') {
                const currentValue = spanElement.text(); // ���� ���� ������
                
                // span�� input���� ����
                if(field == "name"){
                	spanElement.html(`<input type="text" id="nameInput" />`);
                } else if (field == "phone"){
                	spanElement.html(`<input type="text" id="phoneInput" />`);
                } else if (field == "dob"){
                	spanElement.html(`<input type="text" id="dobInput" />`);
                }
                
                // ��ư �ؽ�Ʈ�� '�����ϱ�'�� ����
                buttonElement.text('�����ϱ�');
            } 
            // '�����ϱ�' ����
            else {
                saveInfo(field);  // ���� �Լ� ȣ��
                buttonElement.text('�����ϱ�');  // ��ư �ؽ�Ʈ�� �ٽ� '�����ϱ�'�� ����
            }
        });
    });

    function fn_selectUserInfo() {
        var id = '${sessionScope.user != null ? sessionScope.user.id : ""}';
        
        if (id === "") {
            console.error("���ǿ� ����� ID�� �����ϴ�.");
            return;
        }

        var data = {
            id: id
        };
        console.log("������ ������:", JSON.stringify(data));
        
        $.ajax({
            type: "POST",
            url: "/selectUserInfo.do",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify(data),
            dataType: "json",
            success: function(result) {
                console.log("���� ����:", result);

                if (result) {
                    $('#name').text(result.nm || "���� ����");
                    $('#phone').text((result.tel1 || "") + "-" + (result.tel2 || "") + "-" + (result.tel3 || ""));
                    $('#dob').text(result.birth || "���� ����");
                    $('#gender').text(result.sex === 'M' ? '����' : '����');
                } else {
                    alert("�������� ��ȿ�� �����͸� ��ȯ���� �ʾҽ��ϴ�.");
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX ��û ����:", status, error);
                alert("������ �߻��߽��ϴ�. �ٽ� �õ����ּ���.");
            }
        });
    }
    
    // Highlight the active footer icon
    const currentPath = window.location.pathname;
    footerIcons.forEach(icon => {
        if (currentPath.includes(icon.id)) {
            icon.classList.add('active');
        }
    });

    // Function to edit info
   /*  function editInfo(field) { 
    	if(field == 'name'){
    		saveInfo('name');
    	}    //var $span = $('#' + field);
    //var currentValue = $span.text().trim();  // ���� ����
    //var htmlContent = `
    //    <input type="text" id="${field}-input" value="${currentValue}"> 
    //    <button class="edit-button" onclick="saveInfo('${field}')">�����ϱ�</button>
    //`;

    // HTML ������ $span�� ����
    //$span.html(htmlContent);
} */

	//���� ó�� �Լ�
	function saveInfo(field) {
	    const inputElement = $('#' + field + 'Input'); // �ش� input ���
	    const newValue = inputElement.val(); // �Էµ� ��
	    const spanElement = $('#' + field); // �ش� span ���
	
	    // �ʵ忡 ���� �ٸ� ó��
	    if (field === 'name') {
	        // �̸��� �����ϴ� AJAX ��û
	    	$.ajax({
	    	    type: 'POST',
	    	    url: '/updateName',
	    	    contentType: 'application/json', // �� �κ��� �߰�
	    	    data: JSON.stringify({ nm: newValue }),
	    	    success: function(response) {
	    	        alert('�̸��� ���������� ������Ʈ�Ǿ����ϴ�.');
	    	        spanElement.text(newValue);
	    	    },
	    	    error: function() {
	    	        alert('�̸� ������Ʈ�� �����߽��ϴ�.');
	    	    }
	    	});
	    } else if (field === 'phone') {
	        // ����ó�� �����ϴ� AJAX ��û
	        var data = {
			        tel1: newValue.substring(0, 3),
			        tel2: newValue.substring(3, 7),
			        tel3: newValue.substring(7, 11)
			    };
	        
	        $.ajax({
	       	    type: 'POST',
	       	    url: '/updateTel',
	       	    contentType: 'application/json', // �� �κ��� �߰�
	       	    data: JSON.stringify({ tel1: newValue.substring(0, 3),
			        				   tel2: newValue.substring(3, 7),
			        				   tel3: newValue.substring(7, 11) 
			        				 }),
	       	    success: function(response) {
	       	        alert('��ȭ��ȣ�� ���������� ������Ʈ�Ǿ����ϴ�.');
	       	        spanElement.text(newValue.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3'));
	       	    },
	       	    error: function() {
	       	        alert('��ȭ��ȣ ������Ʈ�� �����߽��ϴ�.');
	       	    }
	       	});
	    } else if (field === 'dob') {
	        // ��������� �����ϴ� AJAX ��û
	        $.ajax({
	    	    type: 'POST',
	    	    url: '/updateBirth',
	    	    contentType: 'application/json', // �� �κ��� �߰�
	    	    data: JSON.stringify({ birth: newValue }),
	    	    success: function(response) {
	    	        alert('��������� ���������� ������Ʈ�Ǿ����ϴ�.');
	    	        spanElement.text(newValue);
	    	    },
	    	    error: function() {
	    	        alert('������� ������Ʈ�� �����߽��ϴ�.');
	    	    }
	    	});
	    } 
	}
	
	function fn_logout() {
	    // �α׾ƿ� ��û
	    $.ajax({
	        type: 'GET',
	        url: '/logout.do',
	        success: function() {
	            // �α׾ƿ� �� ���� �������� �����̷�Ʈ
	            window.location.href = '/login';
	        },
	        error: function() {
	            alert('�α׾ƿ� ����. �ٽ� �õ����ּ���.');
	        }
	    });
	    window.location.href = 'http://localhost:8080/login';
	}
    
	function fn_deleteUser(){
		var id = '<c:out value="${sessionScope.user.id}" />';  
		
		 $.ajax({
		        type: "post",  
		        url: "/deleteUser",
		        data: JSON.stringify({ id: id }),
		        contentType: "application/json; charset=utf-8",
		        success: function(response) {  
		        	if(response == 'success'){
		        		console.log(response + "������");  
		        	    
			        	alert("ȸ��Ż�� �Ϸ�Ǿ����ϴ�.");
			        	
			        	window.location.href = "main"; 
		        	}
		        	else{
		        		alert("Ż�� �� ������ �߻��߽��ϴ�.");    
		        	}
		        	     
		        },
		        error: function(xhr, status, error) {
		            console.error("Ajax ����:", status, error);
		            alert("Ż�� �� ������ �߻��߽��ϴ�.");
		        }
		    });    
		 
		 
	}
    
    </script>
    
</body>
</html>