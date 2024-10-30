<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/detailPage.css"
	type="text/css">
	    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	
<meta charset="EUC-KR">
<title>�� ������</title>
</head>
<body>
	<%
        String itemImage = request.getParameter("item_image");
        String entpName = request.getParameter("entp_name");
        String itemName = request.getParameter("item_name");
        String warnYn = request.getParameter("warnYn");
        // URL ���ڵ�
        itemImage = URLDecoder.decode(itemImage, "EUC-KR");
        entpName = URLDecoder.decode(entpName, "EUC-KR");
        itemName = URLDecoder.decode(itemName, "EUC-KR");  
        warnYn = URLDecoder.decode(warnYn, "EUC-KR"); 
        session.setAttribute("itemName", itemName);
    %>
    
	<!-- �� ������ ��� -->
	<div class="top">
		<img src="resources/img/goback.png" alt="ȭ��ǥ" id="arrow"
			onclick="history_back()" />
		<script>  
			function history_back() {
				history.back();    
				//window.location.href = 'pillSear';
			}
			let itemName = '<%= itemName %>'
			let warnYn = '<%= warnYn %>'
			$(document).ready(function(){
				if(warnYn=='null'){
					$("#warn").hide();
				}
				if(warnYn=='Y'&&(itemName.includes('�ƽ��Ǹ�')||itemName.includes('Ÿ�̷���'))){
					$("#warn").hide();
				}else if(itemName.includes('����')||itemName.includes('�н���')){
					$("#warn").show();
				}
				
				
			});
			//if(item_name.startsWith('�ƽ��Ǹ�')||item_name.startsWith('Ÿ�̷���')){
				//$("#warn").props("disabled", true);
			//}
		</script>  
		<h3 class=title>������</h3>   

	</div>
	<!-- ���� �˸� ǥ�� -->

	<div id="warn" style="margin-top:50px;background-color:#bbbbbb;padding:10px" >
	<span style="color: red; font-size: 10px;margin:15px">��</span>�������� �Ǿ�ǰ���� ��ϵ� �׸��Դϴ�.
	</div>


	<!-- ū �̹��� �κ� -->
	<div>
		<img src="<%= itemImage %>" id="img" alt="" width="300" height="250"> 
	</div>

	<!-- ȸ���/��ǰ�� -->
	<div>
		<p style="margin-left:45px;"><%= entpName %></p>     
		<h3 class="pill_name"><%= itemName %></h3>
	</div>
	<hr>

	<!-- ����/������ -->
	<div class="pill_ingredient">
        <h3>���и�</h3>
        <p>
            <% 
                if (itemName.equals("ű�ݵ忡������ĸ��")) {
                    out.print("�Ƽ�Ʈ�ƹ̳���, ī����");
                } else if (itemName.equals("��Ǫ��������")) {
                    out.print("���Ƽ��");
                } else if (itemName.equals("�������ĸ��")) {
                    out.print("����ٽǷ�����");
                } else if (itemName.equals("������6�̺꿬��ĸ��")) {
                    out.print("�̺�������");
                } else if (itemName.equals("���̿�ƾ��")) {
                    out.print("Ŭ���ǵ��׷�");
                } else if (itemName.equals("���Ǵ�����ũ��30�׷�/Ʃ��")) {
                    out.print("�������� ��Ʈ��");
                } else if (itemName.equals("Ʈ������100mg")) {
                    out.print("�ƹ�Ʈ��ƿ��");
                } else if (itemName.equals("�����ξ�")) {
                    out.print("Ŭ�θ���϶��");
                } else if (itemName.equals("����ƾĸ��10mg")) {
                    out.print("�����丮��");
                } else if (itemName.equals("�����䵷��1mg")) {
                    out.print("��������");
                } else if (itemName.equals("����Ÿ������")) {
                    out.print("���ٸ���Ż");
                } else if (itemName.equals("Ÿ�̸ƽ�����ĸ��(�Ƽ�Ʈ�ƹ̳���)")) {
                    out.print("�Ƽ�Ʈ�ƹ̳���");
                } else if (itemName.equals("�ټ�Ʈ����6.25�и��׷�(ī��������)")) {
                    out.print("ī��������");
                } else if (itemName.equals("�����ڵ���5.0�и��׷�")) {
                    out.print("�ڵ���");
                } else if (itemName.equals("����Ʈ���̿���ĸ��")) {
                    out.print("��Ÿ�� K");
                } else if (itemName.equals("���պ�Ÿ����")) {
                    out.print("���� ��Ÿ�� ����");
                } else if (itemName.equals("��Ÿ�� B6(�Ǹ�����)")) {
                    out.print("�Ǹ�����");
                } else {
                    out.print("���� ������ ã�� �� �����ϴ�.");
                }
            %>
        </p>
    </div>

    <div class="pill_take">
        <h3>������</h3>
        <p>
            <% 
                if (itemName.equals("ű�ݵ忡������ĸ��")) {
                    out.print("������ �Ϸ� 3ȸ, 1ȸ 1�� ����");
                } else if (itemName.equals("��Ǫ��������")) {
                    out.print("������ �Ϸ� 2ȸ, 1ȸ 1�� ����");
                } else if (itemName.equals("�������ĸ��")) {
                    out.print("�Ϸ� 1ȸ, ���Ŀ� ����");
                } else if (itemName.equals("������6�̺꿬��ĸ��")) {
                    out.print("������ 4~6�ð� �������� 1�� ����");
                } else if (itemName.equals("���̿�ƾ��")) {
                    out.print("�Ϸ� 1ȸ, ��ħ�� ����");
                } else if (itemName.equals("���Ǵ�����ũ��30�׷�/Ʃ��")) {
                    out.print("1�� 2ȸ ���� ������ ����");
                } else if (itemName.equals("Ʈ������100mg")) {
                    out.print("�Ϸ� 1ȸ, ���ῡ ����");
                } else if (itemName.equals("�����ξ�")) {
                    out.print("�ʿ� �� ����, �ִ� �Ϸ� 3ȸ");
                } else if (itemName.equals("����ƾĸ��10mg")) {
                    out.print("���� 30�� �̳��� ����");
                } else if (itemName.equals("�����䵷��1mg")) {
                    out.print("�ǻ��� ó�濡 ���� ����");
                } else if (itemName.equals("����Ÿ������")) {
                    out.print("�Ϸ� 2~3ȸ, �ǻ��� ���ÿ� ���� ����");
                } else if (itemName.equals("Ÿ�̸ƽ�����ĸ��(�Ƽ�Ʈ�ƹ̳���)")) {
                    out.print("������ 4~6�ð� �������� ����, �ִ� 8��");
                } else if (itemName.equals("�ټ�Ʈ����6.25�и��׷�(ī��������)")) {
                    out.print("�Ϸ� 2ȸ, �Ļ�� �Բ� ����");
                } else if (itemName.equals("�����ڵ���5.0�и��׷�")) {
                    out.print("�ʿ� �� ����, �ִ� �Ϸ� 4ȸ");
                } else if (itemName.equals("����Ʈ���̿���ĸ��")) {
                    out.print("�Ϸ� 1ȸ ����");
                } else if (itemName.equals("���պ�Ÿ����")) {
                    out.print("�Ϸ� 1ȸ, �Ļ� �� ����");
                } else if (itemName.equals("��Ÿ�� B6(�Ǹ�����)")) {
                    out.print("�Ϸ� 1ȸ ����");
                } else {
                    out.print("���� ����� ã�� �� �����ϴ�.");
                }
            %>
        </p>
    </div>
    <hr>

	<!-- ���� �� ���ǻ��� -->
	<div class="pill_caution">
		<h3>���� �� ���ǻ���</h3>
		<a href="caution" style="text-decoration-line: none;"> <img
			src="resources/img/checkcaution.png" alt="���ǻ��׼�����������" id="next" /></a>
	</div>
	<hr>

	<!-- DUR -->
	<div class="pill_take">
		<h3>DUR</h3>
	</div>

	<div id="DUR">
		<h4>����ݱ�</h4>
		<p>����/����</p>

		<h4>Ư�����ɴ�ݱ�</h4>
		<p>����/����</p>

		<h4>�Ӻαݱ�</h4>
		<p>����/����</p>

		<h4>�뷮����</h4>
		<p>����/����</p>

		<h4>�����Ⱓ����</h4>
		<p>����/����</p>

		<h4>��������</h4>
		<p>����/����</p>

		<h4>��������������</h4>
		<p>����/����</p>
		<br>
	</div>
	<br>

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

</body>
</html>