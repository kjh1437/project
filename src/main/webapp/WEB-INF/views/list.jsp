<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="resources/css/list.css" type="text/css">
<title>�� ����Ʈ</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script> 
</head>
<body>
	<header>
		<!-- �˻� â -->
		<div>
			
			<div class="back-button">
            		<img src="resources/img/goback.png" alt="�ڷΰ���" onclick="goBack()">
            	<script>function goBack() {
            		window.history.back();
            		}
            	</script>
				<div id="search">
					<input type="text" placeholder="�Ǿ�ǰ���� �Է����ּ���" class="text" id="inputPillNm"
						onkeyup="if(window.event.keyCode==13){search()}" /> <img
						src="resources/img/search.png" alt="" id="icon" onclick="search()" />
				</div>
			</div>    
        </div>
        <img src="resources/img/logo2.png" alt="�ΰ�" class="logo">
    </header>
	<div style="margin-top: 50px;">
		<p>    �˻����</p>
		<hr>
		<!-- List -->
		<div id="pillList">
			<!-- <ul>
				<li><img src="resources/img/LOGO_FULL.png" alt="" id="sub"
					width="100" height="50"></li>
				<li>
					<div class="company" id="company">ȸ���̸�</div>
					<div class="title" id="itemName">���̸�</div>
				</li>
				<li><img src="resources/img/next.png" width="25" height="25"
					id="next"></li>
			</ul>   
			<hr> -->  
		</div>
	</div><br><br><br>

		
		<!-- footer -->
    <footer id="footer">
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
        // ���� ���丮������ ��� ��������
        var result = JSON.parse(localStorage.getItem('searchResult'));
        var pillList = $('#pillList');
        var encodedItemImage;
    	var encodedEntpName;
    	var encodedItemName; 
    	var encodedwarnYn; 
    	var encodeItemSeq;
    	
        if (result && result.length > 0) {
            // ����� ������ ����Ʈ�� ����
            for (var i = 0; i < result.length; i++) {
            	let item_seq = result[i].item_seq;
            	let item_image = result[i].item_image;
	            let entp_name = result[i].entp_name;
	            let item_name = result[i].item_name;
	            let warnYn = result[i].warnYn;
	              
                // ul ��� ����
                var ul = $('<ul>');

                // li ��� ����
                var li1 = $('<li>').append($('<img>', {
				    src: result[i].item_image,
				    alt: '',
				    id: 'sub',
				    width: '80',
				    height: '50'
				}));   

                var li2 = $('<li>').append($('<div>', {
                    class: 'company',
                    text: result[i].entp_name // ���� ���丮������ entp_name ��������
                })).append($('<div>', {
                    class: 'title',
                    text: result[i].item_name // ���� ���丮������ item_name ��������
                }));

                encodedItemImage = encodeURIComponent(result[i].item_image);
                encodedEntpName = encodeURIComponent(result[i].entp_name);
                encodedItemName = encodeURIComponent(result[i].item_name);
                encodedwarnYn = encodeURIComponent(result[i].warnYn);
                encodeItemSeq = encodeURIComponent(result[i].item_seq);

                var li3 = $('<li>').append($('<a>', {
	                href: 'detailPage?item_image=' + encodedItemImage + '&entp_name=' + encodedEntpName + '&item_name=' + encodedItemName+'&warnYn='+warnYn,
	                style: 'display: inline-block;'
	            }).append($('<img>', {
	                src: 'resources/img/plus.png',
	                width: '20',
	                height: '20',
	                id: 'next'
	            })));
                
                var li4 = $('<li>').append($('<button>', {
	                text: '����ϱ�',
	                id: 'bookmarkBtn',
	                style: 'margin-top: 5px;' 
	            }));

	            li4.find('#bookmarkBtn').on('click', function() {
	                addBookmark(item_seq, item_image, entp_name, item_name);
	                
	                
	            });

                // ul�� li�� �߰�
                ul.append(li1).append(li2).append(li3).append(li4);

                // pillList�� ul �߰�
                pillList.append(ul).append('<hr>');
            }
        }
    });  
	   
		const text = document.getElementsByClassName("text")[0];
		const btn = document.getElementById("icon");

		function search() {
			if (!text.value) {
				alert("�˻��Ͻ� �Ǿ�ǰ���� �Է����ּ���.");
			}
			var pillNm = $('#inputPillNm').val();

			var data = {
				itemNm : pillNm,
			};
			console.log(data);

			$.ajax({
				type : "post",
				url : "/searchPillNm",
				data : JSON.stringify(data),
				contentType : "application/json; charset=UTF-8",
				dataType : "json",
				success : function(result) {
					console.log(result);
					resultList = result;

					// �˻� ����� ���� ���丮���� ����
					localStorage.setItem('searchResult', JSON.stringify(result));

					//URL�� ���𷺼�  
					window.location.href = 'list';

					if (result == null) {
						alert("�๰ ������ �������� �� �����߽��ϴ�.");
					}
				},
				error : function(xhr, status, error) {
					console.error("Ajax ����:", status, error);
					alert("������ �߻��߽��ϴ�. �ٽ� �õ����ּ���.");
				}
			});
		}
		
		function addBookmark(item_seq, item_image, entp_name, item_name) {
			/* var atpnQesitm;
			document.addEventListener('DOMContentLoaded', function(){
		        // Fetch API�� ����� Ajax ��û
		        fetch('https://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?serviceKey=RlP5Qs6W7JzE4R72UmPN5dqZ5zMcFWMluYCsSwarFUzSHvlUdP3ZRc8t72i4LF9oM2SbnfiD%2FF4YOVKFJvVQqw%3D%3D&pageNo=1&numOfRows=3&type=json&itemSeq=200003092') // ���� API ��������Ʈ�� ��ü�ؾ� �մϴ�.
		            .then(response => response.json())
		            .then(data => {
		                // API ���� ���� �� ����Ǵ� �Լ�
		                // �޾ƿ� �����͸� ȭ�鿡 ǥ��
		                console.log(data)
		                atpnQesitm = data.body.items[0].seQesitm;
		                console.log(JSON.stringify(store))
		                //$("#caution").innerHTML=(JSON.stringify(showData))
		                //document.getElementById('caution').innerHTML = 'API Response: ' + JSON.stringify(data);
		            })
		        }) */
		        
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
		            alert('��ǰ�� �߰��Ǿ����ϴ�.');
		            
		         // �Ķ���� ���ڵ� ó��
		            const encodedItemName = encodeURIComponent(item_name);
		            const encodedEntpName = encodeURIComponent(entp_name);
		            const encodedItemImage = encodeURIComponent(item_image);
		            
					// �ش� ��ũ�� �����̷��� (�Ķ���� ����)
					window.location.href = "http://localhost:8080/addmedicine?item_name=" + encodedItemName + "&entp_name=" + encodedEntpName + "&item_image=" + encodedItemImage;          
		        },
		        error: function(xhr, status, error) {
		            console.error('Ajax ����:', status, error);
		            alert('�ϸ�ũ �߰� �� ������ �߻��߽��ϴ�.');
		        }
		    }); 
			
		  	// �˻� ����� ���� ���丮���� ����
			localStorage.setItem('bookmarkList', JSON.stringify(result));
		}
	</script>

	


</body>
</html>