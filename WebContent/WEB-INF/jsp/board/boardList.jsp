<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�� ���</title>
		<link rel="stylesheet" type="text/css" href="/include/css/board.css"/>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
			$(function(){
				/* �۾��� ��ư Ŭ�� �� �ۼ� ������ �̵� */
				$("#writeForm").click(function(){
					location.href="/board/writeForm.som";
				});
				
				/* ������ �������� �̵� */
				$(".goDetail").click(function(){
					var b_num = $(this).parents("tr").attr("data-num");
					$("#b_num").val(b_num);
					$("#detailForm").attr({
						"method" : "get",
						"action" : "/board/boardDetail.som"
					});
					$("#detailForm").submit();
				});
			});
		</script>
	</head>
	<body>
		<div id="boardContatiner">
			<div id="boardTit"><h3>�۸��</h3></div>
			<!-- �� ������ �̵��� ���� form -->
			<form name="detailForm" id="detailForm">
				<input type="hidden" name="b_num" id="b_num">
			</form>
			<%-- ����Ʈ ���� --%>
			<div id="boardList">
				<table summary="�Խ��� ����Ʈ">
					<colgroup>
						<col width="10%" />
						<col width="62%" />
						<col width="15%" />
						<col width="13%" />
					</colgroup>
					<thead>
						<tr>
							<th>�۹�ȣ</th>
							<th>������</th>
							<th>�ۼ���</th>
							<th class="borcle">�ۼ���</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty boardList}">
								<c:forEach var="board" items="${boardList}" varStatus="status">
									<tr align="center" data-num="${board.b_num}">
										<td>${board.b_num}</td>
										<td align="left">
											<span class="goDetail">${board.b_title}</span>
										</td>
										<td>${board.b_insertdate}</td>
										<td>${board.b_name}</td>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" align="center"> ��ϵ� �Խù��� �����ϴ� </td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		<%--����Ʈ ���� --%>
		<div id="boardBut">
			<input type="button" value="�۾���" id="writeForm">
		</div>
	</body>
</html>