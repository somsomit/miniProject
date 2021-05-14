<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�� �󼼺���</title>
		<link rel="stylesheet" type="text/css" href="/include/css/board.css"/>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="/include/js/common.js"></script>
		<script type="text/javascript">
		var butChk = 0; // ����, ���� ���п�
		$(function(){
			$("#pwdChk").hide();
			
			/* ���� �̹��� ��� */
			var file = "<c:out value='${boardDetail.b_file}'/>";
			if(file != ""){
				$("#fileImage").attr({
					src : "/uploadStorage/${boardDetail.b_file}",
					width : "450px",
					height : "400px"
				});
			}
			
			/* ��� ��ư Ŭ�� �� �̺�Ʈ */
			$("#boardList").click(function(){
				location.href="/board/boardList.som";
			});
			
			/* ���� ��ư Ŭ�� �� �̺�Ʈ */
			$("#updateForm").click(function(){
				$("#pwdChk").show();
				$("#msg").text("�ۼ� �� �Է��� ��й�ȣ�� �Է����ּ���.").css("color", "#000099");
				butChk = 1;
			});
			
			/* ���� ��ư Ŭ�� �� �̺�Ʈ */
			$("#boardDelete").click(function(){
				$("#pwdChk").show();
				$("#msg").text("�ۼ� �� �Է��� ��й�ȣ�� �Է����ּ���.").css("color", "#000099");
				butChk = 2;
			});
			
			/* ��й�ȣ Ȯ�� ��ư Ŭ�� �� �̺�Ʈ */
			$("#pwdBut").click(function(){
				pwdConfirm();
			});
			
		});
		function pwdConfirm(){
			$.ajax({
				url : "/board/pwdConfirm.som",
				type : "POST",
				data : $("#f_pwd").serialize(),
				error : function(){
					alert("������ �߻��߽��ϴ�. �ٽ� �õ��غ�����.");
				},
				success : function(resultData){
					var goUrl = "";
					if(resultData == 0){
						$("#msg").text("�ۼ� �� �Է��� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.").css("color", "red");
						$("#b_pwd").select();
					}else if(resultData == 1){
						$("#msg").text("");
						if(butChk == 1){
							goUrl = "/board/updateForm.som";
						}else if(butChk == 2){
							goUrl = "/board/boardDelete.som";
						}
						$("#f_data").attr("action", goUrl);
						$("#f_data").submit();
					}
				}
			});
		}
		</script>
	</head>
	<body>
		<div id="boardTit"><h3>�� ��</h3></div>
		<form name="f_data" id="f_data" method="POST">
			<input type="hidden" name="b_num" value="${boardDetail.b_num}"/>
			<input type="hidden" name="b_file" id="b_file" value="${boardDetail.b_file}"/>
		</form>
		<!-- ��й�ȣ Ȯ�� ��ư �� �߰� ��ư -->
		<table id="boardPwdBut">
			<tr>
				<td id="btd1">
					<div id="pwdChk">
						<form id="f_pwd" name="f_pwd">
							<input type="hidden" name="b_num" id="b_num" value="${boardDetail.b_num}"/>
							<label for="b_pwd" id="b_pwd"> ��й�ȣ : </label>
							<input type="password" id="b_pwd" name="b_pwd"/>
							<input type="button" id="pwdBut" value="Ȯ��"/>
							<span id="msg"></span>
						</form>
					</div>
				</td>
				<td id="btd2">
					<input type="button" value="����" id="updateForm">
					<input type="button" value="����" id="boardDelete">
					<input type="button" value="���" id="boardList">
				</td>
			</tr>
		</table>
		<!-- ��й�ȣ Ȯ�� ��ư �� �߰� ��ư �� -->
		<div id="boardDetail">
			<table>
				<colgroup>
					<col width="25%"/>
					<col width="25%"/>
					<col width="25%"/>
					<col width="25%"/>
				</colgroup>
				<tbody>
					<tr>
						<td class="ac">�ۼ���</td>
						<td> ${boardDetail.b_name}</td>
						<td class="ac">�ۼ���</td>
						<td> ${boardDetail.b_insertdate}</td>
					</tr>
					<tr>
						<td class="ac">����</td>
						<td colspan="3">${boardDetail.b_title}</td>
					</tr>
					<tr class="ctr">
						<td class="ac">����</td>
						<td colspan="3">${boardDetail.b_content}</td>
					</tr>
					<tr class="ctr">
						<td class="ac">÷������ </td>
						<td colspan="3"><img id="fileImage" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</body>
</html>